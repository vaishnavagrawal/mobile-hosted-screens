import { BrowserRouter, Route, Routes } from "react-router-dom";
import "./App.css";
import WIP from "./pages/WIP";

function App() {
  return (


    <BrowserRouter>
    <Routes>
      <Route path="/" element={<WIP/>}>
        <Route index element={<WIP />} />
        {/* <Route path="docs" element={<Docs />} /> */}
        {/* <Navigate to={"/doc.html"}  replace={true} /> */}

        {/* <Route path="*" element={<NoPage />} /> */}
      </Route>
    </Routes>
  </BrowserRouter>

  );
}

export default App;
