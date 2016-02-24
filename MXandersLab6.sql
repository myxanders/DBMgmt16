-- Mitchell Xanders Lab 6
-- Query 1 ~ Output: Names, Cities ~ customers who live in any city that makes the most differnet kinds of products ~ return values from either city
SELECT customers.name, customers.city -- displays the customer name and customer city
FROM customers -- from the customers table
WHERE customers.city in (SELECT products.city -- locates the cities in customers table that are also cities in the products table
			 FROM products
			 GROUP BY city 
			 ORDER BY COUNT(name) DESC -- puts the cities in order by number of different products made, from most products to fewest
			 LIMIT 1 -- only displays the city with the most products made
			 );

-- Query 2 ~ Output: Names ~ products whose priceUSD is strictly above the average priceUSD, in reverse-alphabetical order
SELECT products.name -- displays only the products' names
FROM products -- from the product table
WHERE products.priceUSD > (SELECT AVG(priceUSD) -- finds the average price of a product and looks for products whose price is greater than the average price
			  FROM products
			  )
ORDER BY products.name DESC; -- displays qualifying products in reverse-alphabetical order

--Query 3 ~ Output: Name, PID, totalUSD ~ customer name, pid ordered, and total for all orders, sorted from high to low
SELECT customers.name, orders.pid, orders.totalUSD -- display customer name, pid, and totalUSD
FROM customers RIGHT OUTER JOIN orders ON customers.cid = orders.cid -- creates a join between the customers table and the orders table. The right outer join removes the customer who did not place an order from the final table
ORDER BY orders.totalusd DESC; -- sorts the data by totalUSD from high to low

--Query 4 ~ Output: Names, totalUSD ~ customer names (in alphabetical order) and total for all orders
SELECT customers.name, SUM (totalUSD)
FROM customers LEFT OUTER JOIN orders ON customers.cid = orders.cid
	AND totalUSD IN (SELECT COALESCE (totalUSD, 0.00)
				FROM customers LEFT OUTER JOIN orders on customers.cid = orders.cid
				)
GROUP BY customers.name
ORDER BY customers.name ASC;

--Query 5 ~ Output: Names ~ customers who bought products from agents based in Tokyo, what products they ordered, and who sold it to them
SELECT customers.name, products.name, agents.name --displays names of customers, products, and agents
FROM customers, products, agents, orders -- pulls data from customers, products, agents, and orders tables
WHERE orders.cid = customers.cid -- connects orders table with customers table at cid
  AND orders.pid = products.pid -- connects orders table with products table at pid
  AND orders.aid = agents.aid -- connects orders table with agents table at aid
  AND orders.aid IN (SELECT aid -- matches aid in orders table with those in agents table
		     FROM agents
		     WHERE agents.city = 'Tokyo' -- only displays instances in which the aid matches the one(s) from Tokyo
		     );

--Query 6 ~ Output: All rows in orders table where orders.totalUSD is incorrect. Check the accuracy of totalUSD column in orders talbe.
-- orders.totalUSD = (orders.qty * products.priceUSD) - (customers.discount/100 * (orders.qty * products.priceUSD)
SELECT orders.* -- displays all columns from the orders table
FROM orders, products, customers -- collecting data from orders, products, and customers tables. This is necessary for our formula.
WHERE orders.pid = products.pid -- connects orders and products table at pid
  AND orders.cid = customers.cid -- connects orders and customers table at cid
  AND ROUND((orders.qty * products.priceUSD) - (customers.discount/100 * (orders.qty * products.priceUSD)), 2) != orders.totalUSD; -- This formula mulitplies the price of the product of each product by the quantity ordered. Then it multiplies each customer's discount by the cost of the order, and subtracts that amount from the total cost to get the actual price of the order. The != operator checks to see whether this number matches the value in the totalUSD column, and displays the rows in which it does not match.

--Query 7 ~ Difference between LEFT OUTER JOIN and RIGHT OUTER JOIN
SELECT customers.name, orders.ordnum
FROM customers LEFT OUTER JOIN orders ON customers.cid = orders.cid;
-- The LEFT OUTER JOIN takes every value from the first table, customers, and displays every corresponding value from the second table, orders, even when null. Note the null value in row 15 of this join where ordnum is null. This is because Weyland is a customer that did not place any order. A customer is not required to place an order, and so because this is a LEFT OUTER JOIN, Weyland can be seen on the join.
SELECT customers.name, orders.ordnum
FROM customers RIGHT OUTER JOIN orders ON customers.cid = orders.cid;
-- The RIGHT OUTER JOIN takes every value form the second table, orders, and displays every corresponding value from the first table, customers, even when null. Note how there are no null values in this table, because every order number had a customer behind the order. Because every order that can be displayed has an order number, and customer Weyland did not place an order, there is no order number that corresponds with Weyland, and Weyland is no longer seen on this join.