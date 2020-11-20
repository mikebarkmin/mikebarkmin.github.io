import React from "react";
import PropTypes from "prop-types";
import { graphql } from "gatsby";
import styled from "styled-components";
import scroll from "../images/scroll.svg";
import computer from "../images/computer.svg";
import movie from "../images/movie.svg";

const Wrapper = styled.div`
  width: 100%;
  padding: 1rem;
  color: white;
  position: relative;
  border-radius: 0.5rem;
  text-align: center;
  background: ${(props) => props.bg};
  transition: transform 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
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

const Download = styled.div`
  margin-top: 10px;
  display: flex;
  justify-content: center;
  align-items: center;
`;

const DownloadLink = styled.a`
  background: none;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  color: white;
  font-size: 0.75rem;
  border: 0;
  width: 80px;
  margin: 0 35px;
  border: 2px solid transparent;

  &:hover {
    border: 2px solid orange;
    border-radius: 0.2rem;
  }

  transition: 0.5s all ease-out;
`;

const linearGradient = (c1, c2) => `linear-gradient(
    to right,
    ${c1} 0%,
    ${c2} 100%
  )`;

const gradients = {
  2020: linearGradient("Violet", "DarkViolet"),
  2019: linearGradient("Salmon", "#bb44bb"),
  2018: linearGradient("SteelBlue", "Teal"),
  2017: linearGradient("ForestGreen", "MediumSeaGreen"),
};

const PublicationCard = ({
  title,
  year,
  publisher,
  address,
  location,
  series,
  booktitle,
  subtitle,
  paper,
  presentation,
  video,
  authors,
}) => (
  <Wrapper bg={gradients[year]}>
    <Text>
      {year} - {series} - {location}
    </Text>
    <Title>{title}</Title>
    <Subtitle>{subtitle}</Subtitle>
    <Text>
      {authors.join("; ")}
      {year ? ` ${year}` : null}
      {booktitle ? `. ${booktitle}` : null}
      {address ? `. ${address}` : null}
      {publisher ? `: ${publisher}` : null}
    </Text>
    <Download>
      {paper !== null && (
        <DownloadLink href={paper} target="_blank">
          <img src={scroll} width={35} alt="Scroll" />
          <span>Paper</span>
        </DownloadLink>
      )}
      {video !== null && (
        <DownloadLink href={video} target="_blank">
          <img src={movie} width={35} alt="Movie" />
          <span>Video</span>
        </DownloadLink>
      )}
      {presentation !== null && (
        <DownloadLink
          href={presentation}
          target="_blank"
          rel="noopener noreferrer"
        >
          <img src={computer} width={35} alt="Computer" />
          <span>Presentation</span>
        </DownloadLink>
      )}
    </Download>
  </Wrapper>
);

export default PublicationCard;

PublicationCard.propTypes = {
  authors: PropTypes.arrayOf(PropTypes.string),
  title: PropTypes.string.isRequired,
  subtitle: PropTypes.string,
  booktitle: PropTypes.string,
  year: PropTypes.number.isRequired,
  location: PropTypes.string.isRequired,
  publisher: PropTypes.string,
  address: PropTypes.string,
  series: PropTypes.string,
  presentation: PropTypes.oneOfType([PropTypes.string, PropTypes.bool]),
  paper: PropTypes.oneOfType([PropTypes.string, PropTypes.bool]),
  video: PropTypes.string,
};

PublicationCard.defaultProps = {
  subtitle: null,
  booktitle: null,
  presentation: null,
  series: null,
  paper: null,
  publisher: null,
  address: null,
  video: null,
  authors: [],
};

export const query = graphql`
  fragment Publication on PublicationsYaml {
    id
    authors
    title
    subtitle
    booktitle
    series
    year
    location
    publisher
    address
    paper
    video
    presentation
  }
`;
