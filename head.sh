source multi_node_envs.sh

START_RANK=0

export NVSHMEM_BOOTSTRAP_UID_SOCK_IFNAME=ds-eap-2
export GLOO_SOCKET_IFNAME=ds-eap-2
export NCCL_SOCKET_IFNAME=ds-eap-2
export NCCL_IB_HCA=mlx5

vllm serve \
    $MODEL \
    --port 8080 \
    --gpu-memory-utilization $GPU_MEMORY_UTILIZATION \
    --enable-expert-parallel \
    --tensor-parallel-size $TP_SIZE \
    --data-parallel-size $DP_SIZE \
    --data-parallel-size-local $DP_SIZE_LOCAL \
    --data-parallel-address $LEADER_ADDRESS \
    --data-parallel-rpc-port 9876 \
    --data-parallel-start-rank $START_RANK \
    $EPLB_ARGS \
    --max_num_batched_tokens $MAX_NUM_BATCHED_TOKENS \
    --max-model-len $MAX_MODEL_LEN \
    --disable-log-requests \
    --trust-remote-code \
    --quantization fp8 \
    --kv-transfer-config \
        '{"kv_connector":"NixlConnector","kv_role":"kv_both"}' \
    --enforce-eager 2>&1 | tee logs/multi-node-leader-$DATE.log
