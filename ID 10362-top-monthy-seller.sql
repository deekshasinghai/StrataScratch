--You are provided with a transactional dataset from Amazon that contains detailed information about sales across different products and marketplaces. 
--Your task is to list the top 3 sellers in each product category for January.
--The output should contain 'seller_id' , 'total_sales' ,'product_category' , 'market_place', and 'month'.

Query:
with temp as (select * ,substr(month, 6,7) as mnth 
from sales_data)
select seller_id, total_sales, product_category, market_place,
dense_rank() over(partition by product_category order by total_sales desc) as top_seller
from temp
where mnth= '01'
limit 3
