source /opt/conda/etc/profile.d/conda.sh
conda activate lerobot
# conda activate lerobot_origin

# HF_USER=$(hf auth whoami | head -n 1)
# echo $HF_USER

huggingface-cli upload coport-uni/piper_90k \
  /workspace/VLARelated/PiPERControllerVLA/outputs/train/piper_act_test1/checkpoints/090000/pretrained_model