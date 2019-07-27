import React from 'react';
import styled from 'styled-components';
import Content from '../elements/Content';
import { BigTitle, Subtitle } from '../elements/Titles';
import avatar from '../images/avatar.jpg';

const Wrapper = styled.div`
  display: flex;
  width: 100%;
  flex-direction: column;
  align-items: center;
  text-align: center;
`;

const Avatar = styled.img`
  border-radius: 50%;
  width: 128px;
`;

const Hero = () => (
  <Content id="hero">
    <Wrapper>
      <BigTitle>
        Hello, <br /> I'm Mike.
      </BigTitle>
      <Avatar src={avatar} alt="Mike Barkmin" />
      <Subtitle>
        I'm a passionate{' '}
        <a rel="noreferrer" href="https://github.com/mikebarkmin">
          developer
        </a>{' '}
        and{' '}
        <a rel="noreferrer" href="https://udue.de/mba">
          researcher
        </a>{' '}
        at the University of Duisburg-Essen at the chair of Computer Science
        Education.
      </Subtitle>
    </Wrapper>
  </Content>
);

export default Hero;
