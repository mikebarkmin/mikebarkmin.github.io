import styled from 'styled-components';
import { Link as GLink } from 'gatsby';
import { rotateAnimation } from '../styles/animations';
import link from '../images/link.svg';

const Link = styled(GLink)`
  position: relative;
  border-radius: 0.5rem;
  border: 0px;
  font-size: 1.2rem;
  margin: 1rem;
  padding: 2rem;
  display: inline-block;
  font-weight: bold;

  &:hover {
    color: orange;
  }

  &:before {
    content: '';
    width: 20px;
    height: 20px;
    background: url(${link}) center;
    position: absolute;
    background-size: 20px;
    ${rotateAnimation('4s')};
    left: -5px;
    top: 35px;
  }
`;

export default Link;
