import styled from 'styled-components';

const Content = styled.div`
  display: flex;
  justify-content: center;
  align-items: self-start;
  z-index: 50;
  padding: 6rem;

  @media screen and (max-width: 800px) {
    padding: 0.5rem;
  }
`;

export default Content;
