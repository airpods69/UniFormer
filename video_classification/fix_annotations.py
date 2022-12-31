from multiprocessing import Process

import os
from tqdm import tqdm

# from slowfast.datasets.kinetics import Kinetics
# from slowfast.config.defaults import assert_and_infer_cfg
# from slowfast.utils.parser import load_config, parse_args

# args = parse_args()
# cfg = load_config(args)
# cfg = assert_and_infer_cfg(cfg)

# Step 1 -> To change the names in annotation file 
# Step 2 -> Clean the annotation files

def change_names(mode: str):
    path_to_org = f'/shared/home/v_varenyam_bhardwaj/local_scratch/UniFormer/video_classification/data_list/k400/{mode}.csv'
    f = open(path_to_org, 'r')

    path_to_new = f'/shared/home/v_varenyam_bhardwaj/local_scratch/UniFormer/video_classification/data_list/k400/{mode}_cleaned.csv'
    f_new = open(path_to_new, 'w')

    files = os.listdir(f'./dataset/{mode}')
    files_search = [file[:len("2YFIND4tXCc")] for file in files]

    for line in tqdm(f.readlines()):
        line_name = line.split('.')[0] # gets the name
        line_num = line.split(',')[1] # gets the number

        try:
            ind = files_search.index(line_name)
            f_new.write(f"{files[ind]},{line_num}")

        except:
            print(f"{line} not found... Skipping")

    print("Done!")

if __name__=="__main__":
    change_names(mode = "test")