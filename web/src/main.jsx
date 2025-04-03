import React, { useState } from "react";
import ReactDOM from "react-dom/client";

function App() {
  const [count, setCount] = useState(0);
  return (
    <div style={{ padding: "2rem", textAlign: "center" }}>
      <h1>React + Go</h1>
      <button onClick={() => setCount(count + 1)}>Count: {count}</button>
    </div>
  );
}

ReactDOM.createRoot(document.getElementById("root")).render(<App />);
