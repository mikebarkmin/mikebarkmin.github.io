import styled from 'styled-components';
import { ParallaxLayer } from 'react-spring/renderprops-addons.cjs';

export const Divider = styled(ParallaxLayer)`
  position: absolute;
  width: 100%;
  height: 100%;
  background: ${props => props.bg};
  svg {
    fill: ${props => props.fill};
  }
  clip-path: ${props => props.clipPath};
`;

export const DividerMiddle = styled(Divider)`
  clip-path: polygon(0 15%, 100% 25%, 100% 85%, 0 75%);
`;
