--Getting Some insights from the Data

--Alter procedure Sales_data and chaging currency from  INR to USD  

Alter procedure Sales_Data
as
update transactions set currency='USD' where currency = 'INR\r';

--Running procedure again
Exec Sales_Data;

--Checking Table again
Select * from transactions;

--Checking How much Customers are in Business
select count(*) as Total_Customers from customers

--Checking transactions for California market
--Checking code for California market from markets table
select * from markets
 
 --Market code for California is 'Mark001'
SELECT * FROM transactions where market_code='Mark001'

--Checking distinct product codes that were sold in California
SELECT distinct product_code FROM transactions where market_code='Mark001'

--Checking transactions where currency is in US dollars
SELECT * from transactions where [currency]='USD'

--Checking transactions in year 2020 through creating a inner join by date table
select transactions.*,date.* from transactions inner join date on transactions.order_date = date.date where date.year = 2020

--Checking Total Revenue of California in year 2020
select sum(transactions.sales_amount) as total_2020_california_revenue from transactions inner join date on transactions.order_date = date.date where date.year = 2020 and transactions.market_code='Mark001'

--Checking Total Revenue in year 2020
select sum(transactions.sales_amount) as total_2020_revenue from transactions inner join date on transactions.order_date = date.date where date.year = 2020 and transactions.currency = 'USD' or transactions.currency = 'INR\r'

--Checking Total Revenue in year 2020 of January Month only
select sum(transactions.sales_amount) as total_2020_january_revenue from transactions inner join date on transactions.order_date = date.date where date.year = 2020 and date.month_name = 'January'and transactions.currency = 'USD' 
