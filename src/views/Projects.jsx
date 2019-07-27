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
  @media (max-width: 800px) {
    grid-template-columns: 1fr;
    grid-gap: 2rem;
  }
`;

const Projects = ({ projects }) => (
  <Content id="projects">
    <Inner>
      <Title>Selected Projects</Title>
      <Wrapper>
        {projects.edges.map(({ node }, i) => (
          <ProjectCard
            key={node.id}
            name={node.name}
            link={node.link}
            tags={node.tags}
          >
            {node.description}
          </ProjectCard>
        ))}
      </Wrapper>
      <Link to="/projects">More Projects</Link>
    </Inner>
  </Content>
);

export default Projects;
