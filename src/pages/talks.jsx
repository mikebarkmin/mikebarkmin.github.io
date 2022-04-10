import React from "react";
import PropTypes from "prop-types";
import styled from "styled-components";
import { graphql } from "gatsby";
import Layout from "../components/Layout";
import Navigation from "../components/Navigation";
import TalkCard from "../components/TalkCard";

const Wrapper = styled.div`
  display: grid;
  grid-gap: 4rem;
  margin-top: 40px;

  @media (max-width: 1200px) {
    grid-gap: 3rem;
  }
  @media (max-width: 900px) {
    grid-gap: 2rem;
  }
`;

function Talks({ data, location }) {
  const { allTalksYaml: talks } = data;
  return (
    <Layout>
      <Navigation active="Talks" />
      <Wrapper>
        {talks.edges.map(({ node }) => (
          <TalkCard
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

Talks.propTypes = {
  location: PropTypes.object.isRequired,
  data: PropTypes.shape({
    allTalksYaml: PropTypes.array,
  }).isRequired,
};

export default Talks;

export const pageQuery = graphql`
  query {
    allTalksYaml(sort: { fields: [year], order: DESC }) {
      edges {
        node {
          ...Talk
        }
      }
    }
  }
`;
