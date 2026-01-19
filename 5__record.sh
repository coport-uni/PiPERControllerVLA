source ~/miniconda3/etc/profile.d/conda.sh
conda activate lerobot

HF_USER=$(hf auth whoami | head -n 1)
echo $HF_USER

python ./src/lerobot/record.py \
--dataset.root="/home/sungwoo/workspace/lerobot/lerobot_piper/outputs/Datasets//PiPER_pick_black_colored_marker_to_box" \
--robot.type=piper_follower \
--robot.port=can_follower \
--robot.cameras="{ \
    top: {type: opencv, index_or_path: '/dev/video3', width: 640, height: 480, fps: 30}, \
    hand: {type: opencv, index_or_path: '/dev/video1', width: 640, height: 480, fps: 30}}" \
--robot.id=black   \
--teleop.type=piper_leader \
--teleop.port=can_leader \
--teleop.id=blue \
--display_data=true   \
--dataset.repo_id=coport-uni/PiPER_pick_black_colored_marker_to_box  \
--dataset.episode_time_s=20  \
--dataset.reset_time_s=15  \
--dataset.num_episodes=15  \
--dataset.single_task="Pick the black colored marker and put in the box" \
--resume=true
    # front: {type: opencv, index_or_path: '/dev/video4', width: 640, height: 480, fps: 30}}" \