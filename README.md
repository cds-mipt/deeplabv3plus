# Semantic Segmentation on the Mapillary Vistas Dataset using the [DeepLabv3+](https://github.com/tensorflow/models/tree/master/research/deeplab) [4] model by Google TensorFlow

### Packages:
```
tf.__version__ =  1.13.1
numpy.__version__ =  1.17.4
PIL.__version__   =  6.2.1
```
To preprocess masks, to convert data to tfrecord:
from `deeplav3plus/deeplab/datasets`:
```
sh convert.sh
```

To run train, evaluate and visualize prediction using the model, use the following commands by running:
from `deeplav3plus/deeplab/main`:
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
