import React from "react";
import PropTypes from "prop-types";
import styled from "styled-components";
import { graphql } from "gatsby";
import Layout from "../components/Layout";
import Navigation from "../components/Navigation";
import ProjectCard from "../components/ProjectCard";

const Wrapper = styled.main`
  display: grid;
  grid-gap: 4rem;
  grid-template-columns: 1fr 1fr;
  margin-top: 40px;

  @media (max-width: 1200px) {
    grid-gap: 3rem;
  }
  @media (max-width: 900px) {
    grid-template-columns: 1fr;
    grid-gap: 2rem;
  }
`;

function Projects({ data }) {
  const { allProjectsYaml: projects } = data;
  return (
    <Layout>
      <Navigation active="Projects" />
      <Wrapper>
        {projects.edges.map(({ node }) => (
          <ProjectCard {...node} key={node.id}>
            {node.description}
          </ProjectCard>
        ))}
      </Wrapper>
    </Layout>
  );
}

Projects.propTypes = {
  data: PropTypes.shape({
    allProjectsYaml: PropTypes.array,
  }).isRequired,
};

export default Projects;

export const pageQuery = graphql`
  query {
    allProjectsYaml(
      sort: { fields: weight, order: DESC }
    ) {
      edges {
        node {
          ...Project
        }
      }
    }
  }
`;
