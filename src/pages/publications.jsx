import React from 'react';
import styled from 'styled-components';
import { graphql } from 'gatsby';
import Layout from '../components/Layout';
import Navigation from '../components/Navigation';
import PublicationCard from '../components/PublicationCard';

export function PublicationsNavigation() {
  const links = [
    {
      name: 'Home',
      url: '/'
    },
    {
      name: 'Publications',
      url: '/publications'
    }
  ];

  return <Navigation links={links} />;
}

const Wrapper = styled.div`
  padding: 0 6rem;

  @media screen and (max-width: 800px) {
    padding: 0 1rem;
  }

  display: grid;
  grid-gap: 4rem;
  grid-template-columns: 1fr 1fr;
  margin-top: 90px;

  @media (max-width: 1200px) {
    grid-gap: 3rem;
  }
  @media (max-width: 900px) {
    grid-gap: 2rem;
  }
`;

function Publications({ data }) {
  const { allPublicationsYaml: publications } = data;
  return (
    <Layout>
      <PublicationsNavigation />
      <Wrapper>
        {publications.edges.map(({ node }) => (
          <PublicationCard {...node} key={node.id} />
        ))}
      </Wrapper>
    </Layout>
  );
}

export default Publications;

export const pageQuery = graphql`
  query {
    allPublicationsYaml {
      edges {
        node {
          ...Publication
        }
      }
    }
  }
`;
