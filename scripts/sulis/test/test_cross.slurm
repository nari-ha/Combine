#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=42
#SBATCH --mem-per-cpu=3850
#SBATCH --gres=gpu:ampere_a100:1
#SBATCH --partition=gpu
#SBATCH --time=01:00:00
#SBATCH --account=su008-ec23709

module load GCCcore/12.2.0 Python/3.10.8
cd /home/e/ec23709/project/Combine
source ./../reid/bin/activate
python test_fit.py --config_file configs/clipfit/market1501.yml TEST.WEIGHT '/home/e/ec23709/project/Combine/output/clipfit/cross/RN50_120.pth'
python test_fit.py --config_file configs/clipfit/msmt17.yml TEST.WEIGHT '/home/e/ec23709/project/Combine/output/clipfit/cross/RN50_120.pth'
python test_fit.py --config_file configs/clipfit/person.yml TEST.WEIGHT '/home/e/ec23709/project/Combine/output/clipfit/cross/RN50_120.pth'
python test_fit.py --config_file configs/clipfit/veri.yml TEST.WEIGHT '/home/e/ec23709/project/Combine/output/clipfit/cross/RN50_120.pth'
python test_fit.py --config_file configs/clipfit/multi.yml TEST.WEIGHT '/home/e/ec23709/project/Combine/output/clipfit/cross/RN50_120.pth'
