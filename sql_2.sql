# performing inner join
SELECT 
      Order_ID, Order_Date, Customer_Name, Region, Product_Category, Sales, Profit 
from Orders o
inner join Customers c
on o.Customer_ID = c.Customer_ID;

# 1. Total Sales by Region
select c.Region,
	   sum(o.Sales) as Total_Sales
from Orders o
join Customers c
on o.Customer_ID = c.Customer_ID
group by c.Region;

 # 2. Profit Margin by Category
 select Product_Category,
        sum(Profit)/sum(Sales) as Profit_Margin
from Orders
group by Product_Category;

 # 3. Monthly Sales Trend
 select 
       month(Order_Date) as Month, 
       sum(Sales) as Monthly_sales
 from Orders
 group by Month
 order by Month;
 
  # 4. Top 5 Customers by Revenue
  select c.Customer_Name,
         sum(o.Sales) as Total_Revenue
  from Orders o
  join Customers c
  on o.Customer_ID = c.Customer_ID
  group by c.Customer_Name
  order by Total_Revenue desc
  limit 5;
 