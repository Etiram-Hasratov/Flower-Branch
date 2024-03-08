select * from branches;
select * from customers;
select * from flowers;
select * from order_details;
select * from orderss;
select * from suppliers;

--- Hesabat 5.1

select count(*) from customers;

SELECT
    c.*,
    b.*
FROM
         branches b
    JOIN orderss   o ON b.branch_id = o.branch_id
    RIGHT JOIN customers c ON c.customer_id = o.customer_id;
    
    
--5.2
select c.first_name||' '||c.last_name , count(*) from orderss o left join customers c on o.customer_id=c.customer_id group by c.first_name||' '||c.last_name ;

select b.location,  count(*) from orderss o left join branches b on o.branch_id=b.branch_id group by b.location;

select o.order_date, sum(od.quantity),count(*) from orderss o join order_details od on o.order_id=od.order_id group by o.order_date;

--5.3
select f.name ,od.quantity from flowers f 
    join order_details od on f.flower_id=od.flower_id 
        where od.quantity in (select max(quantity) from order_details);
        

select f.name, s.name supplier_name, od.quantity from flowers f 
    join suppliers s on f.supplier_id=s.supplier_id 
        join order_details od on od.flower_id=f.flower_id;
        
--5.4
select f.name, s.name as supplier_name, sum(od.quantity) from flowers f 
    join suppliers s on f.supplier_id=s.supplier_id 
        join order_details od on od.flower_id=f.flower_id 
            group by f.name, s.name ;
            
   --5.5         
select b.location, count(o.branch_id) from branches b 
    join orderss o on b.branch_id=o.branch_id 
        group by b.location 
            having count(o.branch_id)=(select  max(count(branch_id)) from orderss group by branch_id);
