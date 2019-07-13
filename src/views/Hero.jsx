import React from 'react';
import PropTypes from 'prop-types';
import styled from 'styled-components';
import tw from 'tailwind.macro';
import { colors } from '../../tailwind';
import { Divider } from '../elements/Dividers';
import Content from '../elements/Content';
import { UpDown, UpDownWide } from '../styles/animations';
import SVG from '../components/SVG';

const Wrapper = styled.div`
  ${tw`flex w-full xl:w-2/3`};
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
          stroke={colors.orange}
          left="10%"
          top="20%"
        />
        <SVG
          icon="linux"
          width={10}
          stroke={colors.red}
          fill={colors.red}
          left="60%"
          top="70%"
        />
        <SVG
          icon="mysql"
          width={6}
          fill={colors['grey-darker']}
          left="60%"
          top="15%"
        />
      </UpDown>
      <UpDownWide>
        <SVG
          icon="java"
          hiddenMobile
          width={16}
          fill={colors['blue-dark']}
          left="80%"
          top="10%"
        />
        <SVG
          icon="docker"
          width={12}
          stroke={colors.white}
          left="90%"
          top="50%"
        />
        <SVG
          icon="git"
          width={16}
          fill={colors['grey-darker']}
          left="70%"
          top="90%"
        />
        <SVG
          icon="vim"
          width={16}
          stroke={colors['grey-darkest']}
          left="30%"
          top="65%"
        />
        <SVG
          icon="react"
          width={16}
          stroke={colors['pink-light']}
          left="28%"
          top="15%"
        />
        <SVG
          icon="mysql"
          width={6}
          fill={colors['grey-darkest']}
          left="75%"
          top="10%"
        />
        <SVG
          icon="gitlab"
          hiddenMobile
          width={8}
          fill={colors['grey-darkest']}
          left="45%"
          top="10%"
        />
        <SVG icon="python" width={34} fill={colors.green} left="95%" top="5%" />
      </UpDownWide>
      <SVG
        icon="linux"
        hiddenMobile
        width={24}
        fill={colors['grey-darker']}
        left="5%"
        top="70%"
      />
      <SVG
        icon="python"
        width={6}
        fill={colors['grey-darkest']}
        left="4%"
        top="20%"
      />
      <SVG
        icon="js"
        width={12}
        fill={colors['grey-darkest']}
        left="50%"
        top="60%"
      />
      <SVG
        icon="java"
        width={8}
        fill={colors['grey-darkest']}
        left="95%"
        top="90%"
      />
      <SVG
        icon="docker"
        hiddenMobile
        width={24}
        fill={colors['grey-darker']}
        left="40%"
        top="80%"
      />
      <SVG
        icon="mysql"
        width={8}
        stroke={colors['grey-darker']}
        left="25%"
        top="5%"
      />
      <SVG
        icon="box"
        width={6}
        fill={colors['grey-darkest']}
        left="10%"
        top="10%"
      />
      <SVG
        icon="box"
        width={12}
        fill={colors['grey-darkest']}
        left="40%"
        top="30%"
      />
      <SVG
        icon="hexa"
        width={16}
        stroke={colors['grey-darker']}
        left="10%"
        top="50%"
      />
      <SVG
        icon="hexa"
        width={8}
        stroke={colors['grey-darker']}
        left="80%"
        top="70%"
      />
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
