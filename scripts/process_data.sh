

#!/bin/bash

# =================================================================
# Project: AWS S3 Text Processing Pipeline
# Description: Automated data analysis using Linux CLI tools on AWS
# Author: Selin
# =================================================================

# 1. Initialize Environment Variables
# Ensure BUCKET_NAME and AWS_REGION are set in your session
echo "🚀 Starting Data Processing Pipeline..."
echo "📂 Working with Bucket: ${BUCKET_NAME}"
echo "📍 Region: ${AWS_REGION}"

# 2. Setup Workspace
mkdir -p output
echo "✅ Local output directory initialized."

# 3. Data Ingestion (S3 to Local)
echo "📥 Downloading raw data from S3 Lake..."
aws s3 cp s3://${BUCKET_NAME}/input/sales_data.txt .

# 4. Transformation Layer (Data Analysis)
echo "📊 Executing analytical queries..."

# A. Regional Sales Summary
# Aggregating Sales ($4) and Quantity ($5) by Region ($2)
awk -F',' 'NR>1 {sales[$2]+=$4; qty[$2]+=$5} END {
    print "Region,Total_Sales,Total_Quantity";
    for (region in sales) 
        print region "," sales[region] "," qty[region]
}' sales_data.txt > output/regional_summary.csv

# B. High-Value Transactions Filter (Sales > $500)
echo "Date,Region,Product,Sales,Quantity" > output/high_value_sales.csv
awk -F',' 'NR>1 && $4>500 {print $0}' sales_data.txt >> output/high_value_sales.csv

# C. Product Performance Metrics
# Counting transactions ($3) and summing totals
awk -F',' 'NR>1 {sales[$3]+=$4; qty[$3]+=$5; count[$3]++} END {
    print "Product,Total_Sales,Total_Quantity,Transaction_Count";
    for (product in sales) 
        print product "," sales[product] "," qty[product] "," count[product]
}' sales_data.txt > output/product_performance.csv

echo "✅ Analysis complete. CSV reports generated in /output."

# 5. Distribution (Local to S3)
echo "📤 Uploading processed insights to S3 Output prefix..."
aws s3 cp output/ s3://${BUCKET_NAME}/output/ --recursive

# 6. Validation & Cleanup
echo "🔍 Validating S3 deployment..."
aws s3 ls s3://${BUCKET_NAME}/output/

echo "✨ Pipeline execution finished successfully!"
