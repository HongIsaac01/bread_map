import React, { useEffect, useRef } from 'react';
import { Viewer } from 'resium';
import { Ion, IonResource, GeoJsonDataSource } from 'cesium';
import 'cesium/Build/Cesium/Widgets/widgets.css';

Ion.defaultAccessToken = import.meta.env.VITE_WORLD_KEY;
const world_id = import.meta.env.VITE_WORLD_ID;

function App() {
  const viewerRef = useRef(null);

  useEffect(() => {
    const loadGeoJson = async () => {
      try {
        const resource = await IonResource.fromAssetId(world_id);
        const dataSource = await GeoJsonDataSource.load(resource);
        
        
        const viewer = viewerRef.current.cesiumElement;

        await viewer.dataSources.add(dataSource);
        await viewer.zoomTo(dataSource);
      } catch (error) {
        console.error('GeoJSON Load Error:', error);
      }
    };

    loadGeoJson();
  }, []);

  return (
    <div style={{ width: '100%', height: '100vh' }}>
      <Viewer full ref={viewerRef} />
    </div>
  );
}

export default App;
