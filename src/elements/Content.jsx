import styled from 'styled-components';
import { ParallaxLayer } from 'react-spring/renderprops-addons.cjs';

const Content = styled(ParallaxLayer)`
  display: flex;
  justify-content: center;
  align-items: self-start;
  z-index: 50;
  padding: 6px;
`;

export default Content;
