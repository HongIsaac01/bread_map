import React, { useState, useEffect, useMemo } from "react";
import Globe from "react-globe.gl";
import Handlebars from "handlebars";
import { scaleSequentialSqrt } from "d3-scale";
import { interpolateYlOrRd } from "d3-scale-chromatic";

function App() {
  const [countries, setCountries] = useState({ features: [] });
  const [hoverD, setHoverD] = useState(null);
  const [selectedD, setSelectedD] = useState(null); // 선택된 나라 저장
  const [compileTemplate, setCompileTemplate] = useState(null);

  useEffect(() => {
    fetch("../datasets/ne_110m_admin_0_countries.geojson")
      .then((res) => res.json())
      .then(setCountries);
  }, []);

  useEffect(() => {
    fetch("/label.html")
      .then((res) => res.text())
      .then((html) => {
        const compiled = Handlebars.compile(html);
        setCompileTemplate(() => compiled);
      })
      .catch(console.error);
  }, []);

  const colorScale = scaleSequentialSqrt(interpolateYlOrRd);
  const getVal = (feat) =>
    feat.properties.GDP_MD_EST / Math.max(1e5, feat.properties.POP_EST);
  const maxVal = useMemo(
    () => Math.max(...countries.features.map(getVal)),
    [countries]
  );
  colorScale.domain([0, maxVal]);

  const renderLabel = ({ properties: d }) => {
    if (!compileTemplate) return "";
    return compileTemplate(d);
  };

  // 클릭 시 동작: 클릭한 나라가 선택되어 있으면 해제, 아니면 선택
  const onPolygonClick = (d) => {
    if (selectedD === d) {
      setSelectedD(null);
    } else {
      setSelectedD(d);
    }
  };

  // hover나 선택된 나라가 맞으면 강조
  const isActive = (d) => d === hoverD || d === selectedD;

  return (
    <Globe
      globeImageUrl="//cdn.jsdelivr.net/npm/three-globe/example/img/earth-night.jpg"
      backgroundImageUrl="//cdn.jsdelivr.net/npm/three-globe/example/img/night-sky.png"
      lineHoverPrecision={0}
      polygonsData={countries.features.filter((d) => d.properties.ISO_A2 !== "AQ")}
      polygonAltitude={(d) => (isActive(d) ? 0.12 : 0.06)}
      polygonCapColor={(d) => (isActive(d) ? "#00c8ff" : "#888")}
      polygonSideColor={() => "rgba(255, 0, 0, 0.15)"}
      polygonStrokeColor={() => "rgba(0, 0, 255, 0.15)"}
      polygonLabel={renderLabel}

      onPolygonHover={setHoverD}
      onPolygonClick={onPolygonClick}
      polygonsTransitionDuration={300}
    />
  );
}

export default App;
