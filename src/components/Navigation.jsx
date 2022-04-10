import React from "react";
import PropTypes from "prop-types";
import styled from "styled-components";
import { Link } from "gatsby";
import ResponsiveMenu from "../elements/ResponsiveMenu";

const NavUl = styled.ul`
  padding: 0;
  margin: 0 0;

  @media (min-width: 800px) {
    display: flex;
    padding: 1rem;
  }
`;

const NavLi = styled.li`
  margin: 1rem 0;
  @media (min-width: 800px) {
    padding: 0;
    margin: 0 1rem;
  }
  list-style-type: none;
`;

const NavLink = styled(Link)`
  padding: 0.5rem;
  display: block;
  color: ${(props) => (props.active ? "#fbb03b" : "white")};
  font-weight: bold;
  border-bottom: 1px solid;
  border-top-left-radius: 0.5rem;
  border-top-right-radius: 0.5rem;

  &:hover {
    border-bottom-color: #fbb03b;
    color: #fbb03b;
  }
`;

const links = [
  {
    name: "Home",
    url: "/",
  },
  {
    name: "Projects",
    url: "/projects",
  },
  {
    name: "Publications",
    url: "/publications",
  },
  {
    name: "Talks",
    url: "/talks",
  },
  {
    name: "Blog",
    url: "/blog",
  },
  {
    name: "Contact",
    url: "/#contact",
  },
  {
    name: "Uses",
    url: "/uses",
  },
];

const Navigation = ({ active }) => {
  return (
    <ResponsiveMenu
      changeMenuOn="900px"
      menu={
        <NavUl>
          {links.map(({ url, name }) => (
            <NavLi key={url}>
              <NavLink to={url} active={active === name}>
                {name}
              </NavLink>
            </NavLi>
          ))}
        </NavUl>
      }
    />
  );
};

Navigation.propTypes = {
  active: PropTypes.string,
};

Navigation.defaultProps = {
  active: null,
};

export default Navigation;
