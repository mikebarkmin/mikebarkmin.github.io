import React from 'react';
import styled from 'styled-components';

const Nav = styled.nav`
  position: absolute;
  background: #000;
  width: 100%;
  left: 0;
  right: 0;
  color: white;
  z-index: 10;
`;

const NavUl = styled.ul`
  display: 'flex';
`;

const NavLi = styled.li`
  margin-right: 6px;
  list-style-type: none;
`;

const NavButton = styled.button`
  padding: 2px;

  background-color: #161719;
  color: white;
  font-weight: bold;
  border: 2px solid;

  &:hover {
    background: linear-gradient(to right, #d4145a 0%, #fbb03b 100%);
  }

  font-family: 'sans';
`;

const Navigation = ({ onClick, links }) => {
  const handleClick = id => () => {
    onClick(id);
  };
  return (
    <Nav>
      <NavUl>
        {links.map(({ id, name }) => (
          <NavLi key={id}>
            <NavButton onClick={handleClick(id)}>{name}</NavButton>
          </NavLi>
        ))}
      </NavUl>
    </Nav>
  );
};

export default Navigation;
