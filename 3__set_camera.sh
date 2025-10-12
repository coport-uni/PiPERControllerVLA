source ~/miniconda3/etc/profile.d/conda.sh
conda activate lerobot

python src/lerobot/camera_prop.py \
--camera_setting="[ \
    {path_or_index: '/dev/video0', gain: 50.0, temperature: 5600}, \
    {path_or_index: '/dev/video4', gain: 50.0, temperature: 5600}, \
    {path_or_index: '/dev/video6', gain: 100.0, temperature: 5600}]" \
--usercon=true