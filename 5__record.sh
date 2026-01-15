source ~/miniconda3/etc/profile.d/conda.sh
conda activate lerobot

HF_USER=$(hf auth whoami | head -n 1)
echo $HF_USER

python ./src/lerobot/record.py \
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
--dataset.repo_id=coport-uni/piper-test8  \
--dataset.episode_time_s=20  \
--dataset.reset_time_s=15  \
--dataset.num_episodes=5  \
--dataset.single_task="Pick the white block and put in the box" 
    # front: {type: opencv, index_or_path: '/dev/video4', width: 640, height: 480, fps: 30}}" \
