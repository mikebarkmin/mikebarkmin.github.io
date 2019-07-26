import React from 'react';
import PropTypes from 'prop-types';
import styled from 'styled-components';

const Wrapper = styled.a`
  width: 100%;
  padding: 2rem;
  padding-top: 4rem;
  padding-bottom: 4rem;
  color: white;
  position: relative;
  border-radius: 0.5rem;
  background: ${props => props.bg};
  transition: transform 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
  &:hover {
    transform: translateY(-5px);
  }
`;

const Text = styled.div`
  opacity: 0.75;
  font-size: 1rem;
  text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
`;

const Title = styled.div`
  font-size: 1.875rem;
  text-transform: uppercase;
  padding-top: 2rem;
  letter-spacing: 0.05em;
  color: white;
  padding-top: 2rem;
  text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
`;

const Subtitle = styled.div`
  padding-top: 2rem;
  letter-spacing: 0.05em;
  text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
`;

const PublicationCard = ({
  title,
  link,
  publisher,
  book,
  children,
  bg,
  subtitle,
  authors
}) => (
  <Wrapper href={link} target="_blank" rel="noopener noreferrer" bg={bg}>
    <Text>{children}</Text>
    <Title>{title}</Title>
    <Subtitle>{subtitle}</Subtitle>
    <Text>
      {authors.join('; ')} In: {book}. {publisher}
    </Text>
  </Wrapper>
);

export default PublicationCard;

PublicationCard.propTypes = {
  title: PropTypes.string.isRequired,
  subtitle: PropTypes.string,
  publisher: PropTypes.string.isRequired,
  book: PropTypes.string.isRequired,
  link: PropTypes.string,
  bg: PropTypes.string.isRequired,
  authors: PropTypes.arrayOf(PropTypes.string)
};

PublicationCard.defaultProps = {
  subtitle: null,
  link: null,
  authors: []
};
