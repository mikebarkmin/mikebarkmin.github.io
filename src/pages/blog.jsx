import React from 'react';
import styled from 'styled-components';
import { Link, graphql } from 'gatsby';
import Layout from '../components/Layout';
import Navigation from '../components/Navigation';
import BlogCard from '../components/BlogCard';

export function BlogNavigation() {
  const links = [
    {
      name: 'Home',
      url: '/'
    },
    {
      name: 'Blog',
      url: '/blog'
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
  margin-top: 90px;

  @media (max-width: 1200px) {
    grid-gap: 3rem;
  }
  @media (max-width: 900px) {
    grid-gap: 2rem;
  }
`;

function Blog({ data }) {
  const { allMarkdownRemark: posts } = data;
  return (
    <Layout>
      <BlogNavigation />
      <Wrapper>
        {posts.edges.map(({ node }) => (
          <BlogCard {...node} key={node.id} />
        ))}
      </Wrapper>
    </Layout>
  );
}

export default Blog;

export const pageQuery = graphql`
  query {
    allMarkdownRemark(sort: { fields: [frontmatter___date], order: DESC }) {
      edges {
        node {
          ...BlogPost
        }
      }
    }
  }
`;
