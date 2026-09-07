from sqlalchemy import create_engine
import pandas as pd
import os
from dotenv import load_dotenv

load_dotenv()

username = "postgres"
password = os.getenv("DB_PASSWORD")
host = "localhost"
port = "5432"
database = "ecommerce_dataana"

# Build the connection string
engine = create_engine(f"postgresql://{username}:{password}@{host}:{port}/{database}")

# Test the connection
try:
    with engine.connect() as conn:
        print("Connected successfully!")
except Exception as e:
    print("Connection failed:", e)

 # Load CSVs into pandas
orders_df = pd.read_csv("/Users/apple/Downloads/archive/List of Orders.csv")
details_df = pd.read_csv("/Users/apple/Downloads/archive/Order Details.csv")
target_df = pd.read_csv("/Users/apple/Downloads/archive/Sales target.csv")



details_df = details_df.rename(columns={
    "Order ID": "order_id",
    "Amount": "order_amount",
    "Quantity": "order_quantity",
    "Profit": "order_profit",
    "Category": "order_category",
    "Sub-Category": "order_subcategory"
})
details_df = details_df.dropna(how="all")


orders_df = orders_df.rename(columns={
    "Order ID": "order_id",
    "Order Date": "order_date",
    "CustomerName": "customer_name",
    "State": "state",
    "City": "city"
})

orders_df["order_date"] = pd.to_datetime(orders_df["order_date"], dayfirst=True)
orders_df = orders_df.dropna(how="all")


target_df = target_df.rename(columns={
    "Month of Order Date": "order_month",
    "Category": "order_category",
    "Target": "sales_target"
})

target_df = target_df.dropna(how="all")

# Push each dataframe into its matching Postgres table
orders_df.to_sql("list_of_orders", engine, if_exists="append", index=False)
details_df.to_sql("order_details", engine, if_exists="append", index=False)
target_df.to_sql("sales_target", engine, if_exists="append", index=False)

print("Data loaded successfully!")