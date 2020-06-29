#!/bin/bash

RANK=0
WORLD_SIZE=1
DATA_PATH=/dataset/wikipedia_merged_output_json_text_sentence
CHECKPOINT_PATH=checkpoints/bert

python3.6 pretrain_bert.py \
       --num-layers 24 \
       --hidden-size 1024 \
       --num-attention-heads 16 \
       --batch-size 4 \
       --seq-length 512 \
       --max-position-embeddings 512 \
       --train-iters 200 \
       --save $CHECKPOINT_PATH \
       --load $CHECKPOINT_PATH \
       --data-path $DATA_PATH \
       --vocab-file /dataset/bert-vocab.txt \
       --data-impl mmap \
       --split 949,50,1 \
       --distributed-backend nccl \
       --lr 0.0001 \
       --min-lr 0.00001 \
       --lr-decay-style linear \
       --lr-decay-iters 990000 \
       --weight-decay 1e-2 \
       --clip-grad 1.0 \
       --warmup .01 \
       --log-interval 100 \
       --save-interval 10000 \
       --eval-interval 1000 \
       --eval-iters 10 \
       --fp16

