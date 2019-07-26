import React from 'react';
import styled from 'styled-components';
import Content from '../elements/Content';
import { Title } from '../elements/Titles';
import Inner from '../elements/Inner';
import ProjectCard from '../components/ProjectCard';
import Link from '../elements/Link';

const Wrapper = styled.div`
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

const Projects = () => (
  <Content id="projects">
    <Inner>
      <Title>Projects</Title>
      <Wrapper>
        <ProjectCard
          title="OpenPatch"
          link="https://gitlab.com/openpatch"
          bg="linear-gradient(to right, #D4145A 0%, #FBB03B 100%)"
          tags={['flask', 'react', 'mysql']}
        >
          OpenPatch is an open source platform for assessment and training of
          competencies.
        </ProjectCard>
        <ProjectCard
          title="Processing Scratch"
          link="https://github.com/mikebarkmin/processing-library-scratch"
          bg="linear-gradient(to right, #662D8C 0%, #ED1E79 100%)"
          tags={['processing', 'java']}
        >
          A processing library to ease the transition from scratch to processing
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
      </Wrapper>
      <Link>More Projects</Link>
    </Inner>
  </Content>
);

export default Projects;
