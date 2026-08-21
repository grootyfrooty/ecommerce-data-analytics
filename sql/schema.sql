CREATE TABLE list_of_orders (
Order_id Varchar(20) primary key not null,
Order_date date not null,
Customer_name text not null,
state text,
city text
);

CREATE TABLE order_details (
id serial primary key,
Order_id VARCHAR(20) REFERENCES list_of_orders(order_id),
Order_amount numeric not null,
Order_profit numeric not null,
Order_category text,
Order_quantity int,
Order_Subcategory text
);

CREATE TABLE sales_target(
id serial primary key,
Order_month text,
Order_category text,
Sales_target numeric
);

select * from sales_target;
select * from list_of_orders;
select * from order_details;
