import React from 'react';
import PropTypes from 'prop-types';
import styled from 'styled-components';
import { Divider } from '../elements/Dividers';
import Content from '../elements/Content';
import { UpDown, UpDownWide } from '../styles/animations';
import SVG from '../components/SVG';

const Wrapper = styled.div`
  display: flex;
  width: 100%;
  flex-direction: column;
  align-items: center;
  text-align: center;
`;

const Hero = ({ children, offset }) => (
  <>
    <Divider speed={0.2} offset={offset}>
      <UpDown>
        <SVG
          icon="react"
          hiddenMobile
          width={48}
          stroke="orange"
          left="10%"
          top="20%"
        />
        <SVG
          icon="linux"
          width={10}
          stroke="red"
          fill="red"
          left="60%"
          top="70%"
        />
        <SVG icon="mysql" width={6} fill="dimgrey" left="60%" top="15%" />
      </UpDown>
      <UpDownWide>
        <SVG
          icon="java"
          hiddenMobile
          width={16}
          fill="darkblue"
          left="80%"
          top="10%"
        />
        <SVG icon="docker" width={12} stroke="white" left="90%" top="50%" />
        <SVG icon="git" width={16} fill="dimgrey" left="70%" top="90%" />
        <SVG icon="vim" width={16} stroke="dimgrey" left="30%" top="65%" />
        <SVG
          icon="mysql"
          width={16}
          fill="pink"
          stroke="pink"
          left="28%"
          top="15%"
        />
        <SVG icon="git" width={6} fill="dimgrey" left="75%" top="10%" />
        <SVG
          icon="gitlab"
          hiddenMobile
          width={8}
          fill="dimgrey"
          left="45%"
          top="10%"
        />
        <SVG icon="python" width={34} fill="green" left="95%" top="5%" />
      </UpDownWide>
      <SVG
        icon="linux"
        hiddenMobile
        width={24}
        fill="dimgrey"
        left="5%"
        top="70%"
      />
      <SVG icon="python" width={6} fill="dimgrey" left="4%" top="20%" />
      <SVG icon="js" width={12} fill="dimgrey" left="50%" top="60%" />
      <SVG icon="java" width={8} fill="dimgrey" left="95%" top="90%" />
      <SVG
        icon="docker"
        hiddenMobile
        width={24}
        fill="darkgrey"
        left="40%"
        top="80%"
      />
      <SVG icon="react" width={8} stroke="darkgrey" left="25%" top="5%" />
      <SVG icon="box" width={6} fill="darkgrey" left="10%" top="10%" />
      <SVG icon="box" width={12} fill="darkgrey" left="40%" top="30%" />
      <SVG icon="hexa" width={16} stroke="darkgrey" left="10%" top="50%" />
      <SVG icon="hexa" width={8} stroke="darkgrey" left="80%" top="70%" />
    </Divider>
    <Content speed={0.4} offset={offset}>
      <Wrapper>{children}</Wrapper>
    </Content>
  </>
);

export default Hero;

Hero.propTypes = {
  children: PropTypes.node.isRequired,
  offset: PropTypes.number.isRequired
};
