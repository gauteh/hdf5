#!/bin/bash

#SBATCH -p knl -C quad,cache
#SBATCH --nodes=1
#SBATCH -t 00:30:00
#SBATCH --mail-type=BEGIN,END,FAIL
##SBATCH --mail-user=<username>@sandia.gov
#SBATCH --export=ALL
#SBATCH --job-name=h5_ctestS

cd @HDF5_BINARY_DIR@
#run parallel tests except t_cache_image test
CMD="ctest . -R PAR_ -E t_cache_image -C Release -T test"

echo "Run $CMD. Test output will be in build/ctestP.out"
$CMD >& ctestP.out
echo "Done running $CMD"

