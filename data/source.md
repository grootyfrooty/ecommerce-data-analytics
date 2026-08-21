## Data Source

**Dataset:** E-Commerce Data (Indian retail)
**Author:** Ben Roshan
**Platform:** Kaggle
**URL:** https://www.kaggle.com/datasets/benroshan/ecommerce-data
**License:** Check Kaggle dataset page for license/usage terms
**Downloaded on:** [add today's date]

**Files:**
- `List of Orders.csv` — one row per order (Order ID, Order Date, Customer Name, State, City)
- `Order Details.csv` — one row per line item within an order (Order ID, Amount, Profit, Quantity, Category, Sub-Category)
- `Sales target.csv` — monthly sales targets by category (Month of Order Date, Category, Target)

**Note:** Order ID is unique in `List of Orders.csv` but repeats in `Order Details.csv` (verified via Python — see notebooks/01_data_exploration.ipynb), confirming a one-to-many relationship between orders and their line items.