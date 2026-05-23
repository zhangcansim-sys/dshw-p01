P01：金融数据获取、管理与初步分析

1. 股票列表

| 代码   | 名称     | 行业   | 选股理由 |
|--------|----------|--------|----------|
| 601398 | 工商银行 | 银行   | 全球资产规模最大的银行，稳定高股息，代表大盘蓝筹 |
| 600036 | 招商银行 | 银行   | 零售银行标杆，ROE 持续领先，成长性突出 |
| 002594 | 比亚迪   | 汽车   | 新能源汽车龙头，垂直整合，出海加速 |
| 600104 | 上汽集团 | 汽车   | 传统车企转型代表，与大众、通用合资稳定 |
| 000002 | 万科A    | 房地产 | 行业标杆，财务稳健，危机中凸显韧性 |
| 600048 | 保利发展 | 房地产 | 央企背景，逆周期拿地能力强 |
| 600519 | 贵州茅台 | 白酒   | 稀缺消费品，定价权强，护城河深 |
| 000858 | 五粮液   | 白酒   | 浓香型白酒龙头，品牌力仅次于茅台 |
| 601088 | 中国神华 | 能源   | 煤电一体，高分红，受益于能源安全主线 |
| 600900 | 长江电力 | 能源   | 全球最大水电公司，现金流稳定，类债券资产 |

2. 数据来源

- **股票行情**：baostock，后复权，日度（2020-01-01 至今）  
- **市场指数**：沪深 300（000300）、中证 500（000905），来自 baostock，作为 CAPM 基准和中小盘参考  
- **宏观指标**：
  - CPI 同比：来自 akshare（macro_china_cpi_monthly），反映通胀水平，影响货币政策与资产定价  
  - M2 同比：来自 akshare（macro_china_money_supply），衡量货币供应量，与市场流动性和估值高度相关  
- **财务数据**：baostock（query_profit_data），净资产收益率（ROE）和净利润率，覆盖 2020‑2024 五个完整财年
3.存储方式

- **基础**：CSV（方式 A）—— 所有原始数据及清洗后数据均保存 CSV 副本  
- **进阶**：Parquet（方式 B）—— 清洗后的统一数据额外保存为 Parquet 格式  
- **选择 Parquet 的理由**：
  - 列式存储，读取指定列时无需加载整个文件，适合后续分析中按需取用  
  - 高效压缩，文件体积显著小于 CSV，降低存储和传输成本  
  - 类型安全（Schema 固化），避免 CSV 中因格式不一致导致的数据解析错误  
  - 与大数据生态（Spark、Arrow）无缝集成，便于扩展

4.GitHub 仓库与在线电子书

- GitHub 仓库：https://github.com/zhangcansim-sys/dshw-p01
- Quarto 在线电子书：https://zhangcansim-sys.github.io/dshw-p01/
- 独立分析报告：`report.html`

5.如何运行

1. **克隆仓库并进入项目目录**
   ```bash
   git clone https://github.com/zhangcansim-sys/dshw-p01.git
   cd dshw-p01
   ```
2. **创建并激活 Python 环境（Python 3.11 以上）**
   ```bash
   conda create -n dsfin_py311 python=3.11 -y
   conda activate dsfin_py311
   ```
3. **安装依赖**
   ```bash
   pip install -r requirements.txt
   ```
4. **运行数据下载**
   ```bash
   jupyter nbconvert --to notebook --execute 01_download.ipynb --output 01_download.ipynb
   ```
   或直接在 Jupyter 中打开 `01_download.ipynb` 并顺序执行所有 Cell。
5. **运行数据清洗**
   ```bash
   jupyter nbconvert --to notebook --execute 02_clean.ipynb --output 02_clean.ipynb
   ```
   或直接在 Jupyter 中打开 `02_clean.ipynb` 并顺序执行所有 Cell。
6. **（可选）运行分析**
   - 打开 `03_analysis.ipynb` 执行描述统计与回归分析。
   - 最终分析报告见 `report.html`。

7. **渲染 Quarto 在线电子书**
   ```bash
   quarto render
   ```
   本仓库已配置 GitHub Actions。推送到 GitHub 后，workflow 会自动渲染 Quarto book 并部署到 GitHub Pages。
