#!/bin/bash

# Array of file paths and URLs
files=(
  "ComfyUI/models/unet/flux1-dev-fp8.safetensors https://huggingface.co/lllyasviel/flux1_dev/resolve/main/flux1-dev-fp8.safetensors"
  "ComfyUI/models/vae/ae.safetensors https://huggingface.co/black-forest-labs/FLUX.1-schnell/resolve/main/ae.safetensors"
  "ComfyUI/models/xlabs/controlnets/flux-canny-controlnet-v3.safetensors https://huggingface.co/XLabs-AI/flux-controlnet-canny-v3/resolve/main/flux-canny-controlnet-v3.safetensors"
  "ComfyUI/models/clip/clip_l.safetensors https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors"
  "ComfyUI/models/clip/t5xxl_fp16.safetensors https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp16.safetensors"
  "ComfyUI/models/checkpoints/epicrealism_naturalSinRC1VAE.safetensors https://civitai.com/api/download/models/143906?type=Model&format=SafeTensor&size=pruned&fp=fp16"
  "ComfyUI/models/unet/IC-Light/iclight_sd15_fc.safetensors https://huggingface.co/lllyasviel/ic-light/resolve/main/iclight_sd15_fc.safetensors"
  "ComfyUI/models/checkpoints/juggernautXL_v9Rdphoto2Lightning.safetensors https://huggingface.co/erohinem/SDXL/resolve/bb3b7fa6598742f81f3eae359fe39165ba29e6dd/juggernautXL_v9Rdphoto2Lightning.safetensors"
  "ComfyUI/models/controlnet/diffusers_xl_canny_full.safetensors https://huggingface.co/lllyasviel/sd_control_collection/resolve/d1b278d0d1103a3a7c4f7c2c327d236b082a75b1/diffusers_xl_canny_full.safetensors"
)

# Loop through the array and process each file
for file_info in "${files[@]}"; do
  # Split file path and URL
  file_path=$(echo $file_info | awk '{print $1}')
  file_url=$(echo $file_info | awk '{print $2}')

  # Create the directory if it doesn't exist
  dir=$(dirname "$file_path")
  mkdir -p "$dir"

  # Download the file
  echo "Downloading $file_url to $file_path..."
  curl -L "$file_url" -o "$file_path"

  if [ $? -eq 0 ]; then
    echo "Downloaded successfully!"
  else
    echo "Failed to download $file_url"
  fi
done

echo "All downloads complete."

