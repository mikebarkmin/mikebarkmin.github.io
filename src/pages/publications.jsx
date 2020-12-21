import React from "react";
import PropTypes from "prop-types";
import styled from "styled-components";
import { graphql } from "gatsby";
import Layout from "../components/Layout";
import Navigation from "../components/Navigation";
import PublicationCard from "../components/PublicationCard";

const Wrapper = styled.div`
  padding: 0 6rem;

  @media screen and (max-width: 800px) {
    padding: 0 1rem;
  }

  display: grid;
  grid-gap: 4rem;
  margin-top: 120px;

  @media (max-width: 1200px) {
    grid-gap: 3rem;
  }
  @media (max-width: 900px) {
    grid-gap: 2rem;
  }
`;

function Publications({ data, location }) {
  const { allPublicationsYaml: publications } = data;
  return (
    <Layout>
      <Navigation />
      <Wrapper>
        {publications.edges.map(({ node }) => (
          <PublicationCard
            {...node}
            id={node.id}
            active={node.id === location.hash?.substr(1)}
            key={node.id}
          />
        ))}
      </Wrapper>
    </Layout>
  );
}

Publications.propTypes = {
  location: PropTypes.object.isRequired,
  data: PropTypes.shape({
    allPublicationsYaml: PropTypes.array,
  }).isRequired,
};

export default Publications;

export const pageQuery = graphql`
  query {
    allPublicationsYaml(sort: { fields: [year], order: DESC }) {
      edges {
        node {
          ...Publication
        }
      }
    }
  }
`;
