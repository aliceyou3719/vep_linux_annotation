#!/bin/bash
# VEP 注释示例脚本 - 不可修改，仅可复制至自己目录使用，输出请输出至个人目录下，输出至you-binxin目录下的内容都会被拒绝
# ======================================================
# VEP 注释模板脚本 - 只读版本
# 请复制到自己的目录后修改使用
# 严禁直接修改此模板脚本！
# ======================================================
# 使用前请确保有读取输入文件和写入输出目录的权限

# 加载 VEP 环境
source /home/you-binxin/anaconda3/bin/activate
conda activate vep

# ==================== 必须修改的部分!!!! ====================
# 下面的路径改为自己的目录！
INPUT_VCF="/path/to/your/own/input.vcf"    # 请修改为输入文件路径
OUTPUT_DIR="/path/to/your/own/output/"     # 请修改为输出目录
OUTPUT_VCF="${OUTPUT_DIR}vep_annotated_output.vcf"
# ==========================================================

# 检查是否在修改模板（禁止直接运行模板）
if [ "$(dirname "$0")" = "/home/you-binxin/.vep" ]; then
    echo "错误：请勿直接运行模板脚本！"
    echo "请先复制到您自己的目录："
    echo "cp /home/you-binxin/.vep/vep_template_example.sh ~/my_vep_script.sh"
    echo "然后编辑 ~/my_vep_script.sh 中的路径"
    exit 1
fi

# 检查输出目录是否是you-binxin的目录（安全保护）
if [[ "$OUTPUT_DIR" == /home/you-binxin/* ]] || [[ "$OUTPUT_DIR" == /home/you-binxin ]]; then
    echo "错误：输出目录不能是 you-binxin 的目录！"
    echo "请修改 OUTPUT_DIR 为您自己的目录"
    exit 1
fi

# 检查输入文件是否存在
if [ ! -f "$INPUT_VCF" ]; then
    echo "错误：输入文件不存在: $INPUT_VCF"
    echo "请修改 INPUT_VCF 为正确的文件路径"
    exit 1
fi

# 创建输出目录
mkdir -p "$OUTPUT_DIR"

# VEP 参数
VEP_DIR="/home/you-binxin/.vep"
ASSEMBLY="GRCh37"  # 可选: GRCh37 或 GRCh38
CACHE_VERSION="101"

echo "开始 VEP 注释..."
echo "输入文件: $INPUT_VCF"
echo "输出文件: $OUTPUT_VCF"
echo "基因组版本: $ASSEMBLY"

# 运行 VEP
vep -i "$INPUT_VCF" \
    -o "$OUTPUT_VCF" \
    --cache --offline \
    --assembly "$ASSEMBLY" \
    --cache_version "$CACHE_VERSION" \
    --dir "$VEP_DIR" \
    --fasta "$VEP_DIR/homo_sapiens/${CACHE_VERSION}_${ASSEMBLY}/Homo_sapiens.${ASSEMBLY}.dna.primary_assembly.fa.gz" \
    --fork 4 \
    --vcf \
    --force_overwrite

# 检查运行结果
if [ $? -eq 0 ] && [ -f "$OUTPUT_VCF" ]; then
    echo "VEP 注释完成！"
    echo "输出文件: $OUTPUT_VCF"
    echo "文件大小: $(du -h "$OUTPUT_VCF" | cut -f1)"
else
    echo " VEP 运行失败，请检查错误信息"
    exit 1
fi
