import React from 'react';
import styled from 'styled-components';
import Content from '../elements/Content';
import Inner from '../elements/Inner';
import { Title, Subtitle } from '../elements/Titles';
import PublicationCard from '../components/PublicationCard';
import Link from '../elements/Link';

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

const Publications = ({ publications }) => {
  return (
    <Content id="publications">
      <Inner>
        <Title>Selected Publications</Title>
        <PublicationsWrapper>
          {publications.edges.map(({ node }) => (
            <PublicationCard key={node.id} {...node} />
          ))}
        </PublicationsWrapper>
        <Link to="/publications">More Publications</Link>
      </Inner>
    </Content>
  );
};

export default Publications;
