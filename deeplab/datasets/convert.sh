#!/bin/bash
# Script to preprocess the Winter City Dataset.
#
# Usage from deeplabv3+/deeplab/datasets:
#   sh ./convert.sh
# Exit immediately if a command exits with a non-zero status.

set -e

CURRENT_DIR=$(pwd)
WORK_DIR="./winter_city"

cd "${CURRENT_DIR}"

# Root path for data
DATA_ROOT="${WORK_DIR}/data"

# Convert the colormap in the ground truth annotations.
SEG_FOLDER="${DATA_ROOT}/SegmentationClass"
SEMANTIC_SEG_FOLDER="${DATA_ROOT}/SegmentationClassRaw"

echo "Converting masks ..."
python ./convert_mask.py \
  --segmentation_folder="${SEG_FOLDER}" \
  --semantic_segmentation_folder="${SEMANTIC_SEG_FOLDER}" 

# Build TFRecords of the dataset.
# First, create output directory for storing TFRecords.
OUTPUT_DIR="${WORK_DIR}/tfrecord"
mkdir -p "${OUTPUT_DIR}"

IMAGE_FOLDER="${DATA_ROOT}/JPEGImages"
LIST_FOLDER="${DATA_ROOT}/ImageSets"

echo "Converting to tfrecord..."
python ./build_winter_city_data.py \
  --image_folder="${IMAGE_FOLDER}" \
  --semantic_segmentation_folder="${SEMANTIC_SEG_FOLDER}" \
  --list_folder="${LIST_FOLDER}" \
  --image_format="jpg" \
  --output_dir="${OUTPUT_DIR}"