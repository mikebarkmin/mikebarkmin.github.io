import React from 'react';
import styled from 'styled-components';
import Content from '../elements/Content';
import Inner from '../elements/Inner';
import { Title, Subtitle } from '../elements/Titles';
import PublicationCard from '../components/PublicationCard';
import Link from '../elements/Link';
import publications from '../publications';

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

const Publications = () => {
  const years = Object.keys(publications);
  years.sort((a, b) => Number(b) - Number(a));
  return (
    <Content id="publications">
      <Inner>
        <Title>Publications</Title>
        <PublicationsWrapper>
          {years.map(year => {
            const entries = publications[year];
            const pubs = entries.map((entry, id) => (
              <PublicationCard
                key={id}
                bg="linear-gradient(to right, BlueViolet 0%, DodgerBlue 100%)"
                {...entry}
              />
            ));
            return [<Subtitle key={year}>{year}</Subtitle>, ...pubs];
          })}
        </PublicationsWrapper>
        <Link>More Publications</Link>
      </Inner>
    </Content>
  );
};

export default Publications;
