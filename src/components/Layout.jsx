import React from "react";
import PropTypes from "prop-types";
import styled from "styled-components";
import GlobalStyle from "../styles/global";
import SEO from "./SEO";
import Footer from "./Footer";
import Background from "./Background";
import "typeface-cantata-one";
import "typeface-open-sans";

const Main = styled.main`
  max-width: 1280px;
  margin: auto;
  margin-top: 80px;

  @media (max-width: 800px) {
    margin-top: 52px;
  }
`;

const Layout = ({ children }) => (
  <>
    <SEO />
    <GlobalStyle />
    <Main>{children}</Main>
    <Footer />
    <Background />
  </>
);

Layout.propTypes = {
  children: PropTypes.node,
};

Layout.defaultProps = {
  children: null,
};

export default Layout;
