pixiu_path='/root/PIXIU'
export PYTHONPATH="$pixiu_path/src:$pixiu_path/src/financial-evaluation:$pixiu_path/src/metrics/BARTScore"
echo $PYTHONPATH
export CUDA_VISIBLE_DEVICES="0,1,2,3"

# model_args是HuggingFaceAutoLM的参数，用`,`连接
# 下载模型`https://drive.google.com/u/0/uc?id=1_7JfF7KOInb7ZrxKHIigTMR4ChVET01m&export=download`到`src/metrics/BARTScore/bart_score.pth`

python src/eval.py \
    --model hf-causal-llama \
    --tasks flare_fpb,flare_fiqasa,flare_headlines,flare_finqa \
    --model_args use_accelerate=True,pretrained=lmsys/vicuna-7b-v1.3,tokenizer=lmsys/vicuna-7b-v1.3,use_fast=False,max_gen_toks=16,dtype=float16 \
    --no_cache \
    --batch_size 4 \
    --model_prompt 'finma_prompt' \
    --num_fewshot 0 \
    --write_out

python src/eval.py \
    --model hf-causal-llama \
    --tasks flare_ner \
    --model_args use_accelerate=True,pretrained=lmsys/vicuna-7b-v1.3,tokenizer=lmsys/vicuna-7b-v1.3,use_fast=False,max_gen_toks=256,dtype=float16 \
    --no_cache \
    --batch_size 4 \
    --model_prompt 'finma_prompt' \
    --num_fewshot 0 \
    --write_out

# python src/eval.py \
#     --model hf-causal-llama \
#     --tasks flare_finqa,flare_convfinqa,flare_fpb,flare_fiqasa,flare_headlines,flare_fomc,flare_german,flare_australian,flare_sm_bigdata,flare_sm_acl,flare_sm_cikm \
#     --model_args use_accelerate=True,pretrained=ChanceFocus/finma-7b-nlp,tokenizer=ChanceFocus/finma-7b-nlp,use_fast=False,max_gen_toks=16,dtype=float16 \
#     --no_cache \
#     --batch_size 2 \
#     --model_prompt 'finma_prompt' \
#     --num_fewshot 0 \
#     --write_out

# python src/eval.py \
#     --model hf-causal-llama \
#     --tasks flare_ner,flare_finer_ord,flare_ectsum \
#     --model_args use_accelerate=True,pretrained=ChanceFocus/finma-7b-nlp,tokenizer=ChanceFocus/finma-7b-nlp,use_fast=False,max_gen_toks=256,dtype=float16 \
#     --no_cache \
#     --batch_size 2 \
#     --model_prompt 'finma_prompt' \
#     --num_fewshot 0 \
#     --write_out

# python src/eval.py \
#     --model hf-causal-llama \
#     --tasks flare_edtsum \
#     --model_args use_accelerate=True,pretrained=ChanceFocus/finma-7b-nlp,tokenizer=ChanceFocus/finma-7b-nlp,use_fast=False,max_gen_toks=512,dtype=float16 \
#     --no_cache \
#     --batch_size 2 \
#     --model_prompt 'finma_prompt' \
#     --num_fewshot 0 \
#     --write_out
