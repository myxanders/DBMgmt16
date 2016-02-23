--Mitchell Xanders 2/16/16 Lab 4

--Query 1
select city
from agents
where aid in (select aid
	      from orders
	      where cid = 'c002'
	      );

--Query 2
select pid
from orders
where aid in (select aid
	      from orders
	      where cid in (select cid
			    from customers
			    where city = 'Dallas'
			    )
	     )
order by pid DESC;

--Query 3
select cid, name
from customers
where cid not in (select cid
		  from orders
		  where aid = 'a01'
		 );

--Query 4
select cid, name
from customers
where cid in (select cid
	      from orders
	      where pid = 'p01' and cid in (select cid
					    from orders
					    where pid = 'p07'
					    )
	      ); 
	-- select distinct pid
	-- from orders
	-- where pid = 'p01'
	--  intersect
	-- select cid
	-- from orders
	-- where pid = 'p07'

--Query 5
-- v Original ~ Wrong
--select distinct pid 
--from orders
--where cid not in (select cid    <-- -_- are you kidding me....cid instead of pid? ugh
--		  from orders
--		  where aid = 'a07'
		  )
--order by pid DESC;
select pid
from products
where pid not in (select pid
		  from orders
		  where aid = 'a07'

order by pid DESC;

--Query 6
select name, discount, city
from customers
where cid in (select cid
	      from orders
	      where aid in (select aid
			    from agents
			    where city in ('London', 'New York')
			    )
	      );

--Query 7
-- v Original ~ Wrong
--select *
--from customers
--where cid not in (select cid
--		  from customers
--		  where city in ('Dallas', 'London')
--		  )
--and discount in (select discount
--		 from customers
--		 where city in ('Dallas', 'London')
--		 );

select *
from customers
where discount in (select discout
		   from customers
		   where city in ('Dallas', 'London')
--Question #8
-- Check constraints are put in place to maintain table integrity when we insert, delete or update data.
-- These constraints allow us to establish primary keys, default data types, and not null values, for example.
-- An example of a good check constraint is using the NOT NULL constraint involving information like a Student ID.
-- In a database storing student information, it is of good practice to give each student a unique ID number and set is as the primary key.
-- With the NOT NULL constraint on it, the Student ID value must not be left empty for any student in order to insert their information into the database.
-- Bad practice of the check constraint NOT NULL would be using it in a column for "Middle Name".
-- Not everybody has a middle name, so setting "Middle Name" to NOT NULL would prevent some students from having their information kept in the database.
-- Because every student must be issued a Student ID number, it makes sense that the Student ID Number must be included in their information in the datatbase.
-- However, because not every students has a middle name, it does not make sense to require the input of a middle name in order to include a studnet in the database.
-- 
