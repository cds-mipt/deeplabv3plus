# Semantic Segmentation on the Mapillary Vistas Dataset using the [DeepLabv3+](https://github.com/tensorflow/models/tree/master/research/deeplab) model by Google TensorFlow

### Libraries:
```
tf.__version__ =  1.13.1
numpy.__version__ =  1.17.4
PIL.__version__   =  6.2.1
```
### Steps:
1. To clone this repository:
```
git clone https://github.com/cds-mipt/deeplabv3plus.git
```
2. To build the dataset, put images in `/deeplabv3plus/deeplab/datasets/winter_city/data/JPEGImages/`, put ground truth labels in `/deeplabv3plus/deeplab/datasets/winter_city/data/SegmentationClass/`, put dataset split filename lists (text files) in `/deeplabv3plus/deeplab/datasets/winter_city/data/ImageSets/`. 

3. To preprocess the dataset and generate tfrecord files for faster reading, please run from `deeplav3plus/deeplab/datasets`:
```
sh convert.sh
```

4. To run train, evaluate and visualize prediction using the model, use the following commands by running from `deeplav3plus/deeplab/main`:
Train:
```
sh train.sh 
```
Evaluation model:
```
sh eval.sh 
```
Visaulize the prediction:
```
sh vis.sh
```
## For more details see [instructions](https://github.com/cds-mipt/deeplabv3plus/blob/master/instructions.txt). 
