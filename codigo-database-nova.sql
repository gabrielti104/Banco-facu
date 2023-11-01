select * from customers;
select * from orders;
select * from order_details;
select * from products where product_name like '%chai%';
select * from products where product_name like '%a';
select * from products where product_name like '%t_a';
select * from products where product_name like '%ra%';
select * from products where product_name like '%a^';

select * from products
order by list_price asc;

select * from products
order by list_price desc;

select id, product_name, (standard_cost * target_level) as 'TotalPorItemCusto', 
(list_price * target_level) as 'TotalPorItemVenda',
((list_price * target_level) - (standard_cost * target_level)) as 'Ganho'
from products order by TotalPorItemCusto asc;

select max(list_price) from products;

select max(list_price), min(list_price) from products;

select max(list_price) , main(list_price) , sum(list_price) , avg(list_price) , count(id)
from products;

select count(*) from customers;
select count(*) from products;

select customer_id as 'Codigo Cliente' , count(*) as 'qtd_Pedidos' from orders 
group by customer_id;

select supplier_ids, count(*) as qtd_produtos 
from products
group by supplier_ids;

select id, product_name, list_price from products
where list_price = (Select max(list_price) from products);

select customers.id, customers.first_name, customers.email_address, orders.id, orders.order_date,orders.status_id 
from customers inner join orders on customers.id = orders.customer_id;


select customers.id, customers.first_name, customers.email_address, orders.id, orders.order_date, orders.status_id, 
order_details.quantity, order_details.unit_price, products.product_code, products.product_name, products.target_level
from customers inner join orders on customers.id = orders.customer_id 
inner join order_details on orders.id = order_details.order_id
inner join products on products.id = order_details.product_id;


select customers.id as 'idCliente', customers.first_name as 'Nome', orders.id as 'idPedido', orders.order_date as 'DataPedido', sum( order_details.unit_price * order_details.quantity) as 'TotalPedido'
from customers inner join orders on customers.id = orders.customer_id
inner join order_details on orders.id = order_details.order_id
group by customers.id, customers.last_name, orders.id, orders.order_date;