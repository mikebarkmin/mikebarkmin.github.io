const config = require('./config/website');

const pathPrefix = config.pathPrefix === '/' ? '' : config.pathPrefix;

module.exports = {
  /* General Information */
  siteMetadata: {
    siteUrl: config.siteUrl + pathPrefix
  },
  /* Plugins */
  plugins: [
    'gatsby-plugin-react-helmet',
    'gatsby-plugin-styled-components',
    {
      resolve: 'gatsby-source-filesystem',
      options: {
        path: `${__dirname}/src/images/`,
        name: 'images'
      }
    },
    {
      resolve: `gatsby-source-filesystem`,
      options: {
        path: `${__dirname}/content/blog`,
        name: `blog`
      }
    },
    {
      resolve: `gatsby-source-filesystem`,
      options: {
        path: `${__dirname}/content/projects`,
        name: `projects`
      }
    },
    {
      resolve: `gatsby-source-filesystem`,
      options: {
        path: `${__dirname}/content/publications`,
        name: `publications`
      }
    },
    'gatsby-transformer-yaml',
    {
      resolve: `gatsby-transformer-remark`,
      options: {
        plugins: [
          {
            resolve: 'gatsby-remark-prismjs'
          }
        ]
      }
    },
    'gatsby-transformer-sharp',
    'gatsby-plugin-sharp',
    {
      resolve: 'gatsby-plugin-manifest',
      options: {
        name: config.siteTitle,
        short_name: config.siteTitleShort,
        description: config.siteDescription,
        start_url: config.pathPrefix,
        background_color: config.backgroundColor,
        theme_color: config.themeColor,
        display: 'standalone',
        icons: [
          {
            src: '/favicons/android-icon-192x192.png',
            sizes: '192x192',
            type: 'image/png'
          }
        ]
      }
    },
    /* Must be placed at the end */
    {
      resolve: `gatsby-plugin-manifest`,
      options: {
        name: `Mike Barkmin - Personal Website`,
        short_name: `Mike Barkmin`,
        icon: `src/images/logo.png`,
        start_url: `/`,
        background_color: `#161619`,
        theme_color: `#6e54d5`,
        display: `standalone`
      }
    },
    'gatsby-plugin-offline',
    'gatsby-plugin-netlify'
  ]
};
