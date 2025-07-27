import React, { useState, useEffect, useMemo } from "react";
import Globe from "react-globe.gl";
import Handlebars from "handlebars";
import { scaleSequentialSqrt } from "d3-scale";
import { interpolateYlOrRd } from "d3-scale-chromatic";

function App() {
  const [countries, setCountries] = useState({ features: [] });
  const [hoverD, setHoverD] = useState(null);
  const [compileTemplate, setCompileTemplate] = useState(null); // 컴파일된 템플릿 저장

  // 1. GeoJSON 로드
  useEffect(() => {
    fetch("../datasets/ne_110m_admin_0_countries.geojson")
      .then((res) => res.json())
      .then(setCountries);
  }, []);

  // 2. 템플릿 HTML 로드 후 Handlebars 컴파일
  useEffect(() => {
    fetch("/label.html")
      .then((res) => res.text())
      .then((html) => {
        const compiled = Handlebars.compile(html);
        setCompileTemplate(() => compiled);
      })
      .catch(console.error);
  }, []);

  // 3. 색상 계산용
  const colorScale = scaleSequentialSqrt(interpolateYlOrRd);
  const getVal = (feat) =>
    feat.properties.GDP_MD_EST / Math.max(1e5, feat.properties.POP_EST);
  const maxVal = useMemo(
    () => Math.max(...countries.features.map(getVal)),
    [countries]
  );
  colorScale.domain([0, maxVal]);

  // 4. 폴리곤 라벨 렌더링 함수
  const renderLabel = ({ properties: d }) => {
    if (!compileTemplate) return "";
    return compileTemplate(d); // 템플릿 엔진으로 렌더링
  };

  return (
    <Globe
      globeImageUrl="//cdn.jsdelivr.net/npm/three-globe/example/img/earth-night.jpg"
      backgroundImageUrl="//cdn.jsdelivr.net/npm/three-globe/example/img/night-sky.png"
      lineHoverPrecision={0}
      polygonsData={countries.features.filter((d) => d.properties.ISO_A2 !== "AQ")}
      polygonAltitude={(d) => (d === hoverD ? 0.12 : 0.06)}
      polygonCapColor={(d) => (d === hoverD ? "#00c8ff" : "#888")}
      polygonSideColor={() => "rgba(255, 0, 0, 0.15)"}
      polygonStrokeColor={() => "rgba(0, 0, 255, 0.15)"}
      polygonLabel={renderLabel}
      onPolygonHover={setHoverD}
      polygonsTransitionDuration={300}
    />
  );
}

export default App;
