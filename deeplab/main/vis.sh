# Usage:
#   # From the deeplabv3+/deeplab/main directory.
#   sh ./vis.sh


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
VIS_LOGDIR="${WORK_DIR}/${DATASET_DIR}/${DATA_FOLDER}/${EXP_FOLDER}/vis"

mkdir -p "${VIS_LOGDIR}"

cd "${CURRENT_DIR}"

CURRENT_DATASET="${WORK_DIR}/${DATASET_DIR}/${DATA_FOLDER}/tfrecord"

python "${WORK_DIR}"/vis.py \
  --logtostderr \
  --vis_split="test" \
  --model_variant="xception_65" \
  --atrous_rates=6 \
  --atrous_rates=12 \
  --atrous_rates=18 \
  --output_stride=16 \
  --decoder_output_stride=4 \
  --vis_crop_size="384,640" \
  --dataset="winter_city" \
  --colormap_type="winter_city" \
  --checkpoint_dir="${TRAIN_LOGDIR}" \
  --vis_logdir="${VIS_LOGDIR}" \
  --dataset_dir="${CURRENT_DATASET}" \
  --max_number_of_iterations=1