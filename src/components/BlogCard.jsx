import React from "react";
import PropTypes from "prop-types";
import { graphql, Link } from "gatsby";
import styled from "styled-components";

const Wrapper = styled(Link)`
  width: 100%;
  padding: 2rem;
  color: white;
  display: block;
  position: relative;
  border-radius: 0.5rem;
  background: linear-gradient(to right, #662d8c 0%, #ed1e79 100%);
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
  letter-spacing: 0.05em;
  color: white;
  text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
`;

const BlogCard = ({
  frontmatter: { title },
  fields: { slug },
  timeToRead,
  excerpt,
}) => (
  <Wrapper to={slug} aria-label={title}>
    <Text>{`${timeToRead} min`}</Text>
    <Title>{title}</Title>
    <Text>{excerpt} Read more</Text>
  </Wrapper>
);

export default BlogCard;

BlogCard.propTypes = {
  frontmatter: PropTypes.shape({
    date: PropTypes.string.isRequired,
    title: PropTypes.string.isRequired,
  }).isRequired,
  fields: PropTypes.shape({
    slug: PropTypes.string.isRequired,
  }).isRequired,
  timeToRead: PropTypes.number.isRequired,
  excerpt: PropTypes.string.isRequired,
};

export const query = graphql`
  fragment BlogPost on MarkdownRemark {
    id
    frontmatter {
      date
      title
    }
    fields {
      slug
    }
    timeToRead
    excerpt(pruneLength: 200)
  }
`;
