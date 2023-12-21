#!/bin/bash
shopt -s globstar

for latex_dir in **/latex/; do
    parent_dir=$(dirname $latex_dir)
    project_name=$(basename $parent_dir)

    git archive --format zip HEAD:$latex_dir "${project_name}.zip" > $parent_dir/latex.zip

    echo $project_name
    echo $latex_dir
done