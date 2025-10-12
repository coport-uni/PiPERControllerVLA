source ~/miniconda3/etc/profile.d/conda.sh
conda activate lerobot

HF_USER=$(hf auth whoami | head -n 1)
echo $HF_USER

python src/lerobot/camera_prop.py \
--camera_setting="[ \
    {path_or_index: '/dev/video0', gain: 50.0, temperature: 5600}, \
    {path_or_index: '/dev/video4', gain: 50.0, temperature: 5600}, \
    {path_or_index: '/dev/video6', gain: 100.0, temperature: 5600}]" \
--usercon=false

python src/lerobot/scripts/server/robot_client.py \
--server_address=127.0.0.1:8088 \
--robot.type=piper_follower \
--robot.port=can0 \
--robot.id=black \
--robot.cameras="{ \
    top: {type: opencv, index_or_path: '/dev/video0', width: 640, height: 480, fps: 30}, \
    left: {type: opencv, index_or_path: '/dev/video4', width: 640, height: 480, fps: 30}, \
    hand: {type: opencv, index_or_path: '/dev/video6', width: 640, height: 480, fps: 30}}" \
--policy_type=smolvla \
--pretrained_name_or_path=wego-hansu/piper_smolvla \
--policy_device=cuda \
--actions_per_chunk=100  \
--chunk_size_threshold=0.2 \
--aggregate_fn_name=average \
--debug_visualize_queue_size=True \
--task="Grab the yellow car and put in the box"  \
# --server_address=192.168.0.42:8088 \
