# bread_map

참고자료 : 세상의 맛있는 빵도감 - 이노우에 요시후미 감수 / 진선 books
https://velog.io/@c9926/CesiumJS-3D


npm create vite@latest bread_map -- --template react
cd bread_map
npm install
npm run dev

npm install cesium
npm install @types/cesium
npm install resium

npm run dev

index.html 추가>
<script>window.CESIUM_BASE_URL = '/cesium';</script> 

App.jsx 변경>
```
import React from 'react';
import { Viewer } from 'resium';
import 'cesium/Build/Cesium/Widgets/widgets.css';
import { Ion, IonResource } from 'cesium';
Ion.defaultAccessToken = 'YOUR_CESIUM_ION_ACCESS_TOKEN';
function App() {
  return (
    <div style={{ width: '100%', height: '100vh' }}>
      <Viewer full />
    </div>
  );
}
export default App;
```

/node_modules/cesium/Build/Cesium을 /public/cesium 디렉토리 생성후 내용 만 붙여넣기

.env 생성 후 API 키 저장
REACT 환경변수 : REACT_APP_{key 이름}
const 키 변수 = process.env.REACT_APP_{key 이름}
VITE 환경변수 : VITE_{key 이름}
const 키 변수 = import.meta.env.VITE_{key 이름}

.gitignore에 아래의 내용 추가
```
.env
.env.*
```