# Usage:
#   # From the deeplabv3+/deeplab/main directory.
#   sh ./train.sh


# Exit immediately if a command exits with a non-zero status.
set -e

# Move one-level up to tensorflow/models/research directory.
cd ../..

# Update PYTHONPATH.
export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim

# Set up the working environment.
CURRENT_DIR=$(pwd)
WORK_DIR="${CURRENT_DIR}/deeplab"

# datasets folder
DATASET_DIR="datasets"

# Go back to original directory.
cd "${CURRENT_DIR}"

# Set up the working directories.
DATA_FOLDER="winter_city"

EXP_FOLDER="exp/results_cityscapes_384_640_8"

INIT_FOLDER="${WORK_DIR}/${DATASET_DIR}/init_models"
TRAIN_LOGDIR="${WORK_DIR}/${DATASET_DIR}/${DATA_FOLDER}/${EXP_FOLDER}/train"

mkdir -p "${TRAIN_LOGDIR}"


cd "${CURRENT_DIR}"

CURRENT_DATASET="${WORK_DIR}/${DATASET_DIR}/${DATA_FOLDER}/tfrecord"


NUM_ITERATIONS=10000
python "${WORK_DIR}"/train.py \
  --logtostderr \
  --train_split="train" \
  --model_variant="xception_65" \
  --atrous_rates=6 \
  --atrous_rates=12 \
  --atrous_rates=18 \
  --output_stride=16 \
  --decoder_output_stride=4 \
  --train_crop_size="384,640" \
  --train_batch_size=8 \
  --base_learning_rate=0.005 \
  --learning_rate_decay_step=200 \
  --weight_decay=0.00001 \
  --save_interval_secs=300 \
  --save_summaries_secs=300 \
  --training_number_of_steps="${NUM_ITERATIONS}" \
  --log_steps=20 \
  --fine_tune_batch_norm=true \
  --dataset="winter_city" \
  --tf_initial_checkpoint="${INIT_FOLDER}/deeplabv3_cityscapes_train/model.ckpt" \
  --initialize_last_layer=false \
  --last_layers_contain_logits_only=true \
  --train_logdir="${TRAIN_LOGDIR}" \
  --dataset_dir="${CURRENT_DATASET}"

# --tf_initial_checkpoint="${INIT_FOLDER}/deeplabv3_pascal_train_aug/model.ckpt" \