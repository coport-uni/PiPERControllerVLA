# 1 Setup
VLA 오랜만에 잡아보니 예전에 내가 1년전에? 했었을때랑 많이 달라졋다. 데이터세트도 RLDS로 일일히 만들던 때가 있었는데 요즘은 YOLO 느낌의 LeRobot이라는 플랫폼이 있다. 이번에는 이 플랫폼을 이용해서 PiPER 로봇을 ACT 모델로 제어하는 것을 목표로 진행한다. 
```
# 1 Miniconda 설치하기 - 만약 설치 안되어있다면 이번헤 하기. 원래 하드웨어 개발할때 venv만 써봤는데 앞으로는 conda로도 해봐야겠다.
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o Miniconda3-latest-Linux-x86_64.sh
sudo chmod +x Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.s
export PATH=$PATH:/home/user/miniconda3/bin
export PATH=$PATH:~/miniconda3/bin
# 이후 터미널 재시작
conda -V

# 2 repo 셋업, huggingface 계정이랑 토큰도 미리 준비할 것, 학습환경이면 wandb도!
git clone ``
conda create -n lerobot python=3.10
conda activate lerobot
conda install ffmpeg -c conda-forge
sudo apt-get install cmake build-essential python3-dev pkg-config libavformat-dev libavcodec-dev libavdevice-dev libavutil-dev libswscale-dev libswresample-dev libavfilter-dev
pip install -e .
pip install lerobot[all]  rich
hf auth login
wandb login
```

# 2 하드웨어
미리 우리 연구실 세팅(PiPER, C922)에 맞게 값들이랑 코드를 수정해놓았으니 카메라나 CAN 포트만 바로 잡고 쓸 수 있을 것 같다. 나중에 FR5 로봇으로 VLA할때 어떻게 lerobot에 통합할지 많이 고민해보면서 해봐야겠다.

# 3 사용
순서대로 sh 파일 돌리면서 해보면된다. 개인적으로 로봇 id에 black, blue라고 하는 것은 관행인가 싶다. 혹시 몰라 PiPERControllerMK2 소스도 넣어놓았다.

# 4 리뷰
데이터 세트 수집은 잘되는데, 생각보다 시간에 맞춰서 실수 없이 녹화해야해서 빡센 것 같다. 차라리 녹화하며 많이 연습해야겟다! 기본 teleoperation 모드 대비 약간 반응이 느린 것도 적응해야한다. 
[데이터세트 예시](https://huggingface.co/spaces/lerobot/visualize_dataset?path=%2Fcoport-uni%2Fpiper-test8%2Fepisode_0)