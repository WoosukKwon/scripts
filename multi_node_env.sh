set -x

# export NCCL_ALGO=Ring
# export NCCL_PROTO=Simple

export DG_JIT_NVCC_COMPILER=/usr/local/cuda/bin/nvcc
export CUDA_HOME='/usr/local/cuda'

# export VLLM_ALL2ALL_BACKEND=pplx
# export VLLM_ALL2ALL_BACKEND=deepep_high_throughput
# export VLLM_USE_DEEP_GEMM=1

MODEL=deepseek-ai/DeepSeek-V3
TP_SIZE=1
DP_SIZE=16
DP_SIZE_LOCAL=8
LEADER_ADDRESS=192.168.0.100

# NUM_EXTRA_EXPERTS=32
# WINDOW=100
# EPLB_STEP_INTERVAL=$WINDOW
# EPLB_WINDOW_SIZE=$WINDOW

MAX_NUM_BATCHED_TOKENS=2048
MAX_MODEL_LEN=32768

GPU_MEMORY_UTILIZATION=0.90

# EPLB_ARGS="--enforce-eager --enable-eplb --num-redundant-experts $NUM_EXTRA_EXPERTS --eplb-step-interval $EPLB_STEP_INTERVAL --eplb-window-size $EPLB_WINDOW_SIZE --eplb-log-balancedness"
EPLB_ARGS=" "

DATE="deepseek_v3_$(date '+%Y-%m-%d_%H-%M-%S')"


# export LINE_PROFILE=1

# export VLLM_LOGGING_LEVEL=DEBUG

# export NCCL_DEBUG=INFO
# export NCCL_DEBUG_SUBSYS=ALL

export NVIDIA_GDRCOPY=enabled
export NVSHMEM_REMOTE_TRANSPORT=ibrc
export NVSHMEM_IB_ENABLE_IBGDA=true
export NVSHMEM_ENABLE_NIC_PE_MAPPING=true
export NVSHMEM_HCA_LIST="mlx5_0:1,mlx5_1:1,mlx5_2:1,mlx5_3:1,mlx5_4:1,mlx5_5:1,mlx5_6:1,mlx5_7:1"
