#!/bin/bash
# Define the directory where you want to clone the repositories
BASE_DIR="ComfyUI/custom_nodes"

# List of repositories to clone
REPOS=(
    "https://github.com/ArtBot2023/CharacterFaceSwap"
    "https://github.com/evanspearman/ComfyMath"
    "https://github.com/sipherxyz/comfyui-art-venture"
    "https://github.com/ZHO-ZHO-ZHO/ComfyUI-BRIA_AI-RMBG"
    "https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes"
    "https://github.com/Fannovel16/comfyui_controlnet_aux"
    "https://github.com/hylarucoder/comfyui-copilot"
    "https://github.com/yolain/ComfyUI-Easy-Use"
    "https://github.com/cubiq/ComfyUI_essentials"
    "https://github.com/city96/ComfyUI-GGUF"
    "https://github.com/kijai/ComfyUI-IC-Light"
    "https://github.com/huchenlei/ComfyUI-IC-Light-Native"
    "https://github.com/spacepxl/ComfyUI-Image-Filters"
    "https://github.com/ltdrdata/ComfyUI-Impact-Pack"
    "https://github.com/john-mnz/ComfyUI-Inspyrenet-Rembg"
    "https://github.com/cubiq/ComfyUI_IPAdapter_plus"
    "https://github.com/kijai/ComfyUI-KJNodes"
    "https://github.com/Layer-norm/comfyui-lama-remover"
    "https://github.com/huchenlei/ComfyUI-layerdiffuse"
    "https://github.com/chflame163/ComfyUI_LayerStyle"
    "https://github.com/ltdrdata/ComfyUI-Manager"
    "https://github.com/shadowcz007/comfyui-mixlab-nodes"
    "https://github.com/omar92/ComfyUI-QualityOfLifeSuit_Omar92"
    "https://github.com/kijai/ComfyUI-segment-anything-2"
    "https://github.com/ai-shizuka/ComfyUI-tbox"
    "https://github.com/ssitu/ComfyUI_UltimateSDUpscale"
    "https://github.com/jags111/efficiency-nodes-comfyui"
    "https://github.com/palant/image-resize-comfyui"
    "https://github.com/taabata/LCM_Inpaint_Outpaint_Comfy"
    "https://github.com/BadCafeCode/masquerade-nodes-comfyui"
    "https://github.com/rgthree/rgthree-comfy"
    "https://github.com/twri/sdxl_prompt_styler"
    "https://github.com/WASasquatch/was-node-suite-comfyui"
    "https://github.com/XLabs-AI/x-flux-comfyui"
)

# Loop through each repo, clone it, and install requirements if applicable
for repo in "${REPOS[@]}"; do
    # Extract repo name from the URL
    REPO_NAME=$(basename "$repo" .git)
    TARGET_DIR="$BASE_DIR/$REPO_NAME"

    # Clone the repository
    if [ ! -d "$TARGET_DIR" ]; then
        git clone "$repo" "$TARGET_DIR"
    else
        echo "$REPO_NAME already exists, skipping clone."
    fi

    # Check if requirements.txt exists and install dependencies
    if [ -f "$TARGET_DIR/requirements.txt" ]; then
        echo "Installing dependencies for $REPO_NAME"
        pip install -r "$TARGET_DIR/requirements.txt"
    fi
done
