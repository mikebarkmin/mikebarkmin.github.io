import React, { Component } from 'react';
import PropTypes from 'prop-types';
import styled from 'styled-components';
import MenuSvg from '../images/menu.svg';
import CloseSvg from '../images/close.svg';

const SmallMenu = styled.div`
  display: none;
  text-align: center;
  background: #000;
  min-height: 52px;
  @media (max-width: ${props => props.size}) {
    display: block;
  }
`;

const LargeMenu = styled.div`
  display: block;
  text-align: center;
  background: #000;
  min-height: 80px;
  @media (max-width: ${props => props.size}) {
    display: none;
  }

  transition: all 0.5s ease-in-out;
`;

const MenuIcon = styled.button`
  width: 48px;
  height: 48px;
  background: url(${props => props.icon});
  border: 0;

  transition: all 0.5s ease-in-out;
`;

class ResponsiveMenu extends Component {
  constructor(props) {
    super(props);
    this.state = {
      showMenu: false
    };
  }

  handleClick = () => {
    const { showMenu } = this.state;
    this.setState({ showMenu: !showMenu });
  };

  render() {
    const { menu, changeMenuOn } = this.props;
    const { showMenu } = this.state;
    return (
      <>
        <LargeMenu size={changeMenuOn}>{menu}</LargeMenu>
        <SmallMenu size={changeMenuOn}>
          {!showMenu ? (
            <MenuIcon onClick={this.handleClick} icon={MenuSvg} />
          ) : (
            <MenuIcon onClick={this.handleClick} icon={CloseSvg} />
          )}
          {showMenu ? <div>{menu}</div> : null}
        </SmallMenu>
      </>
    );
  }
}
ResponsiveMenu.propTypes = {
  menu: PropTypes.node.isRequired,
  changeMenuOn: PropTypes.string.isRequired
};

export default ResponsiveMenu;
