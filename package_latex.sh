#!/bin/bash
shopt -s globstar

for latex_dir in **/latex/; do
    parent_dir=$(dirname $latex_dir)
    project_name=$(basename $parent_dir)

    pushd $latex_dir
    git archive --worktree-attributes --format=zip main . -o "../${project_name}-src.zip"
    popd
done