#!/bin/bash
#SBATCH -p local
#SBATCH -J q-e_iron-rel
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=1
#SBATCH --mem=12G
#SBATCH --hint=nomultithread
#SBATCH -t 10:00:00
#SBATCH -o slurm_logs/slurm-%j.log

set -e

export OMP_NUM_THREADS=1
export OMP_DYNAMIC=FALSE

export OPENBLAS_NUM_THREADS=1
export MKL_NUM_THREADS=1
export BLIS_NUM_THREADS=1

export PATH="$HOME/.local/src/q-e/build/bin:$PATH"
source /etc/profile.d/modules.sh
module purge
module load mpi/openmpi-x86_64

echo "started at $(date)"
time (mpirun --bind-to core --map-by core -np 4 pw.x -nk 4 -nd 1 -in iron.scf.in > iron.scf.out)
time (mpirun --bind-to core --map-by core -np 4 pw.x -nk 4 -nd 1 -in iron.nscf.in > iron.nscf.out)
time (wannier90.x -pp iron)
time (mpirun --bind-to core --map-by core -np 4 pw2wannier90.x -in iron.pw2wan.in > iron.pw2wan.out)
time (wannier90.x iron)
time (mpirun --bind-to core --map-by core -np 4 postw90.x iron)
echo "ended at $(date)"

