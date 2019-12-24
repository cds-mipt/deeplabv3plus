import numpy as np
import os
import argparse
from PIL import Image
from tqdm import tqdm

from classes_palette import PALETTE
from print_utils import print_info_message, print_error_message

import os
os.environ["CUDA_DEVICE_ORDER"]="PCI_BUS_ID"   
os.environ["CUDA_VISIBLE_DEVICES"]="2,3"

def convert_from_color_segmentation(arr_3d):
    height = arr_3d.shape[0]
    width = arr_3d.shape[1]
    arr_2d = np.zeros((height, width), dtype=np.uint8)

    for c, i in PALETTE.items():
        m = np.all(arr_3d == np.array(c).reshape(1, 1, 3), axis=2)
        arr_2d[m] = i

    return arr_2d


def convert_mask(label_dir, save_dir):
    '''
    To remove the color-map in the masks.
    If your dataset have n classes including background, you should label all pixels from 0 to n-1.
    
    args:
        label_dir: directory of the 3 ch masks.
        save_dir: directory for converted masks.
        palette: mapping "color to number of class". Example:
            palette[(0, 0, 0)] = 0 #backgound
            palette[((0, 0, 255)] = 2 #car and etc.
    
    '''
    
    if os.path.isdir(save_dir):
        print_error_message(f'Folder "{save_dir}" alread exists. Delete the folder and re-run the code!!!"')
    else:
        os.mkdir(save_dir)

    label_files = os.listdir(label_dir)
    label_files.sort()

    for l_f in tqdm(label_files):
        path = os.path.join(label_dir, l_f)
        arr = np.array(Image.open(path))
        
        arr = arr[:,:,0:3]
        arr_2d = convert_from_color_segmentation(arr)
        
        new_path = os.path.join(save_dir, l_f)
        Image.fromarray(arr_2d).save(new_path)
        
    print_info_message('Converted masks were saved in the dir: {}'.format(save_dir))
    
    
if __name__ == "__main__":

    parser = argparse.ArgumentParser()
    parser.add_argument('--segmentation_folder', type=str, default=None, 
                        help='Folder containing 3-ch masks')
    
    parser.add_argument('--semantic_segmentation_folder', type=str, default=None, 
                        help='Folder containing 1-ch semantic segmentation annotations')
    
    args = parser.parse_args()
    convert_mask(label_dir = args.segmentation_folder,
                  save_dir = args.semantic_segmentation_folder)