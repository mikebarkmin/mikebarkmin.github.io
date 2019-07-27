import React from 'react';
import styled from 'styled-components';
import ResponsiveMenu from '../elements/ResponsiveMenu';

const Nav = styled.div`
  position: fixed;
  left: 0;
  right: 0;
  top: 0;
  z-index: 100;
`;

const NavUl = styled.ul`
  padding: 0;
  margin: 0;

  @media (min-width: 800px) {
    display: flex;
    padding: 1rem;
  }
`;

const NavLi = styled.li`
  @media (min-width: 800px) {
    padding: 0;
    margin: 0 1rem;
  }
  list-style-type: none;
`;

const NavLink = styled.a`
  padding: 0.5rem;
  display: block;
  color: white;
  font-weight: bold;
  border-bottom: 1px solid;

  &:hover {
    background: linear-gradient(to right, #d4145a 0%, #fbb03b 100%);
  }
`;

const Navigation = ({ links }) => {
  return (
    <Nav>
      <ResponsiveMenu
        changeMenuOn="800px"
        menu={
          <NavUl>
            {links.map(({ url, name }) => (
              <NavLi key={url}>
                <NavLink href={url}>{name}</NavLink>
              </NavLi>
            ))}
          </NavUl>
        }
      />
    </Nav>
  );
};

export default Navigation;
