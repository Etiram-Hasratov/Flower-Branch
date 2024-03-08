-- Customers table creating --
create table customers (
    customer_id NUMBER
        GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name  VARCHAR2(255) NOT NULL,
    last_name   varchar2( 255 ) NOT NULL ,
    ADDRESS VARCHAR2 ( 255 ) , 
    PHONE VARCHAR2 ( 255 ));

--Insert
--Customers
insert into customers (first_name,last_name,address, phone) 
values ('Stephen','Stiles','1297 Via Cola di Rie','650.121.2034');
insert into customers (first_name,last_name,address, phone)
values ('Valli','Pataballa','93091 Calle della Testa','590.423.4560');
insert into customers (first_name,last_name,address, phone)
values ('Diana','Lorentz','2017 Shinjuku-ku','590.423.5567');
insert into customers (first_name,last_name,address, phone)
values ('David','Austin','9450 Kamiya-cho','590.423.4569');
insert into customers (first_name,last_name,address, phone)
values ('Karen','Colmenares','2014 Jabberwocky Rd','515.127.4566');
    

--Branches table creating
--
create table Branches (
        branch_id number generated always as identity primary key,
        location varchar2(255) not null,
        phone varchar2(255));
--Insert       
--Branches
insert into branches(location, phone) values ('Australia/New Zealand Foliages','011.44.1644.429266');
insert into branches(location, phone) values ('B.C Greens','011.44.1644.429264');
insert into branches(location, phone) values ('Branches and Flowering','011.44.1644.429262');
insert into branches(location, phone) values ('California Foliages','650.509.1876');
insert into branches (location, phone) values ('South African Greens','650.507.9878');



--Suppliers table creating  
create table suppliers (
        supplier_id number generated always as identity primary key,
        name varchar2(255) not null,
        address varchar2(255));
        
--Insert
--Suppliers

insert into suppliers (name, address) values ('Elizabet Bates','2011 Interiors Blvd');
insert into suppliers (name, address) values ('Ellen Abel','2007 Zagora St');
insert into suppliers (name, address) values ('Alyssa Hutton','2004 Charade Rd');
insert into suppliers (name, address) values ('Jonathon	Taylor','147 Spadina Ave');
insert into suppliers (name, address) values ('Kimberely Grant','6092 Boxwood St'); 



--Flowers table creating   -- 
create table  flowers (
        flower_id number generated always as identity primary key,
        name varchar2(255) not null,
        price number(10,2) not null check (price>0),
        supplier_id number not null,
        foreign key (supplier_id) REFERENCES suppliers(supplier_id));
 
--Insert       
--Flowers 

insert into flowers (name, price, supplier_id) values ('Petunia',12.5,1);
insert into flowers (name, price, supplier_id) values ('Cosmos',30.99,2);
insert into flowers (name, price, supplier_id) values ('Daffodils',9.97,3);
insert into flowers (name, price, supplier_id) values ('Gentian Violet',99.97,1);
insert into flowers (name, price, supplier_id) values ('Gladiolus',81.97,4);
insert into flowers (name, price, supplier_id) values ('Lavender',85.99,5);
insert into flowers (name, price, supplier_id) values ('Orchid',25.67,2);
insert into flowers (name, price, supplier_id) values ('Speedwell',65.99,3);
insert into flowers (name, price, supplier_id) values ('Sweet William',43.20,5);
insert into flowers (name, price, supplier_id) values ('Angelica',72.4,4);

        
--Orders table creating
create table orderss (
        order_id number generated always as identity primary key,
        customer_id number,
        branch_id number,
        order_date date not null,
        foreign key (customer_id) REFERENCES customers(customer_id),
        foreign key (branch_id) REFERENCES branches(branch_id));

--Insert
--orders

insert into orderss (customer_id, branch_id,order_date) values (1, 2, to_date('12-05-2023','DD-MM-YYYY'));
insert into orderss (customer_id, branch_id,order_date) values (2, 2, to_date('20-07-2023','DD-MM-YYYY'));
insert into orderss (customer_id, branch_id,order_date) values (1, 3, to_date('22-07-2022','DD-MM-YYYY'));
insert into orderss (customer_id, branch_id,order_date) values (3, 4, to_date('01-10-2023','DD-MM-YYYY'));
insert into orderss (customer_id, branch_id,order_date) values (2, 5, to_date('15-03-2023','DD-MM-YYYY'));
insert into orderss (customer_id, branch_id,order_date) values (5, 2, to_date('28-02-2023','DD-MM-YYYY'));
insert into orderss (customer_id, branch_id,order_date) values (2, 1, to_date('09-09-2022','DD-MM-YYYY'));
insert into orderss (customer_id, branch_id,order_date) values (4, 5, to_date('02-04-2023','DD-MM-YYYY'));
insert into orderss (customer_id, branch_id,order_date) values (3, 1, to_date('30-08-2023','DD-MM-YYYY'));
insert into orderss (customer_id, branch_id,order_date) values (2, 3, to_date('25-12-2023','DD-MM-YYYY'));
insert into orderss (customer_id, branch_id,order_date) values (1, 4, to_date('11-11-2023','DD-MM-YYYY'));


        

-- OrderDetails table creating

create table order_details (
        order_id number,
        flower_id number,
        quantity number not null check (quantity>0),
        foreign key (order_id) REFERENCES orderss(order_id),
        foreign key (flower_id) REFERENCES flowers(flower_id));

--INSERT
--OrderDetails
insert into order_details(order_id, flower_id, quantity) values (10,2,5);
insert into order_details(order_id, flower_id, quantity) values (5,4,2);
insert into order_details(order_id, flower_id, quantity) values (8,1,4);
insert into order_details(order_id, flower_id, quantity) values (11,5,4);
insert into order_details(order_id, flower_id, quantity) values (4,3,10);
insert into order_details(order_id, flower_id, quantity) values (3,7,5);
insert into order_details(order_id, flower_id, quantity) values (1,6,1);
insert into order_details(order_id, flower_id, quantity) values (7,9,5);
insert into order_details(order_id, flower_id, quantity) values (9,10,6);
insert into order_details(order_id, flower_id, quantity) values (2,8,3);
insert into order_details(order_id, flower_id, quantity) values (6,4,2);

