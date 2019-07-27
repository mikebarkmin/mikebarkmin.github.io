import React from 'react';
import PropTypes from 'prop-types';
import { graphql } from 'gatsby';
import styled from 'styled-components';

const Wrapper = styled.a`
  width: 100%;
  padding: 2rem;
  padding-top: 6rem;
  padding-bottom: 6rem;
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
  text-transform: uppercase;
  letter-spacing: 0.05em;
  font-size: 1.875rem;
  color: white;
  padding-top: 2rem;
  text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
`;

const gradients = [
  ['#D4145A', '#FBB03B'],
  ['#662D8C', '#ED1E79'],
  ['#009245', '#FCEE21'],
  ['#D585FF', '#00FFEE']
];

let gradientId = -1;

const ProjectCard = ({ name, link, children, tags = [] }) => {
  gradientId = (gradientId + 1) % gradients.length;
  return (
    <Wrapper
      href={link}
      target="_blank"
      rel="noopener noreferrer"
      bg={`linear-gradient(to right, ${gradients[gradientId][0]} 0%, ${
        gradients[gradientId][1]
      } 100%)`}
    >
      <Text>{children}</Text>
      <Title>{name}</Title>
      <Text>{tags.join(', ')}</Text>
    </Wrapper>
  );
};

export default ProjectCard;

ProjectCard.propTypes = {
  name: PropTypes.string.isRequired,
  link: PropTypes.string.isRequired,
  children: PropTypes.oneOfType([PropTypes.string, PropTypes.element])
    .isRequired,
  tags: PropTypes.arrayOf(PropTypes.string)
};

ProjectCard.defaultProps = {
  tags: []
};

export const query = graphql`
  fragment Project on ProjectsYaml {
    id
    name
    description
    link
    tags
  }
`;
