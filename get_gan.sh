# execute: bash get_gan.sh
CUDA_VISIBLE_DEVICES=0 
name=$"MHGAN"
mkdir ./content/$name
mkdir ./content/$name/checkpoints
outdir=./content/$name/checkpoints
echo $outdir
# Pass BEST weights here
wget -P $outdir https://huggingface.co/Mingguksky/PyTorch-StudioGAN/resolve/main/studiogan_official_ckpt/CIFAR10_tailored/CIFAR10-MHGAN-train-2022_02_14_18_23_18/model%3DD-best-weights-step%3D98000.pth
wget -P $outdir https://huggingface.co/Mingguksky/PyTorch-StudioGAN/resolve/main/studiogan_official_ckpt/CIFAR10_tailored/CIFAR10-MHGAN-train-2022_02_14_18_23_18/model%3DG-best-weights-step%3D98000.pth
wget -P $outdir https://huggingface.co/Mingguksky/PyTorch-StudioGAN/resolve/main/studiogan_official_ckpt/CIFAR10_tailored/CIFAR10-MHGAN-train-2022_02_14_18_23_18/model%3DG_ema-best-weights-step%3D98000.pth


python src/main.py --load_best \
-sf -sf_num 100 -metrics none -cfg ./src/configs/CIFAR10/$name.yaml \
-data data/cifar10 -ckpt ./content/$name/checkpoints -save ./content/$name