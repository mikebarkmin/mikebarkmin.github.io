import React from 'react';
import styled from 'styled-components';
import GlobalStyle from '../styles/global';
import SEO from './SEO';
import Footer from '../components/Footer';
import Background from '../components/Background';
import 'typeface-cantata-one';
import 'typeface-open-sans';

const Main = styled.main`
  max-width: 1400px;
  margin: auto;
  margin-top: 80px;
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
