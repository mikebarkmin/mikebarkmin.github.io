import React from "react";
import Layout from "../components/Layout";
import Navigation from "../components/Navigation";
import styled from "styled-components";

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

function Uses() {
  return (
    <Layout>
      <Navigation active="Uses" />
      <Wrapper>
        <h1>Uses</h1>
        <h2>Operation System</h2>
        <ul>
          <li>
            I am currently using{" "}
            <a href="https://silverblue.fedoraproject.org/">
              Fedora Silverblue
            </a>
            .
          </li>
          <li>
            Sometimes I have to use Microsoft Office or need to test my web apps
            in Safari. Therefore, I have a Windows and a Mac OS VM.
          </li>
        </ul>
        <h2>Hardware</h2>
        <p>
          <ul>
            <li>
              I am mainly using three keyboards. The one of my laptop, a custom
              build DZ60 with Cherry MX Silent Browns and a Lily58 Pro with
              Aliaz Silents.
            </li>
            <li>
              I use two mices a Logitech MX Master 2S and a Kensington SlimBlade
              Trackball.
            </li>
          </ul>
        </p>
        <h2>Coding Environment</h2>
        <ul>
          <li>
            I use <a href="https://neovim.io/">neovim</a> in combination with
            tmux and zsh as my primary coding environment. You can find my
            dotfiles <a href="https://github.com/mikebarkmin/.dotfiles">here</a>
            .
          </li>
          <li>
            Firefox has been my main browser since I move everything to Linux
            back in 2010.
          </li>
        </ul>
        <h2>Desktop Apps</h2>
        <ul>
          <li>
            <a href="https://obsidian.md">Obsidian</a> is my go-to app for
            notetaking and knowledge management.
          </li>
          <li>
            <a href="https://gimp.org">GIMP</a> and{" "}
            <a href="https://inkscape.org">Inkscape</a> are my favorite tools
            for designing everything.
          </li>
          <li>
            I am also using a bunch of other desktop apps, which you can find in
            my{" "}
            <a href="https://github.com/mikebarkmin/silberblau/blob/live/config/yafti.yml">
              UBlue configuration
            </a>
          </li>
        </ul>
        <h2>Backup Strategy</h2>
        <ul>
          <li>
            I use a managed <a href="https://nextcloud.org">Nextcloud</a>{" "}
            instance called{" "}
            <a href="https://www.hetzner.com/de/storage/storage-share">
              Storage Share
            </a>{" "}
            from Hetzner.
          </li>
          <li>
            I also backup my maschines to a{" "}
            <a href="https://www.hetzner.com/de/storage/storage-box">
              Storage Box
            </a>{" "}
            from Hetzner with{" "}
            <a href="https://torsion.org/borgmatic/">borgmatic</a>.
          </li>
          <li>
            I am also trying to keep my system immutable by using my custom Fedora Silverblue image. You can find it{" "}
            <a href="https://github.com/mikebarkmin/silberblau">here</a>.
          </li>
        </ul>
      </Wrapper>
    </Layout>
  );
}

Uses.propTypes = {};

export default Uses;
