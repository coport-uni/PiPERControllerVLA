# source ~/miniconda3/etc/profile.d/conda.sh
source /opt/conda/etc/profile.d/conda.sh
conda activate lerobot_origin

HF_USER=$(hf auth whoami | head -n 1)
echo $HF_USER

# lerobot-edit-dataset \
#     --repo_id lerobot/pusht \
#     --operation.type delete_episodes \
#     --operation.episode_indices "[0, 2, 5]"

lerobot-edit-dataset \
    --repo_id coport-uni/PiPER_pick_black_colored_marker_to_box \
    --operation.type split \
    --operation.splits '{"train": 0.8, "val": 0.2}'