source ~/miniconda3/etc/profile.d/conda.sh
conda activate lerobot

HF_USER=$(hf auth whoami | head -n 1)
echo $HF_USER

python src/lerobot/camera_prop.py \
--config_path=src/lerobot/camera_prop.yaml \
--usercon=false

python src/lerobot/scripts/server/robot_client.py \
    --server_address=10.0.12.139:17044 \
    --robot.type=piper_follower \
    --robot.port=can_follower \
    --robot.id=black \
    --robot.cameras="{ \
        top: {type: opencv, index_or_path: '/dev/video3', width: 640, height: 480, fps: 30}, \
        hand: {type: opencv, index_or_path: '/dev/video1', width: 640, height: 480, fps: 30}}" \
    --pretrained_name_or_path=pepijn223/pi0_base \
    --policy_type=pi0 \
    --policy_device=cuda \
    --task="Pick the black colored marker and put in the box" \
    --actions_per_chunk=50 \
    --chunk_size_threshold=0.5 \
    --aggregate_fn_name=weighted_average \
    --debug_visualize_queue_size=True
