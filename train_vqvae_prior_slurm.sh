#!/bin/bash
#SBATCH --job-name=probtalk3d
#SBATCH --partition=gpu  # submit to the serial queue
#SBATCH --time=2-00:00:00  # Maximum wall time for the job
#SBATCH --account=Research_Project-T127204  # research project to submit under
#SBATCH --nodes=1  # specify number of nodes
#SBATCH --ntasks-per-node=1  # specify the number of tasks per node
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=12  # cpus per task
#SBATCH --mem-per-cpu=8G  # GB memory requested per cpu-core
#SBATCH --output=probtalk3d.out  # submit script's standard-out
#SBATCH --error=probtalk3d.err  # submit script's standard-error

# Load necessary modules and activate conda environment
source ~/.bashrc
conda activate probtalk3d

cd /lustre/projects/Research_Project-T127204/xk219/projects/ai_digital_humans_repo_summary/develop/ProbTalk3D

srun python3.9 train_all.py \
    experiment=vqvae_prior \
    state=new \
    data=mead_prior \
    model=model_vqvae_prior