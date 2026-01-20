source /opt/conda/etc/profile.d/conda.sh
conda activate lerobot
# conda activate lerobot_origin

# HF_USER=$(hf auth whoami | head -n 1)
# echo $HF_USER

# JOB_NAME=$"piper_act_test1"
# echo $JOB_NAME

python ./src/lerobot/scripts/train.py \
--policy.device=cuda \
--num_workers=10 \
--dataset.repo_id=coport-uni/PiPER_pick_black_colored_marker_to_box \
--policy.type=act \
--output_dir=/workspace/VLARelated/PiPERControllerVLA/outputs/train/piper_act_test1 \
--job_name=piper_act_test1 \
--policy.push_to_hub=true \
--policy.repo_id=coport-uni/piper_act_test1_model \
--wandb.enable=true \
--dataset.video_backend=pyav   \
--batch_size=256   \
--steps=200000   \
--save_freq=5000 \
--resume=false  \

# python ./src/lerobot/scripts/train.py \
# --resume=true  \
# --config_path="/home/sw-han/lerobot/outputs/train/piper_smolvla_teleop_033_B/checkpoints/last/pretrained_model/" \

# accelerate launch \
#   --multi_gpu \
#   --num_processes=2 \
#   --num_machines=1 \
#   --mixed_precision=bf16 \
#   --dynamo_backend=no \
#   $(which lerobot-train) \
#   --policy.device=cuda \
#   --num_workers=10 \
#   --dataset.repo_id=coport-uni/PiPER_pick_black_colored_marker_to_box \
#   --policy.type=act \
#   --output_dir=/workspace/VLARelated/PiPERControllerVLA/outputs/train/piper_act_test1 \
#   --job_name=piper_act_test1 \
#   --policy.push_to_hub=true \
#   --policy.repo_id=coport-uni/piper_act_test1_model \
#   --wandb.enable=true \
#   --dataset.video_backend=pyav   \
#   --batch_size=128   \
#   --steps=200000   \
#   --save_freq=5000 \
#   --resume=false  \

#  python -m lerobot.datasets.v30.convert_dataset_v21_to_v30 --repo-id=coport-uni/piper-test8
# --dataset.repo_id=coport-uni/PiPER_pick_black_colored_marker_to_box \

accelerate launch $(which lerobot-train) \
  --policy.device=cuda \
  --num_workers=10 \
  --dataset.repo_id=coport-uni/PiPER_pick_black_colored_marker_to_box \
  --policy.type=act \
  --output_dir=/workspace/VLARelated/PiPERControllerVLA/outputs/train/piper_act_test1 \
  --job_name=piper_act_test1 \
  --policy.push_to_hub=true \
  --policy.repo_id=coport-uni/piper_act_test1_model \
  --wandb.enable=true \
  --dataset.video_backend=pyav   \
  --batch_size=256   \
  --steps=200000   \
  --save_freq=5000 \
  --resume=false  \

