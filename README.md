# Computational Physics (Quantum ESPRESSO)

## What we ran at [`iron_rel`](./iron_rel)

We first performed the SCF and no-SCF calculations ([`job.sh`](./iron_rel/job.sh)).
```sh
sbatch job.sh
```

Then, we performed the calculation of anomalous Hall conductivity by sweeping the number of $k$-meshes.
```sh
sbatch job_Nk_sweep.sh       # AHC with 4 MPI prcocesses
sbatch job_Nk_sweep_cpu8.sh  # AHC with 8 MPI prcocesses
sbatch job_Nk_sweep_opt.sh   # optical AHC with 8 MPI prcocesses
```

## Table: Computing environments

All calculations are performed on a Linux CPU running Fedora. Slurm is also used for time-consuming jobs.

| Item             | Environment                                                                                                                                           |
| ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| OS               | Fedora Linux 44, Linux kernel `6.19.10-300.fc44.x86_64`                                                                                               |
| CPU              | AMD Ryzen 7 7735U, 8 cores / 16 threads                                                                                                               |
| Memory           | approximately 16 GiB                                                                                                                                  |
| Quantum ESPRESSO | 8.0dev (commit [`5cea3446c`](https://gitlab.com/QEF/q-e/-/commit/5cea3446c983f943a236bc42ed84c76056277d1b))[^1], MPI/OpenMP enabled, FFTW3, ScaLAPACK |
| Job system       | Slurm 24.05.2                                                                                                                                         |
| Slurm            | Single-node local partition, 16 CPUs, 14,000 MB memory                                                                                                |

[^1]: The bundled Wannier90 build was locally patched to enable MPI parallelization of `postw90.x`.
