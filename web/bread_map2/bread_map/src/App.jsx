import React, { useState, useEffect, useMemo } from "react";
import Globe from "react-globe.gl";
import { scaleSequentialSqrt } from "d3-scale";
import { interpolateYlOrRd } from "d3-scale-chromatic";

function App() {
  const [countries, setCountries] = useState({ features: [] });
  const [hoverD, setHoverD] = useState(null);

  useEffect(() => {
    fetch("../datasets/ne_110m_admin_0_countries.geojson")
      .then((res) => res.json())
      .then(setCountries);
  }, []);

  const colorScale = scaleSequentialSqrt(interpolateYlOrRd);

  const getVal = (feat) => feat.properties.GDP_MD_EST / Math.max(1e5, feat.properties.POP_EST);

  const maxVal = useMemo(() => Math.max(...countries.features.map(getVal)), [countries]);

  colorScale.domain([0, maxVal]);

  return (
    <Globe
      globeImageUrl="//cdn.jsdelivr.net/npm/three-globe/example/img/earth-night.jpg"
      backgroundImageUrl="//cdn.jsdelivr.net/npm/three-globe/example/img/night-sky.png"
      lineHoverPrecision={0}
      polygonsData={countries.features.filter((d) => d.properties.ISO_A2 !== "AQ")}
      polygonAltitude={(d) => (d === hoverD ? 0.12 : 0.06)}
      polygonCapColor={(d) => (d === hoverD ? "steelblue" : colorScale(getVal(d)))}
      polygonSideColor={() => "rgba(0, 100, 0, 0.15)"}
      polygonStrokeColor={() => "#111"}
      polygonLabel={({ properties: d }) => `
        <div><b>${d.ADMIN} (${d.ISO_A2}):</b></div>
        <div>GDP: <i>${d.GDP_MD_EST}</i> M$</div>
        <div>Population: <i>${d.POP_EST}</i></div>
      `}
      onPolygonHover={setHoverD}
      polygonsTransitionDuration={300}
    />
  );
}

export default App;
