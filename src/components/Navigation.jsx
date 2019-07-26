import React from 'react';
import styled from 'styled-components';

const Nav = styled.nav`
  position: fixed;
  background: #000;
  width: 100%;
  overflow-x: auto;
  left: 0;
  right: 0;
  color: white;
  z-index: 10;
`;

const NavUl = styled.ul`
  display: flex;
  padding-bottom: 1rem;
  padding-top: 1rem;
`;

const NavLi = styled.li`
  list-style-type: none;
`;

const NavLink = styled.a`
  margin: 0 0.75rem;
  padding: 0.5rem;
  border-radius: 0.5rem;
  background-color: #161719;
  color: white;
  font-weight: bold;
  border: 2px solid;

  &:hover {
    background: linear-gradient(to right, #d4145a 0%, #fbb03b 100%);
  }
`;

const Navigation = ({ links }) => {
  return (
    <Nav>
      <NavUl>
        {links.map(({ url, name }) => (
          <NavLi key={url}>
            <NavLink href={url}>{name}</NavLink>
          </NavLi>
        ))}
      </NavUl>
    </Nav>
  );
};

export default Navigation;
