#!/bin/bash
# =============================================================================
# VEP Annotation Pipeline
# Copyright (c) 2025 You Binxin. All Rights Reserved.
# GitHub: https://github.com/aliceyou3719/vep_linux_annotation
# 
# 使用本脚本进行分析后，必须在相关出版物中引用：
# Citation: You Binxin. (2025). VEP Linux Annotation (v1.0) [Computer software]. 
#           GitHub repository. https://github.com/aliceyou3719/vep_linux_annotation
# =============================================================================

# 学术使用条款
echo "===================================================================="
echo "学术使用条款 Academic Use Agreement"
echo "===================================================================="
echo "1. 本脚本仅供学术研究使用"
echo "2. 使用本脚本产生的分析结果必须在相关出版物中正确引用"
echo "3. 未经许可不得用于商业用途"
echo "4. 引用格式见脚本开头注释或GitHub页面"
echo "===================================================================="

# 加载环境
source /home/you-binxin/anaconda3/bin/activate
conda activate vep

# 用户配置区域
INPUT_VCF="$1"
OUTPUT_DIR="$2"
ASSEMBLY="${3:-GRCh37}"

# 输入验证
if [ $# -lt 2 ]; then
    echo "Usage: $0 <input_vcf> <output_dir> [assembly:GRCh37|GRCh38]"
    echo "Example: $0 /path/to/input.vcf /path/to/output/ GRCh38"
    exit 1
fi

# 运行VEP
vep -i "$INPUT_VCF" \
    -o "${OUTPUT_DIR}/vep_annotated_$(date +%Y%m%d_%H%M%S).vcf" \
    --cache --offline \
    --assembly "$ASSEMBLY" \
    --cache_version 101 \
    --dir /home/you-binxin/.vep/ \
    --fasta "/home/you-binxin/.vep/homo_sapiens/101_${ASSEMBLY}/Homo_sapiens.${ASSEMBLY}.dna.primary_assembly.fa.gz" \
    --fork 4 \
    --vcf \
    --force_overwrite

# 生成引用提醒
echo "===================================================================="
echo "引用要求 Citation Requirement:"
echo "请在你的研究中引用:"
echo "You Binxin. (2025). VEP Linux Annotation (v1.0). "
echo "GitHub: https://github.com/aliceyou3719/vep_linux_annotation"
echo "===================================================================="
 
