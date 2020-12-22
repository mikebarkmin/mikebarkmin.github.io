import React from "react";
import Layout from "../components/Layout";
import Navigation from "../components/Navigation";

function Uses() {
  return (
    <Layout>
      <Navigation active="Uses" />
      <div>
        Mostly zsh and neovim. You can find my dotfiles{" "}
        <a href="https://github.com/mikebarkmin/dotfiles">here</a>
      </div>
    </Layout>
  );
}

Uses.propTypes = {};

export default Uses;
