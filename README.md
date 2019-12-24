# Deeplabv3+
1. To clone directory:
    git clone 

2. in deeplabv3+/deeplab/datasets according to examples:
    1. ./classes_palette.py: 
        - CLASSES, PALETTE 
        
    2. ./convert.sh
        - WORK_DIR (L.11)
        - image_fromat (L.40)
        
    3. ./data_generator.py:
        - _WINTER_CITY_INFORMATION (L.102-110) 
        - name of dataset (L.116)
        - label (L.296-300) # don't change if there are test masks
        
3. in deeplabv3+/deeplab/utils:
    1. ./get_dataset_colormap.py:
        - name of dataset (L.43)
        - number of classes (L.51)
        - create_winter_city_label_colormap() (L.54-74)
        - get_winter_city_name() (L.76-77)
        - case for your dataset (L.412-413)
        
    2. ./train_utils.py:
        - L.113-133
        
4. deeplabv3+/deeplab/core:
    1. ./utils.py:
        - L.147-152
        
5. in deeplabv3+/deeplab/main:
    1. ./train.sh:
        - DATA_FOLDER (L.26)
        - EXP_FOLDER (L.28)
        - parameters of train.py (L.43-66)
    2. ./eval.sh:
        - DATA_FOLDER (L.26)
        - EXP_FOLDER (L.28)
        - parameters of eval.py (L.40-54)
    3. ./vis.sh:
        - DATA_FOLDER (L.26)
        - EXP_FOLDER (L.28)
        - parameters of vis.py (L.40-55)
