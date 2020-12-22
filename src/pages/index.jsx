import React from "react";
import PropTypes from "prop-types";
import { graphql } from "gatsby";

import Layout from "../components/Layout";
import Navigation from "../components/Navigation";

// Views
import Hero from "../views/Hero";
import Projects from "../views/Projects";
import Contact from "../views/Contact";
import Publications from "../views/Publications";
import Blog from "../views/Blog";

const Index = ({
  data: {
    allPublicationsYaml: publications,
    allProjectsYaml: projects,
    allMarkdownRemark: blogPosts,
  },
}) => {
  return (
    <Layout>
      <Navigation active="Home" />
      <Hero />
      <Projects projects={projects} />
      <Publications publications={publications} />
      <Blog posts={blogPosts} />
      <Contact />
    </Layout>
  );
};

Index.propTypes = {
  data: PropTypes.shape({
    allPublicationsYaml: PropTypes.array,
    allProjectsYaml: PropTypes.array,
    allMarkdownRemark: PropTypes.array,
  }).isRequired,
};

export default Index;

export const query = graphql`
  query {
    allPublicationsYaml(
      filter: { pin: { eq: true } }
      sort: { fields: year, order: DESC }
    ) {
      edges {
        node {
          ...Publication
        }
      }
    }
    allProjectsYaml(filter: { pin: { eq: true } }) {
      edges {
        node {
          ...Project
        }
      }
    }
    allMarkdownRemark(
      sort: { fields: frontmatter___date, order: DESC }
      limit: 4
    ) {
      edges {
        node {
          ...BlogPost
        }
      }
    }
  }
`;
