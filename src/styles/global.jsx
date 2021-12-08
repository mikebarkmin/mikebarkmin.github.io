import { createGlobalStyle } from "styled-components";

const GlobalStyle = createGlobalStyle`
  *, *:before, *:after {
    box-sizing: inherit;
    font-family: "Open Sans", sans;
    color: white;
    transition: all 0.5s ease-in-out;
  }
  html {
    text-rendering: optimizeLegibility;
    overflow-x: hidden;
    box-sizing: border-box;
    -ms-overflow-style: scrollbar;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    background-color: #010;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    scroll-behavior: smooth;
  }
  table {
    border: 1px solid #AEA;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #AEA;
  }

  td, th {
    padding: 1rem;
  }

  img {
    width: 100%;
  }
  html, body {
    width: 100%;
    height: 100%;
    margin: 0;
    padding: 0 16px;
  }
  a {
    color: #fbb03b;
    text-decoration: none;
  }
`;

export default GlobalStyle;
