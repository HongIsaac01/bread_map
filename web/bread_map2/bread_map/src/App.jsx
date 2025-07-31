import React, { useState, useEffect, useMemo } from "react";
import Globe from "react-globe.gl";
import { scaleSequentialSqrt } from "d3-scale";
import { interpolateYlOrRd } from "d3-scale-chromatic";

function CountryPopup({ data }) {
  const [currentIndex, setCurrentIndex] = React.useState(0);

  if (!data || data.length === 0) return null;

  const item = data[currentIndex];

  const handlePrev = () => {
    setCurrentIndex((idx) => (idx > 0 ? idx - 1 : idx));
  };

  const handleNext = () => {
    setCurrentIndex((idx) => (idx < data.length - 1 ? idx + 1 : idx));
  };

  // 상세 설명이 JSON 문자열이면 파싱 시도, 아니면 빈 배열
  let details = [];
  try {
    if (typeof item.detailed_description === "string") {
      details = JSON.parse(item.detailed_description);
      if (!Array.isArray(details)) {
        // JSON 파싱 결과가 배열이 아니면 배열로 감싸기
        details = [details];
      }
    } else if (Array.isArray(item.detailed_description)) {
      details = item.detailed_description;
    }
  } catch {
    // 파싱 실패시 그냥 원본 텍스트 한 줄로 보여주기
    details = [item.detailed_description || ""];
  }

  return (
    <div
      style={{
        width: 500,
        height: 700,
        backgroundColor: "white",
        border: "2px solid #00c8ff",
        borderRadius: 10,
        padding: 20,
        boxShadow: "0 4px 12px rgba(0,0,0,0.3)",
        overflowY: "auto",
        display: "flex",
        flexDirection: "column",
      }}
    >
      <div style={{ flex: 1, overflowY: "auto" }}>
        <h3>이름 : {item.name_kr}, {item.name_world}</h3>
        <p><strong>분류 : </strong> {item.classification}</p>
        <p><strong>도우 종류 : </strong> {item.dough_type}</p>
        <p><strong>굽기 방법 : </strong> {item.baking_method}</p>
        <p><strong>빵 스타일 : </strong> {item.bread_style}</p>
        <p><strong>발효 방법 : </strong> {item.fermentation_method}</p>
        <p><strong>상세 설명 : </strong></p>
        <ol>
          {details.map((line, idx) => (
            <li key={idx}>
              {line}
            </li>
          ))}
        </ol>
      </div>

      <div style={{ textAlign: "center", marginTop: 10 }}>
        <button onClick={handlePrev} disabled={currentIndex === 0}>
          ◀ 이전
        </button>
        <span style={{ margin: "0 15px" }}>
          {currentIndex + 1} / {data.length}
        </span>
        <button onClick={handleNext} disabled={currentIndex === data.length - 1}>
          다음 ▶
        </button>
      </div>
    </div>
  );
}


function App() {
  const [countries, setCountries] = useState({ features: [] });
  const [hoverD, setHoverD] = useState(null);
  const [selectedD, setSelectedD] = useState(null);
  const [countryInfo, setCountryInfo] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  // GeoJSON 국가 데이터 로드
  useEffect(() => {
    fetch("../datasets/ne_110m_admin_0_countries.geojson")
      .then((res) => res.json())
      .then(setCountries)
      .catch(() => setCountries({ features: [] }));
  }, []);

  // 선택된 나라가 바뀔 때마다 서버에서 DB 정보 요청
  useEffect(() => {
    if (!selectedD) {
      setCountryInfo(null);
      setError(null);
      return;
    }

    const countryName = selectedD.properties.ADMIN;

    setLoading(true);
    setError(null);

    fetch(`http://localhost:5000/country-info?name=${encodeURIComponent(countryName)}`)
      .then((res) => {
        if (!res.ok) throw new Error("정보를 불러오지 못했습니다.");
        return res.json();
      })
      .then((data) => {
        setCountryInfo(data);
        setLoading(false);
      })
      .catch((err) => {
        console.error(err);
        setError("데이터를 불러오는 데 실패했습니다.");
        setCountryInfo(null);
        setLoading(false);
      });
  }, [selectedD]);

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
          height: "100vh",
          width: "100vw",
          overflow: "hidden",
          position: "relative",
        }}
      >
        <Globe
          style={{ width: "800px", height: "600px" }}
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
          {loading && <div>로딩중...</div>}
          {error && <div style={{ color: "red" }}>{error}</div>}
          {!loading && !error && <CountryPopup data={countryInfo} />}
        </div>
      )}
    </>
  );
}

export default App;
