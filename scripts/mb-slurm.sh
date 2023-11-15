#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH --mail-user=user@email
#SBATCH --array=1-372
#SBATCH -p short
mb $SLURM_ARRAY_TASK_ID.nex