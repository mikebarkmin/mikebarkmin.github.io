import React from 'react';
import PropTypes from 'prop-types';
import styled from 'styled-components';

const Wrapper = styled.a`
  width: 100%;
  padding: 8px;
  color: white;
  position: relative;
  border-radius: 5px;
  background: ${props => props.bg};
  transition: transform 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
  &:hover {
    transform: translateY(-5px);
  }
`;

const Text = styled.div`
  opacity: 0.75;
  font-family: sans;
  text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
`;

const Title = styled.div`
  text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
`;

const Subtitle = styled.div`
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
