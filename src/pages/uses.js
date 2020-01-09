import React from 'react';
import PropTypes from 'prop-types';
import Layout from '../components/Layout';
import Navigation from '../components/Navigation';

const links = [
  {
    name: 'Home',
    url: '/#top'
  },
  {
    name: 'Projects',
    url: '/#projects'
  },
  {
    name: 'Publications',
    url: '/#publications'
  },
  {
    name: 'Blog',
    url: '/#blog'
  },
  {
    name: 'Contact',
    url: '/#contact'
  }
];


function Uses() {
  return <Layout>
      <Navigation links={links} />
      <div>Mostly zsh and neovim. You can find my dotfiles <a href="https://github.com/mikebarkmin/dotfiles">here</a></div>
    </Layout>;
}

Uses.propTypes = {};

export default Uses;
