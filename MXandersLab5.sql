--Mitchell Xanders Lab 5

-- Query 1 ~ Output: Cities ~ agents booking an order for a customer whose id is 'c002' ~ Joins
SELECT city
FROM agents, orders
WHERE agents.aid = orders.aid
	AND orders.cid = 'c002';

-- Query 2 ~ Output: IDs ~ products ordered through any agent who makes at least on order for a customer in Dallas, sorted by pid from highest to lowest. ~Joins
--SELECT DISTINCT orders.pid
--FROM customers, orders
--WHERE customers.city = 'Dallas'
--	AND customers.cid = orders.cid
--ORDER BY pid DESC;
--^^^WRONG
SELECT DISTINCT o2.aid
FROM customers, orders o1, orders o2
WHERE customers.cid = o1.cid
  AND o1.aid = o2.aid
  AND customers.city = 'Dallas'
ORDER BY o2.pid DESC;
-- Query 3 ~ Output: Names ~ customers who have never placed an order ~ Subquery
SELECT customers.name
FROM customers
WHERE cid NOT IN (SELECT cid
		  FROM orders
		  );

-- Query 4 ~ Output: Names ~ customers who have never placed an order ~ Outer Join
SELECT customers.name
FROM customers FULL OUTER JOIN orders on customers.cid = orders.cid
WHERE orders.cid IS NULL;

-- Query 5 ~ Output: Names ~ customers who have palced at least one order through an agent in their city; those agents
SELECT DISTINCT customers.name, agents.name
FROM customers, agents, orders
WHERE customers.city = agents.city
	AND customers.cid = orders.cid
	AND agents.aid = orders.aid;

-- Query 6 ~ Output: Names, City ~ cusotmers, agents in same city regardless of whether or not the customer has ever placed an order with that agent
SELECT customers.name, agents.name, agents.city
FROM customers, agents
WHERE customers.city = agents.city;

-- Query 7 ~ Output: Names, City ~ customers who live in the city that makes the fewest different kinds of products
SELECT customers.name, customers.city
FROM customers
WHERE customers.city in (SELECT products.city
			 FROM products
			 GROUP BY city
			 ORDER BY COUNT(name)
			 LIMIT 1
			 );
