import React from "react";
import PropTypes from "prop-types";
import styled from "styled-components";
import { graphql } from "gatsby";
import Layout from "../components/Layout";
import Navigation from "../components/Navigation";
import BlogCard from "../components/BlogCard";

const Wrapper = styled.main`
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

function Blog({ data }) {
  const { allMarkdownRemark: posts } = data;
  return (
    <Layout>
      <Navigation active="Blog" />
      <Wrapper>
        {posts.edges.map(({ node }) => (
          <BlogCard {...node} key={node.id} />
        ))}
      </Wrapper>
    </Layout>
  );
}

Blog.propTypes = {
  data: PropTypes.shape({
    allMarkdownRemark: PropTypes.array,
  }).isRequired,
};

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
