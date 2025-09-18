# VEP 共享使用指南

VEP 已安装在：/home/you-binxin/.vep/

## 使用方法：

1. 首先加载 conda 环境：
   source /home/you-binxin/anaconda3/bin/activate
   conda activate vep

2. 使用以下命令运行 VEP（GRCh37 or GRCh38）：
   vep -i 你的输入文件.vcf \
       -o 输出文件.vcf \
       --cache --offline \
       --assembly GRCh37 \
       --cache_version 101 \
       --dir /home/you-binxin/.vep/ \
       --fasta /home/you-binxin/.vep/homo_sapiens/101_GRCh37/Homo_sapiens.GRCh37.dna.primary_assembly.fa.gz \
# same as: homo_sapiens/101_GRCh38/...
       --fork 4 \
       --vcf

3. 复制模板脚本, 修改脚本中路径

必须修改以下变量：
- `INPUT_VCF`: 改为自己的输入文件路径，如：`/home/tangruijie/data/my_variants.vcf`
- `OUTPUT_DIR`: 改为自己的输出目录，如：`/home/tangruijie/vep_results/`

## 注意事项：
-  禁止直接运行模板脚本
-  禁止输出文件到 you-binxin 的目录
-  禁止修改模板脚本
-  必须复制到个人目录后使用
-  必须修改输入输出路径
-  输出目录要有写入权限

## 支持基因组版本：
- GRCh37 (默认)
- GRCh38 (修改 ASSEMBLY="GRCh38")

4. 示例用法

# 1. 复制模板
cp /home/you-binxin/.vep/vep_template_example.sh ~/vep_script.sh

# 2. 修改脚本
nano ~/vep_script.sh
# 修改这两行：
INPUT_VCF="/home/tangruijie/my_data/input.vcf"
OUTPUT_DIR="/home/tangruijie/vep_output/"

# 3. 运行
chmod +x ~/vep_script.sh
./vep_script.sh
