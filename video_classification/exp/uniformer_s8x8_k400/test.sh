work_path=$(dirname $0)
PYTHONPATH=$PYTHONPATH:./slowfast \
python tools/run_net.py \
  --cfg $work_path/test.yaml \
  DATA.PATH_TO_DATA_DIR /local/scratch/c_adabouei/video_analysis/dataset/kinetics-dataset/all_files/k400_targz/ \
  DATA.PATH_PREFIX /local/scratch/c_adabouei/video_analysis/dataset/kinetics-dataset/all_files/k400_targz/ \
  DATA.PATH_LABEL_SEPARATOR "," \
  TRAIN.EVAL_PERIOD 5 \
  TRAIN.CHECKPOINT_PERIOD 1 \
  TRAIN.BATCH_SIZE 128 \
  NUM_GPUS 1 \
  UNIFORMER.DROP_DEPTH_RATE 0.1 \
  SOLVER.MAX_EPOCH 100 \
  SOLVER.BASE_LR 4e-4 \
  SOLVER.WARMUP_EPOCHS 10.0 \
  DATA.TEST_CROP_SIZE 224 \
  TEST.NUM_ENSEMBLE_VIEWS 4 \
  TEST.NUM_SPATIAL_CROPS 1 \
  TRAIN.ENABLE False \
  TEST.CHECKPOINT_FILE_PATH /shared/home/v_varenyam_bhardwaj/local_scratch/UniFormer/video_classification/models/uniformer_small_k400_8x8.pth \
  RNG_SEED 6666 \
  OUTPUT_DIR $work_path