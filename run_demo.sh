GPU_ID=$1
## Run inference with LCM (faster)
#flag=true
flag=false

if [ "$flag" = true ]; then
    CUDA_VISIBLE_DEVICES=$GPU_ID python run.py \
        --input_rgb_dir input/in-the-wild_example \
        --output_dir output/in-the-wild_example_lcm
fi

## Run inference with DDIM (paper setting)
flag=true
#flag=false

if [ "$flag" = true ]; then
    CUDA_VISIBLE_DEVICES=$GPU_ID python run.py \
        --checkpoint prs-eth/marigold-v1-0 \
        --denoise_steps 50 \
        --ensemble_size 10 \
        --input_rgb_dir input/in-the-wild_example \
        --output_dir output/in-the-wild_example
fi