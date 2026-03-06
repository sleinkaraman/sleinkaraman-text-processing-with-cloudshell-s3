# 💻 Text Processing with CloudShell & S3
This project demonstrates a cloud-native workflow for processing and analyzing business data using AWS CloudShell and Amazon S3. It focuses on using high-performance Linux text-processing utilities to transform raw data into actionable business insights without the need for local environments or complex database engines.

## 🎯 Project Overview
In many enterprise scenarios, data engineers need to perform quick, consistent, and scalable analysis on large CSV or log files. This project implements a Bash-automated ETL (Extract, Transform, Load) pipeline that:

- Ingests raw data from an S3 Data Lake.

- Processes data using high-speed Linux tools (AWK, Grep, Sed).

- Outputs structured analytical reports back to S3 for business consumption.


## 🛠️ Tech Stack & AWS Services

- **Amazon S3:** Used for persistent storage of raw input files and processed output reports.

- **AWS CloudShell:** Provided a pre-configured, browser-based Linux environment for consistent execution.

- **AWS CLI:** Leveraged for seamless data transfer and infrastructure management.

- **GNU Coreutils (AWK, Grep, Sort, WC):** Used as the primary engine for data transformation and statistical analysis.

## 📊 Data Insights Generated
Through advanced AWK scripting, the pipeline automatically generates the following reports:

- Regional Sales Summary: Aggregated total revenue and volume per geographic region.

- High-Value Audit: Isolated transactions exceeding $500 for financial review.

- Product Performance: Ranked product categories by transaction frequency and total sales volume.

## 🚀 How to Run the Pipeline

1. Environment Setup: Initialize the required S3 bucket and environment variables.

2. Data Ingestion: Upload the ```sales_data.txt``` to the ```/input``` prefix.

3. Execution: Run the automated script:
```
chmod +x process_data.sh
./process_data.sh
```
4. Verification: Check the``` /output``` prefix in S3 for the generated CSV reports.

## 📂 Repository Structure
```
.
├── data/
│   └── sales_data.txt       # Sample business dataset
├── scripts/
│   └── process_data.sh      # Automated analysis script (The heart of the project)
├── reports/                 # Sample processed outputs
│   ├── regional_summary.csv
│   └── product_performance.csv
└── README.md
```

## 🧠 Key Outcomes
- Automated Data Pipeline: Successfully implemented a complete ETL (Extract, Transform, Load) workflow, reducing manual data processing time through Bash automation.

- Infrastructure Consistency: Demonstrated the use of AWS CloudShell as a standardized, ephemeral environment to eliminate "it works on my machine" inconsistencies.

- High-Performance Text Processing: Utilized AWK's associative arrays for efficient memory-based data aggregation, bypassing the need for traditional SQL overhead for rapid analysis.

- Structured Data Lifecycle: Established a clean data governance pattern using S3 prefixes (```/input```, ```/output```) for organized data lake management.

- Scalability & Resilience: Designed scripts to handle dynamic resource naming and region-specific configurations for cross-region compatibility.
