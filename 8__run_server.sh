# source ~/miniconda3/etc/profile.d/conda.sh
source /opt/conda/etc/profile.d/conda.sh
conda activate lerobot

HF_USER=$(hf auth whoami | head -n 1)
echo $HF_USER

python src/lerobot/scripts/server/policy_server.py \
    --host=0.0.0.0 \
    --port=17044 \
    --fps=30 \
    --inference_latency=4