select c.first_name, c.last_name, s.country
from supplier s
         inner join product p on s.id = p.supplier_id
         inner join order_item oi on p.id = oi.product_id
         inner join orders o on oi.order_id = o.id
         inner join customer c on o.customer_id = c.id
where s.country like 'Canada';

select c.first_name, c.last_name, c.country
from customer c;

select count(o.customer_id)
from orders o;

select max(oi.unit_price)
from order_item oi;

select max(o.total_amount)
from orders o;

select sum(o.total_amount)
from orders o;

select sum(o.total_amount)
from orders o
where order_date between '2014-01-01' and '2014-12-31';

select avg(o.total_amount)
from orders o;

select c.first_name, c.last_name, avg(o.total_amount)
from orders o
         inner join customer c on o.customer_id = c.id
group by c.first_name, c.last_name;

select c.first_name, c.last_name, c.country
from customer c
where c.country like 'Brazil'
   or c.country like 'Spain';

select o.order_date, o.total_amount
from orders o
where order_date between '2013-01-01' and '2014-12-31'
  and o.total_amount < 100;

select c.first_name, c.last_name, c.country
from customer c
where c.country like 'Spain'
   or c.country like 'Germany'
   or c.country like 'France'
order by c.country desc;

select distinct c.first_name, c.last_name, c.country, s.country
from customer c
         inner join supplier s on c.city = s.city
where s.country = c.country
order by s.country;

select c.first_name, c.last_name
from customer c
where c.first_name like 'Jo%';

select c.first_name, c.last_name
from customer c
where c.first_name like '___a';

select c.country, count(c.country)
from customer c
group by c.country;

select c.country, count(c.country)
from customer c
group by c.country
order by count(c.country) desc;

select c.first_name, c.last_name, sum(o.total_amount), count(o.total_amount)
from orders o
         inner join customer c on o.customer_id = c.id
group by c.first_name, c.last_name
order by sum(o.total_amount) desc;

select c.first_name, c.last_name, sum(o.total_amount), count(o.total_amount)
from orders o
         inner join customer c on o.customer_id = c.id
group by c.first_name, c.last_name
having count(o.total_amount) > 20;

select c.country, count(c.city)
from customer c
group by c.country
order by count(c.city) desc;

select (oi.id,
        p.supplier_id,
        c.first_name,
        c.last_name) as c,
       c.city,
       p.product_name,
       p.unit_price,
       s.contact_name
from order_item oi
         inner join product p on oi.product_id = p.id
         inner join orders o on oi.order_id = o.id
         inner join customer c on o.customer_id = c.id
         inner join supplier s on p.supplier_id = s.id
limit 1;

select * from product p
                  inner join supplier s on p.supplier_id = s.id
where s.id = 16;

select s.id,s.company_name, s.contact_name, s.contact_title
from supplier s
         left outer join product p on s.id = p.supplier_id;

select p.product_name, oi.order_id, oi.product_id
from product p
         inner join order_item oi on p.id = oi.product_id;

select p.id, p.product_name from orders o
                                     inner join order_item oi on o.id = oi.order_id
                                     inner join product p on oi.product_id = p.id;

select count(p.id) from orders o
                            inner join order_item oi on o.id = oi.order_id
                            right join product p on oi.product_id = p.id
where oi.product_id is null;
















