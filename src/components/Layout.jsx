import React from 'react';
import styled from 'styled-components';
import GlobalStyle from '../styles/global';
import SEO from './SEO';
import Footer from './Footer';
import Background from './Background';
import 'typeface-cantata-one';
import 'typeface-open-sans';

const Main = styled.main`
  max-width: 1400px;
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

export default Layout;
