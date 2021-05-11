import React from "react";
import PropTypes from "prop-types";
import { graphql, Link } from "gatsby";
import styled from "styled-components";
import scroll from "../images/scroll.svg";
import computer from "../images/computer.svg";
import camera from "../images/camera.svg";

const Wrapper = styled.div`
  width: 100%;
  padding: 1rem;
  color: white;
  position: relative;
  border-radius: 0.5rem;
  text-align: center;
  scroll-margin: 120px;
  border-color: ${(props) => (props.active ? "#fbb03b" : props.bg)};
  border-style: solid;
  border-width: 4px;
  background-color: ${(props) =>
    props.active ? "rgba(251,176,59,0.1)" : "rgba(0, 0, 0, 0.5)"};
  transition: transform 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
`;

const Text = styled.div`
  opacity: 0.85;
  font-size: 1rem;
  text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
`;

const Citation = styled.div`
  opacity: 0.85;
  font-size: 1rem;
  margin-top: 2rem;
  text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
`;

const Title = styled.div`
  font-size: 1.4rem;
  text-transform: uppercase;
  padding-top: 2rem;
  letter-spacing: 0.05em;
  color: white;
  padding-top: 2rem;
  text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
`;

const Subtitle = styled.div`
  letter-spacing: 0.05em;
  font-size: 1.1rem;
  text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
`;

const Download = styled.div`
  margin-top: 10px;
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
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

const colors = {
  2021: "DarkViolet",
  2020: "Violet",
  2019: "Salmon",
  2018: "SteelBlue",
  2017: "ForestGreen",
};

const PublicationCard = ({
  id,
  title,
  editors,
  year,
  publisher,
  address,
  location,
  series,
  booktitle,
  subtitle,
  active,
  paper,
  presentation,
  video,
  authors,
}) => (
  <Wrapper id={id} active={active} bg={colors[year]}>
    <Link to={`/publications#${id}`}>
      <Text>
        {year} - {series} - {location}
      </Text>
      <Title>{title}</Title>
      <Subtitle>{subtitle}</Subtitle>
      <Citation>
        {authors.join("; ")}
        {year ? ` ${year}` : null}
        {editors ? `. In: ${editors.join("; ")} (ed.)` : null}
        {booktitle ? `: ${booktitle}` : null}
        {address ? `. ${address}` : null}

        {publisher ? `: ${publisher}` : null}
      </Citation>
    </Link>
    <Download>
      {paper !== null && (
        <DownloadLink href={paper} target="_blank" rel="noopener">
          <img src={scroll} style={{ width: 60 }} alt="Scroll" />
          <span>Paper</span>
        </DownloadLink>
      )}
      {video !== null && (
        <DownloadLink href={video} target="_blank" rel="noopener noreferrer">
          <img src={camera} style={{ width: 60 }} alt="Movie" />
          <span>Video</span>
        </DownloadLink>
      )}
      {presentation !== null && (
        <DownloadLink
          href={presentation}
          target="_blank"
          rel="noopener noreferrer"
        >
          <img src={computer} style={{ width: 60 }} alt="Computer" />
          <span>Presentation</span>
        </DownloadLink>
      )}
    </Download>
  </Wrapper>
);

export default PublicationCard;

PublicationCard.propTypes = {
  id: PropTypes.string.isRequired,
  active: PropTypes.bool,
  location: PropTypes.object.isRequired,
  editors: PropTypes.arrayOf(PropTypes.string),
  authors: PropTypes.arrayOf(PropTypes.string),
  title: PropTypes.string.isRequired,
  subtitle: PropTypes.string,
  booktitle: PropTypes.string,
  year: PropTypes.number.isRequired,
  publisher: PropTypes.string,
  address: PropTypes.string,
  series: PropTypes.string,
  presentation: PropTypes.oneOfType([PropTypes.string, PropTypes.bool]),
  paper: PropTypes.oneOfType([PropTypes.string, PropTypes.bool]),
  video: PropTypes.string,
};

PublicationCard.defaultProps = {
  active: false,
  subtitle: null,
  editors: null,
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
    editors
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
