#!/bin/bash

# Define the directory containing the subfolders
BASE_DIR="$(pwd)"

# Function to parse and plot using tgentools
parse_and_plot() {
    local node_dir=$1
    local node_name=$(basename $node_dir)
    
    echo "Processing $node_dir $node_name..."

    # Find all tgen.<number>.stdout files in the node directory
    for stdout_file in $node_dir/tgen.*.stdout; do
        if [[ -f $stdout_file ]]; then
            # Parse the file using tgentools
            tgentools parse $stdout_file
            # Plot the parsed file using tgentools
            tgentools plot --data tgen.analysis.json.xz "tgen-shadow-$node_name" --pngs
            mv tgen.viz.*.pdf tgen.viz.$node_name.pdf
            cp tgen.viz.$node_name.pdf ../../../result_pdf/tgen.viz.$node_name.pdf

        fi
    done
}

# Iterate over each subdirectory
for node_dir in $BASE_DIR/shadow.data/hosts/*; do
    if [[ -d $node_dir ]]; then
    	cd $node_dir
        parse_and_plot $node_dir
        cd ../
    fi
done

echo "Processing complete"

