import styled from 'styled-components';
import { rotateAnimation } from '../styles/animations';
import triangle from '../images/triangle.svg';

export const Title = styled.h1`
  color: white;
  position: relative;
  display: inline-block;
  text-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
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
  margin-bottom: 6px;
  text-shadow: 0 5px 35px rgba(255, 255, 255, 0.15);
`;

export const Subtitle = styled.p`
  margin-top: 8px;
  text-shadow: 0 2px 15px rgba(0, 0, 0, 0.2);
`;
