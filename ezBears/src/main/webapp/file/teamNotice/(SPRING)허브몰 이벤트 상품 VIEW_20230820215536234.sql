
Select * From products;
Select * From eventProduct;
select * from category;

Select * From cart;
Select * From orders;
Select * From orderDetails;


--이벤트 상품을 가져오려면? 
--> product 테이블과 조인해서 가져온다
--> join을해서 결과를 받아오려면 view를 만드는게 좋다

--join
select p.*, e.eventname,e.eventproductno
from products p join
eventProduct e
on p.productNo = e.productNo
where e.eventname='NEW';


--view
create or replace view eventproductview
as 
select p.*, e.eventname, e.eventproductno
from products p join
eventProduct e
on p.productNo = e.productNo;

select * from eventProductView;
--New view-select
select * from eventProductView
where eventname='NEW';

select * from eventProductView
where eventname='BEST';

select * from eventProductView
where eventname='MD';

