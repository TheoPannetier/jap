#!/bin/bash
#SBATCH --time=00:04:58 --partition=short

example_no=$1

module load git
module load R
git clone https://github.com/richelbilderbeek/peregrine.git
git pull https://github.com/richelbilderbeek/peregrine.git
sbatch ./peregrine/scripts/install_beast2.sh
sbatch ./peregrine/scripts/install_pirouette.sh
git clone --develop https://github.com/richelbilderbeek/pirouette_example_${example_no}.git
cd pirouette_example_${example_no}/
sbatch ../peregrine/scripts/run_r_script.sh example_${example_no}_gl.R
git commit -a
git push