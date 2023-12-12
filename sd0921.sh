#!/bin/bash

nvidia-smi

pip install torch==2.0.1+cu118 torchvision xformers --extra-index-url https://download.pytorch.org/whl/cu118
pip install -U --pre triton

pip uninstall -y gradio
pip install gradio==3.9
pip list

apt -y install -qq aria2
apt -y install -qq ffmpeg

#!pip install opencv-python
#!pip install prettytable


cd /content/

#wget https://github.com/ekzhang/bore/releases/download/v0.4.0/bore-v0.4.0-x86_64-unknown-linux-musl.tar.gz
tar -xf bore-v0.4.0-x86_64-unknown-linux-musl.tar.gz
rm -f bore-v0.4.0-x86_64-unknown-linux-musl.tar.gz


#git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui
#git clone https://github.com/fujita1806/sui01
git clone https://github.com/fujita1806/sui0718

nvidia-smi

ls

mv sui01 fashion

mv sui01 fashion

mv sui0718 fashion

mv sui0718 fashion

mv stable-diffusion-webui fashion

cd /content/fashion/
#git checkout -f a9fed7c364061ae6efb37f797b6b522cb3cf7aa2 # Mar 14
#git checkout -f d35e24611172a49f7b3637c601dc0fb12c9d0326 # Jun 27 1.4.0
#git checkout -f 0fae47e97445df4e7de4d85538a80917fc2a2457 # Jul 19 1.4.1
#git checkout -f 92b99f32738832472ad69ca3c31a572ea9d8dc61 # Aug 6
git reset --hard d35e24611172a49f7b3637c601dc0fb12c9d0326 # Jun 27 1.4.0
#git reset --hard 0fae47e97445df4e7de4d85538a80917fc2a2457 # Jul 19 1.4.1

wget https://raw.githubusercontent.com/fujita1806/sui01/main/d35e24611172a49f7b3637c601dc0fb12c9d0326.txt -O /content/fashion/requirements_versions.txt

#wget https://raw.githubusercontent.com/fujita1806/sui01/main/0fae47e97445df4e7de4d85538a80917fc2a2457.txt -O /content/fashion/requirements_versions.txt

mkdir -p /content/fashion/extensions/
cd /content/fashion/extensions/
git clone https://github.com/fujita1806/sd-webui-controlnet
git clone https://github.com/fujita1806/stable-diffusion-webui-images-browser
git clone https://github.com/fujita1806/stable-diffusion-webui-rembg
git clone https://github.com/fujita1806/sd-webui-ar
git clone https://github.com/fujita1806/sdweb-easy-prompt-selector
git clone https://github.com/fujita1806/stable-diffusion-webui-wd14-tagger
git clone https://github.com/fujita1806/clip-interrogator-ext
git clone https://github.com/fujita1806/sd-dynamic-prompts
git clone https://github.com/fujita1806/sd-webui-mov2mov
git clone https://github.com/fujita1806/adetailer
git clone https://github.com/fujita1806/stable-diffusion-webui-model-toolkit
#git clone https://github.com/fujita1806/sd-webui-roop
#git clone https://github.com/continue-revolution/sd-webui-animatediff
#git clone https://github.com/fujita1806/sd-webui-prompt-all-in-one
#git clone https://github.com/fujita1806/infinite-zoom-automatic1111-webui /content/fashion/extensions/infinite-zoom-automatic1111-webui
#git clone -b dev https://github.com/fujita1806/SadTalker /content/fashion/extensions/SadTalker
#git -C /content/fashion/extensions/SadTalker/checkpoints clone https://huggingface.co/camenduru/SadTalker


cd /content/

wget  https://raw.githubusercontent.com/yuuki76/stable-diffusion-webui/ja-translation/localizations/ja_JP.json -O   /content/fashion/localizations/ja_JP.json
echo {\"localization\": \"ja_JP\"} >/content/fashion/config.json

# rm -rf /content/fashion/embeddings
mkdir -p /content/fashion/embeddings
cd /content/fashion/embeddings
# EasyNegative
wget https://huggingface.co/tanaka5/girl5lora/resolve/main/EasyNegative.zip -O /content/fashion/embeddings/EasyNegative.zip
unzip /content/fashion/embeddings/EasyNegative.zip
rm -rf /content/fashion/embeddings/EasyNegative.zip


# rm -rf /content/fashion/extensions/sd-dynamic-prompts/wildcards
mkdir -p /content/fashion/extensions/sd-dynamic-prompts/wildcards
cd /content/fashion/extensions/sd-dynamic-prompts/wildcards

wget https://huggingface.co/tanaka5/girl5lora/resolve/main/wildcard55.zip -O /content/fashion/extensions/sd-dynamic-prompts/wildcards/wildcard55.zip
unzip /content/fashion/extensions/sd-dynamic-prompts/wildcards/wildcard55.zip
rm -rf /content/fashion/extensions/sd-dynamic-prompts/wildcards/wildcard55.zip

# rm -rf /content/fashion/models/Lora
mkdir -p /content/fashion/models/Lora
cd /content/fashion/models/Lora

# LORA系モデル 
wget https://huggingface.co/tanaka5/girl5lora/resolve/main/akisino2r.zip -O /content/fashion/models/Lora/akisino2r.zip
unzip /content/fashion/models/Lora/akisino2r.zip
rm -rf /content/fashion/models/Lora/akisino2r.zip

# LORA系モデル 
wget https://huggingface.co/tanaka5/girl5lora/resolve/main/abe2r.zip -O /content/fashion/models/Lora/abe2r.zip
unzip /content/fashion/models/Lora/abe2r.zip
rm -rf /content/fashion/models/Lora/abe2r.zip


cd /content/

# LORA系モデル japanesedolllikeness
# wget https://civitai.com/api/download/models/34562 -O /content/fashion/models/Lora/JapaneseDollLikeness_v15.safetensors

# LORA系モデル Chun Li https://civitai.com/models/57006/street-fighter-chun-li
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://civitai.com/api/download/models/61422 -d /content/fashion/models/Lora -o ChunLi_v1.safetensors
# LORA系モデル CBAV-kana https://civitai.com/models/24156?modelVersionId=83175
# aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://civitai.com/api/download/models/83175 -d /content/fashion/models/Lora -o CBAV-kana.safetensors
# LORA系モデル NishinoN_V2 https://civitai.com/models/24220/idolnishinonjp?modelVersionId=36534
# aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://civitai.com/api/download/models/36534 -d /content/fashion/models/Lora -o NishinoN_V2.safetensors
# LORA系モデル Naomi https://civitai.com/models/32091?modelVersionId=38532
# aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://civitai.com/api/download/models/38532 -d /content/fashion/models/Lora -o Naomi.safetensors
# LORA系モデル grav-misaki https://civitai.com/models/23740?modelVersionId=28362
# aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://civitai.com/api/download/models/28362 -d /content/fashion/models/Lora -o grav-misaki.safetensors
# LORA系モデル Idol_Sashihara https://civitai.com/models/27992?modelVersionId=57821
# aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://civitai.com/api/download/models/57821 -d /content/fashion/models/Lora -o Idol_Sashihara.safetensors
# LORA系モデル grav-nagi https://civitai.com/models/24707?modelVersionId=29556
# aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://civitai.com/api/download/models/29556 -d /content/fashion/models/Lora -o grav-nagi.safetensors


mkdir -p /content/fashion/models/Stable-diffusion

# リアル系モデル Stable Diffusion 1.5 モデル
# wget https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.safetensors -O /content/fashion/models/Stable-diffusion/v1-5-pruned-emaonly.safetensors

# リアル系モデル DreamShaperのinpaintモデル
# aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://civitai.com/api/download/models/81594 -d /content/fashion/models/Stable-diffusion -o dreamshaper_6Inpainting.safetensors

# リアル系モデル Basil Korea
# aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://civitai.com/api/download/models/41754 -d /content/fashion/models/Stable-diffusion -o BasilKorea.safetensors

# アニメ系モデル Secta
# wget https://huggingface.co/umikaze/Secta/resolve/main/Secta-v1-1.safetensors -O /content/fashion/models/Stable-diffusion/Secta-v1-1.safetensors

# アニメ系モデル hakoMayC
# wget https://huggingface.co/852wa/hakoMay/resolve/main/hakoMayC.safetensors -O /content/fashion/models/Stable-diffusion/hakoMayC.safetensors

# アニメ系モデル anything-v4.5 anything v4.5 vae download
wget https://huggingface.co/ckpt/anything-v4.5-vae-swapped/resolve/main/anything-v4.5-vae-swapped.safetensors -O /content/fashion/models/Stable-diffusion/anything-v4.5-vae-swapped.safetensors

# wget https://huggingface.co/Airic/Anything-V4.5/resolve/main/Anything-v4.5-pruned-mergedVae.safetensors -O /content/fashion/models/Stable-diffusion/anything-v4.5-vae-fp16.safetensors

# wget https://huggingface.co/tanaka5/models-Stable-diffusion/resolve/main/anything-v4.5-vae-Fp16-0915.safetensors -O /content/fashion/models/Stable-diffusion/anything-v4.5-vae-Fp16-0915.safetensors

# アニメ系モデル anylora
# wget https://civitai.com/api/download/models/29792 -O /content/fashion/models/Stable-diffusion/anyloraCheckpoint_bakedvaeFtmseFp16NOT.safetensors

# リアル系モデル AWPortrait
wget https://civitai.com/api/download/models/65640 -O /content/fashion/models/Stable-diffusion/AWPortrait.safetensors

# リアル系モデル snapdd
# wget https://civitai.com/api/download/models/25772 -O /content/fashion/models/Stable-diffusion/snapdd00_v1.safetensors

# wget https://huggingface.co/tanaka5/models-Stable-diffusion/resolve/main/snapdd00-Fp16-0915.safetensors -O /content/fashion/models/Stable-diffusion/snapdd00_v1.safetensors

# リアル系モデル chilloutmix
# aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/chilloutmix/resolve/main/chilloutmix_NiPrunedFp32Fix.safetensors  -d /content/fashion/models/Stable-diffusion -o chilloutmix_NiPrunedFp32Fix.safetensors

# リアル系モデル yayoi_mix
# wget https://civitai.com/api/download/models/112499  -O /content/fashion/models/yayoi_mix.safetensors

# リアル系モデル ddosmix
# wget https://civitai.com/api/download/models/12183 -O /content/fashion/models/Stable-diffusion/ddosmix_V2.safetensors

# リアル系モデル BracingEvoMix
# wget https://huggingface.co/sazyou-roukaku/BracingEvoMix/resolve/main/BracingEvoMix_v1.safetensors -O /content/fashion/models/Stable-diffusion/BracingEvoMix_v1.safetensors

# リアル系モデル museV1
# wget https://civitai.com/api/download/models/15980 -O /content/fashion/models/Stable-diffusion/museV1_v1.safetensors
# リアル系モデル blueberrymix
# wget https://civitai.com/api/download/models/16859 -O /content/fashion/models/Stable-diffusion/blueberrymix_10.safetensors

# リアル系モデル braBeautifulRealistic
# aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/ckpt/BraV4/resolve/main/braBeautifulRealistic_v40.safetensors  -d /content/fashion/models/Stable-diffusion -o braBeautifulRealistic_v40.safetensors

# リアル系モデル BRAV5
# wget https://huggingface.co/BanKaiPls/AsianModel/resolve/main/BRAV5finalfp16.safetensors -O /content/fashion/models/Stable-diffusion/BRAV5finalfp16.safetensors

mkdir -p /content/fashion/models/VAE

aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors  -d /content/fashion/models/VAE -o vae-ft-mse-840000-ema-pruned.safetensors



cd /content/fashion/extensions/sd-webui-controlnet/models/

wget https://huggingface.co/ioclab/ioc-controlnet/resolve/main/models/control_v1p_sd15_brightness.safetensors -O /content/fashion/extensions/sd-webui-controlnet/models/control_v1p_sd15_brightness.safetensors
wget https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_canny-fp16.safetensors -O /content/fashion/extensions/sd-webui-controlnet/models/control_canny-fp16.safetensors
wget https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_depth-fp16.safetensors -O /content/fashion/extensions/sd-webui-controlnet/models/control_depth-fp16.safetensors
wget https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_hed-fp16.safetensors -O /content/fashion/extensions/sd-webui-controlnet/models/control_hed-fp16.safetensors
wget https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_mlsd-fp16.safetensors -O /content/fashion/extensions/sd-webui-controlnet/models/control_mlsd-fp16.safetensors
wget https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_normal-fp16.safetensors -O /content/fashion/extensions/sd-webui-controlnet/models/control_normal-fp16.safetensors
wget https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_openpose-fp16.safetensors -O /content/fashion/extensions/sd-webui-controlnet/models/control_openpose-fp16.safetensors
wget https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_scribble-fp16.safetensors -O /content/fashion/extensions/sd-webui-controlnet/models/control_scribble-fp16.safetensors
wget https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_keypose-fp16.safetensors -O /content/fashion/extensions/sd-webui-controlnet/models/t2iadapter_keypose-fp16.safetensors
wget https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_seg-fp16.safetensors -O /content/fashion/extensions/sd-webui-controlnet/models/t2iadapter_seg-fp16.safetensors
wget https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_sketch-fp16.safetensors -O /content/fashion/extensions/sd-webui-controlnet/models/t2iadapter_sketch-fp16.safetensors
wget https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/ip-adapter_sd15.pth -O /content/fashion/extensions/sd-webui-controlnet/models/ip-adapter_sd15.pth

cd /content/fashion/extensions/sd-webui-controlnet/models/

wget https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11e_sd15_shuffle.pth -O control_v11e_sd15_shuffle.pth
wget https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_lineart.pth -O control_v11p_sd15_lineart.pth
wget https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15s2_lineart_anime.pth -O control_v11p_sd15s2_lineart_anime.pth
wget https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11e_sd15_ip2p.pth -O control_v11e_sd15_ip2p.pth
wget https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_softedge.pth -O control_v11p_sd15_softedge.pth
wget https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11f1e_sd15_tile.pth -O control_v11f1e_sd15_tile.pth
wget https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_inpaint.pth -O control_v11p_sd15_inpaint.pth



mkdir -p /tmp/gradio/

cd /content/fashion
#!python launch.py --no-hashing --share --skip-extensions --auth v1111:abcdefghijklmnopqrstuvwxyz
#!python launch.py --listen --xformers --enable-insecure-extension-access --theme dark --gradio-queue --multiple
#!python launch.py --share --xformers --enable-insecure-extension-access

#!python launch.py --no-hashing --share
nvidia-smi

pip freeze --all > 000requirements.txt

ls

python launch.py --share --xformers --enable-insecure-extension-access

#python launch.py --share --xformers --enable-insecure-extension-access & /content/bore local 7860 --to bore.pub

