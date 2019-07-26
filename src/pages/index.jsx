import React from 'react';

import Layout from '../components/Layout';
import Navigation from '../components/Navigation';

// Views
import Hero from '../views/Hero';
import Projects from '../views/Projects';
import Contact from '../views/Contact';
import Publications from '../views/Publications';

const links = [
  {
    name: 'Top',
    url: '#top'
  },
  {
    name: 'Projects',
    url: '#projects'
  },
  {
    name: 'Publications',
    url: '#publications'
  },
  {
    name: 'Contact',
    url: '#contact'
  }
];

const Index = () => {
  return (
    <Layout>
      <Navigation links={links} />
      <Hero />
      <Projects />
      <Publications />
      <Contact />
    </Layout>
  );
};

export default Index;
