import React from 'react';
import styled from 'styled-components';
import tw from 'tailwind.macro';

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
  ${tw`flex`};
`;

const NavLi = styled.li`
  ${tw`mr-6`};
  list-style-type: none;
`;

const NavButton = styled.button`
  ${tw`text-white-500 hover:text-blue-500`}
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
