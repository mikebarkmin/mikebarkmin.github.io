import styled from 'styled-components';
import React from 'react';
import { UpDown, UpDownWide, waveAnimation } from '../styles/animations';
import SVG from './SVG';

const Wrapper = styled.div`
  position: fixed;
  z-index: -1;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  overflow: hidden;
`;

const WaveWrapper = styled.div`
  position: absolute;
  bottom: 0;
  width: 100%;
  transform: matrix(1, 0, 0, -1, 0, 0);
`;

const InnerWave = styled.div`
  position: relative;
  height: 100%;
  svg {
    width: 100%;
    height: 40vh;
  }
  path {
    ${waveAnimation('20s')};
  }
`;

function Background() {
  return (
    <Wrapper>
      <UpDown>
        <SVG icon="react" width={48} stroke="orange" left="10%" top="40%" />
        <SVG
          icon="linux"
          width={30}
          stroke="red"
          fill="red"
          left="60%"
          top="70%"
        />
      </UpDown>
      <UpDownWide>
        <SVG
          icon="java"
          hiddenMobile
          width={36}
          fill="darkblue"
          left="80%"
          top="10%"
        />
        <SVG icon="mysql" width={38} stroke="magenta" left="90%" top="50%" />
        <SVG icon="git" width={36} fill="mistyrose" left="70%" top="90%" />
        <SVG icon="vim" width={36} stroke="gold" left="30%" top="65%" />
        <SVG
          icon="docker"
          width={36}
          fill="pink"
          stroke="pink"
          left="28%"
          top="15%"
        />
        <SVG icon="git" width={36} fill="greenyellow" left="75%" top="10%" />
        <SVG icon="gitlab" width={38} fill="lightblue" left="45%" top="70%" />
        <SVG icon="python" width={34} fill="turquoise" left="95%" top="5%" />
      </UpDownWide>
      <WaveWrapper>
        <InnerWave>
          <svg
            xmlns="http://www.w3.org/2000/svg"
            viewBox="0 0 800 338.05"
            preserveAspectRatio="none"
          >
            <path>
              <animate
                attributeName="d"
                values="M 0 100 Q 250 50 400 200 Q 550 350 800 300 L 800 0 L 0 0 L 0 100 Z;M 0 100 Q 200 150 400 200 Q 600 250 800 300 L 800 0 L 0 0 L 0 100 Z;M 0 100 Q 150 350 400 200 Q 650 50 800 300 L 800 0 L 0 0 L 0 100 Z"
                repeatCount="indefinite"
                dur="30s"
              />
            </path>
          </svg>
        </InnerWave>
      </WaveWrapper>
    </Wrapper>
  );
}

Background.propTypes = {};

export default Background;
