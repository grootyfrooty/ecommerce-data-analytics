# E-Commerce Sales Analytics (Indian Retail)

## Overview
This project analyzes Indian e-commerce sales data to uncover trends in revenue, 
profit, and performance across product categories, regions, and time. 

The workflow starts with designing a normalized PostgreSQL database (3 linked 
tables: orders, order line-items, and monthly sales targets), loading raw CSV 
data into it via a Python ETL script, and will extend into SQL-based analysis 
and an interactive Power BI dashboard.
## Data Source
[**Dataset:** E-Commerce Data (Indian retail)
**Author:** Ben Roshan
**Platform:** Kaggle
**URL:** https://www.kaggle.com/datasets/benroshan/ecommerce-data
**License:** Check Kaggle dataset page for license/usage terms
**Downloaded on:** [add today's date]]

## Tech Stack
- PostgreSQL — relational database, schema design
- Python (pandas, sqlalchemy) — data loading & cleaning
- [Coming] SQL — analysis queries
- [Coming] Power BI — dashboard

## Schema
[images preview/erd.png here]
Three tables: list_of_orders (dimension), order_details (fact, FK to orders), sales_target (benchmark, joins via category)

## Process
1. Explored raw CSVs, identified relationships between tables
2. Designed a normalized PostgreSQL schema (see sql/schema.sql)
3. Built a Python ETL script (sql/load_data.py) to load and clean data
   - Handled: column name mismatches, case sensitivity in Postgres, date format parsing (DD-MM-YYYY), blank trailing rows
   
4. [Coming] SQL analysis
5. [Coming] Power BI dashboard

## Key Learnings
[The process which i explored is the sign of understanding data analysis fundamental steps such as designing schemas and loading data via (python ETL script) writing some (sql) analysis quires to move forward with dataset]