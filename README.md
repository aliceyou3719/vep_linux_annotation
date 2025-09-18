
# VEP Linux Annotation

## Citation Required 必须引用

If you use this pipeline in your research, you MUST cite:

**You Binxin. (2025). VEP Annotation Pipeline (v1.0) [Computer software]. GitHub repository. https://github.com/aliceyou3719/vep_linux_annotation**

```bibtex
@software{you_binxin_2025_vep_pipeline,
  author       = {You Binxin},
  title        = {VEP Linux Annotation},
  year         = 2025,
  publisher    = {GitHub},
  journal      = {GitHub repository},
  howpublished = {\url{https://github.com/aliceyou3719/vep_linux_annotation}},
  version      = {v1.0}
}
```

## License and Terms 许可协议

This software is provided for **academic research use only**. Commercial use is prohibited without permission.

### Usage Terms:
1. ✅ Academic research - Allowed with citation
2. ✅ Educational purposes - Allowed with citation  
3. ❌ Commercial use - Prohibited without license
4. ❌ Redistribution without attribution - Prohibited

## Quick Start

```bash
# Clone repository
git clone https://github.com/aliceyou3719/vep_linux_annotation.git

# Run pipeline
./vep_linux_annotation.sh input.vcf output_dir/ [GRCh37|GRCh38]
```

## Output

The pipeline generates VEP-annotated VCF files with complete variant annotations.
