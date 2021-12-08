import React from 'react';
import styled from 'styled-components';

const Wrapper = styled.footer`
  padding: 1.5rem;
  text-align: center;
  width: 100%;
  color: grey;
`;

function Footer() {
  return (
    <Wrapper>
      &copy; 2021 by Mike Barkmin.{' '}
      <a
        rel="noreferrer"
        href="https://github.com/mikebarkmin/mikebarkmin.github.io"
      >
        GitHub Repository
      </a>
    </Wrapper>
  );
}

export default Footer;
