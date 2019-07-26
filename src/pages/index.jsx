import React, { useRef } from 'react';
import styled from 'styled-components';
import { Parallax } from 'react-spring/renderprops-addons.cjs';

// Components
import Layout from '../components/Layout';
import ProjectCard from '../components/ProjectCard';
import PublicationCard from '../components/PublicationCard';
import Navigation from '../components/Navigation';

// Elements
import Inner from '../elements/Inner';
import { Title, BigTitle, Subtitle } from '../elements/Titles';

// Views
import Hero from '../views/Hero';
import Projects from '../views/Projects';
import About from '../views/About';
import Contact from '../views/Contact';
import Publications from '../views/Publications';

import links from '../links';
import publications from '../publications';

import avatar from '../images/avatar.jpg';

const ProjectsWrapper = styled.div`
  display: flex;
  flex-wrap: auto;
  justify-content: space-between;
  margin-top: 8px;
  display: grid;
  grid-gap: 4rem;
  grid-template-columns: repeat(2, 1fr);
  @media (max-width: 1200px) {
    grid-gap: 3rem;
  }
  @media (max-width: 900px) {
    grid-template-columns: 1fr;
    grid-gap: 2rem;
  }
`;

const PublicationsWrapper = styled.div`
  display: grid;
  grid-gap: 4rem;

  @media (max-width: 1200px) {
    grid-gap: 3rem;
  }
  @media (max-width: 900px) {
    grid-gap: 2rem;
  }
`;

const Avatar = styled.img`
  border-radius: 50%;
`;

const ContactText = styled.p`
  color: grey;
`;

const Footer = styled.footer`
  position: absolute;
  padding: 6px;
  text-algin: center;
  color: grey;
`;

const Index = () => {
  const parallax = useRef(null);

  const onNavClick = id => {
    parallax.current.scrollTo(id);
  };

  return (
    <>
      <Layout />
      <Navigation onClick={onNavClick} links={links} />
      <Parallax pages={7} ref={parallax}>
        <Hero offset={0}>
          <BigTitle>
            Hello, <br /> I'm Mike.
          </BigTitle>
          <Avatar src={avatar} alt="John Doe" />
          <Subtitle>
            I'm a passionate{' '}
            <a href="https://github.com/mikebarkmin">developer</a> and{' '}
            <a href="https://udue.de/mba">researcher</a> at the University of
            Duisburg-Essen at the chair of Computer Science Education.
          </Subtitle>
        </Hero>
        <Projects offset={1}>
          <Title>Projects</Title>
          <ProjectsWrapper>
            <ProjectCard
              title="OpenPatch"
              link="https://gitlab.com/openpatch"
              bg="linear-gradient(to right, #D4145A 0%, #FBB03B 100%)"
              tags={['flask', 'react', 'mysql']}
            >
              OpenPatch is an open source platform for assessment and training
              of competencies.
            </ProjectCard>
            <ProjectCard
              title="Processing Scratch"
              link="https://github.com/mikebarkmin/processing-library-scratch"
              bg="linear-gradient(to right, #662D8C 0%, #ED1E79 100%)"
              tags={['processing', 'java']}
            >
              A processing library to ease the transition from scratch to
              processing
            </ProjectCard>
            <ProjectCard
              title="Gestyled"
              link="https://github.com/mikebarkmin/gestyled"
              bg="linear-gradient(to right, #009245 0%, #FCEE21 100%)"
              tags={['react', 'styled-components']}
            >
              A react component library based on styled-components.
            </ProjectCard>
            <ProjectCard
              title="React to Everything"
              link="https://github.com/mikebarkmin/react-to-everything"
              bg="linear-gradient(to right, #D585FF 0%, #00FFEE 100%)"
              tags={['react', 'react-native']}
            >
              Mobile, desktop and website Apps with the same code.
            </ProjectCard>
          </ProjectsWrapper>
        </Projects>
        <Publications offset={3}>
          <Title>Publications</Title>
          <PublicationsWrapper>
            {Object.keys(publications)
              .sort((a, b) => a < b)
              .map(year => {
                const entries = publications[year];
                const pubs = entries.map((entry, id) => (
                  <PublicationCard
                    key={id}
                    bg="linear-gradient(to right, BlueViolet 0%, DodgerBlue 100%)"
                    {...entry}
                  />
                ));
                return [
                  <Subtitle key={year} id="subtitle">
                    {year}
                  </Subtitle>,
                  ...pubs
                ];
              })}
          </PublicationsWrapper>
        </Publications>
        <Contact offset={6} id="contact">
          <Inner>
            <Title>Get in touch</Title>
            <ContactText>
              Send me an <a href="mailto:mike@barkmin.eu">E-Mail</a> or say Hi
              to me on <a href="https://twitter.com/mikebarkmin">Twitter</a>
            </ContactText>
          </Inner>
          <Footer>
            &copy; 2019 by Mike Barkmin.{' '}
            <a href="https://github.com/mikebarkmin/mikebarkmin.github.io">
              GitHub Repository
            </a>
            .
          </Footer>
        </Contact>
      </Parallax>
    </>
  );
};

export default Index;
