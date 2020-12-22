import React from "react";
import PropTypes from "prop-types";
import styled from "styled-components";
import { graphql } from "gatsby";
import Layout from "../components/Layout";
import Navigation from "../components/Navigation";

const Wrapper = styled.article`
  padding: 2rem 6rem;
  background: rgba(0, 0, 0, 0.7);
  border-radius: 0.5rem;
  border-color: #ed1e79;
  margin-top: 40px;
  border-style: solid;
  border-width: 4px;
  line-height: 2;

  @media screen and (max-width: 800px) {
    padding: 2rem 2rem;
  }
`;

function BlogPost({ data }) {
  const {
    frontmatter: { title },
    timeToRead,
    html,
  } = data.markdownRemark;
  return (
    <Layout>
      <Navigation active="Blog" />
      <Wrapper>
        <h1>{title}</h1>
        <span>{timeToRead} min</span>
        <div dangerouslySetInnerHTML={{ __html: html }} />
      </Wrapper>
    </Layout>
  );
}

BlogPost.propTypes = {
  data: PropTypes.shape({
    markdownRemark: PropTypes.shape({
      frontmatter: PropTypes.shape({
        title: PropTypes.string,
        date: PropTypes.string,
      }),
      timeToRead: PropTypes.number,
      html: PropTypes.string,
    }),
  }).isRequired,
};

export default BlogPost;

export const query = graphql`
  query PostQuery($slug: String!) {
    markdownRemark(fields: { slug: { eq: $slug } }) {
      html
      excerpt
      timeToRead
      frontmatter {
        title
      }
    }
  }
`;
