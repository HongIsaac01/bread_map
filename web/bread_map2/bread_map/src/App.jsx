import React, { useState, useEffect, useMemo } from "react";
import Globe from "react-globe.gl";
import { scaleSequentialSqrt } from "d3-scale";
import { interpolateYlOrRd } from "d3-scale-chromatic";

function CountryPopup({ country }) {
  if (!country) return null;

  const { ADMIN, breadName, info, feature } = country.properties;

  const hasAnyInfo = ADMIN || breadName || info || feature;

  if (!hasAnyInfo) {
    return (
      <div
        style={{
          width: 500,
          height: 300,
          backgroundColor: "white",
          border: "2px solid #00c8ff",
          borderRadius: 10,
          padding: 20,
          boxShadow: "0 4px 12px rgba(0,0,0,0.3)",
          overflowY: "auto",
          display: "flex",
          justifyContent: "center",
          alignItems: "center",
          fontSize: 18,
          fontWeight: "bold",
        }}
      >
        추후 업데이트 예정입니다.
      </div>
    );
  }

  return (
    <div
      style={{
        width: 500,
        height: 300,
        backgroundColor: "white",
        border: "2px solid #00c8ff",
        borderRadius: 10,
        padding: 20,
        boxShadow: "0 4px 12px rgba(0,0,0,0.3)",
        overflowY: "auto",
      }}
    >
      {ADMIN && <h1>{ADMIN}</h1>}
      {breadName && <h2>{breadName}</h2>}
      {info && (
        <p>
          <strong>정보:</strong> {info}
        </p>
      )}
      {feature && (
        <p>
          <strong>특징:</strong> {feature}
        </p>
      )}
    </div>
  );
}

function App() {
  const [countries, setCountries] = useState({ features: [] });
  const [hoverD, setHoverD] = useState(null);
  const [selectedD, setSelectedD] = useState(null);

  useEffect(() => {
    fetch("../datasets/ne_110m_admin_0_countries.geojson")
      .then((res) => res.json())
      .then(setCountries);
  }, []);

  const colorScale = scaleSequentialSqrt(interpolateYlOrRd);
  const getVal = (feat) =>
    feat.properties.GDP_MD_EST / Math.max(1e5, feat.properties.POP_EST);
  const maxVal = useMemo(
    () => Math.max(...countries.features.map(getVal)),
    [countries]
  );
  colorScale.domain([0, maxVal]);

  const onPolygonClick = (d) => {
    if (selectedD === d) {
      setSelectedD(null);
    } else {
      setSelectedD(d);
    }
  };

  const isActive = (d) => d === hoverD || d === selectedD;

  const renderLabel = ({ properties: d }) => {
    return `
      <div><b>${d.ADMIN} (${d.ISO_A2}):</b></div>
      <div>GDP: <i>${d.GDP_MD_EST}</i> M$</div>
      <div>Population: <i>${d.POP_EST}</i></div>
    `;
  };

  const popupContainerStyle = {
    position: "fixed",
    top: 20,
    right: 20,
    zIndex: 9999,
  };

  return (
    <>
      <div
        style={{
          display: "flex",
          justifyContent: "center",
          alignItems: "center",
          height: "100vh", // 화면 세로 전체 높이
          width: "100vw", // 화면 가로 전체 너비
          overflow: "hidden", // 스크롤바 제거
          position: "relative", // 팝업 절대 위치에 영향 안 주도록
        }}
      >
        <Globe
          style={{ width: "800px", height: "600px" }} // Globe 크기 지정
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
      </div>

      {selectedD && (
        <div style={popupContainerStyle}>
          <CountryPopup country={selectedD} />
        </div>
      )}
    </>
  );
}

export default App;
