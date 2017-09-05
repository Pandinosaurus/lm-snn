#!/bin/bash
#
#SBATCH --partition=longq
#SBATCH --time=00-03:00:00
#SBATCH --mem=30000
#SBATCH --account=rkozma

connectivity=${1:-none}
conv_size=${2:-28}
conv_stride=${3:-0}
conv_features=${4:-100}
lattice_structure=${5:-4}
top_percent=${6:-10}
num_examples=${7:-10000}
reduced_dataset=${8:-True}
num_classes=${9:-10}
examples_per_class=${10:-500}
neighborhood=${11:-8}
inhib_scheme=${12:-far}
inhib_const=${13:-5.0}
strengthen_const=${14:-0.5}
noise=${15:-True}
noise_const=${16:-0.1}

cd ../train/

python csnn_pc_inhibit_far_mnist.py --mode=train --connectivity=$connectivity --weight_dependence=no_weight_dependence --post_pre=postpre --conv_size=$conv_size \
	--conv_stride=$conv_stride --conv_features=$conv_features --weight_sharing=$weight_sharing --lattice_structure=$lattice_structure --top_percent=$top_percent \
	--num_examples=$num_examples --reduced_dataset=$reduced_dataset --num_classes=$num_classes --examples_per_class=$examples_per_class --neighborhood=$neighborhood \
	--inhib_scheme=$inhib_scheme --inhib_const=$inhib_const --strengthen_const=$strengthen_const --noise=$noise --noise_const=$noist_const
python csnn_pc_inhibit_far_mnist.py --mode=test --connectivity=$connectivity --weight_dependence=no_weight_dependence --post_pre=postpre --conv_size=$conv_size \
	--conv_stride=$conv_stride --conv_features=$conv_features --weight_sharing=$weight_sharing --lattice_structure=$lattice_structure --top_percent=$top_percent \
	--num_examples=$num_examples --reduced_dataset=$reduced_dataset --num_classes=$num_classes --examples_per_class=$examples_per_class --neighborhood=$neighborhood \
        --inhib_scheme=$inhib_scheme --inhib_const=$inhib_const --strengthen_const=$strengthen_const --noise=$noise --noise_const=$noist_const

exit
