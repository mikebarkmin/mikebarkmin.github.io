import React from 'react';
import PropTypes from 'prop-types';
import styled from 'styled-components';
import Content from '../elements/Content';
import { Title } from '../elements/Titles';
import Inner from '../elements/Inner';
import BlogCard from '../components/BlogCard';
import Link from '../elements/Link';

const Wrapper = styled.div`
  display: grid;
  grid-gap: 4rem;

  @media (max-width: 1200px) {
    grid-gap: 3rem;
  }
  @media (max-width: 900px) {
    grid-gap: 2rem;
  }
`;

function Blog({ posts }) {
  return (
    <Content id="blog">
      <Inner>
        <Title>Recent Blog Posts</Title>
        <Wrapper>
          {posts.edges.map(({ node }) => (
            <BlogCard {...node} key={node.id} />
          ))}
        </Wrapper>
        <Link to="/blog">More Blog Posts</Link>
      </Inner>
    </Content>
  );
}

Blog.propTypes = {
  posts: PropTypes.shape({
    edges: PropTypes.array
  }).isRequired
};

export default Blog;
