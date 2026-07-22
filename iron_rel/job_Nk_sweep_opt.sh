#!/bin/bash
#SBATCH -p local
#SBATCH -J q-e_iron-rel_nk-sweep
#SBATCH --nodes=1
#SBATCH --ntasks=8
#SBATCH --cpus-per-task=1
#SBATCH --mem=12G
#SBATCH --hint=nomultithread
#SBATCH -t 10:00:00
#SBATCH -o slurm_logs/nk-sweep-%j.log

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

for i in {25..100..25}
do
	echo "========== $i =========="
	sed "s/Nk/$i/g" iron.win.opt_template > iron.win
	time (mpirun --bind-to core --map-by core -np 8 postw90.x iron)
	dir="iron-kubo_Nk$i"
	mkdir -p $dir
	mv iron-kubo_S_*.dat "$dir/"
	mv iron-kubo_A_*.dat "$dir/"
	mv iron-jdos.dat "$dir/"
done

cp iron.win.backup iron.win
echo "ended at $(date)"

