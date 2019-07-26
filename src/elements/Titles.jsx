import styled from 'styled-components';
import { rotateAnimation } from '../styles/animations';
import triangle from '../images/triangle.svg';

export const Title = styled.h1`
  color: white;
  position: relative;
  display: inline-block;
  text-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
  font-size: 2.25rem;
  letter-spacing: 0.05rem;
  font-family: 'Cantata One', serif;
  &:before {
    content: '';
    width: 40px;
    height: 40px;
    background: url(${triangle});
    position: absolute;
    background-size: 40px;
    ${rotateAnimation('4s')};
    left: -60px;
    top: 5px;
  }
`;

export const BigTitle = styled.h1`
  font-family: serif;
  color: white;
  font-size: 5rem;
  margin-bottom: 6px;
  text-shadow: 0 5px 35px rgba(255, 255, 255, 0.15);
`;

export const Subtitle = styled.p`
  color: white;
  font-size: 1.5rem;
  margin-top: 2rem;
  text-shadow: 0 2px 15px rgba(0, 0, 0, 0.2);
`;
