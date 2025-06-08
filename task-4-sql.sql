-- 1. Create the 'office' database
CREATE DATABASE office;

-- 2. List all customers with their country
SELECT customerName, country FROM customers;

-- 3. Find customers with a credit limit greater than 100,000
SELECT customerName, creditLimit FROM customers
WHERE creditLimit > 100000;

-- 4. List customers ordered by their credit limit (ascending)
SELECT customerName, creditLimit FROM customers
ORDER BY creditLimit;

-- 5. Count number of customers in each country
SELECT country, COUNT(*) AS customer_count
FROM customers
GROUP BY country;

-- 6. Display order number, order date, and customer name using INNER JOIN
SELECT ord.orderNumber, ord.orderDate, cust.customerName
FROM orders ord
JOIN customers cust ON ord.customerNumber = cust.customerNumber;

-- 7. Display all customers along with their sales representative (LEFT JOIN)
SELECT cust.customerName, emp.firstName
FROM customers cust
LEFT JOIN employees emp ON cust.salesRepEmployeeNumber = emp.employeeNumber;

-- 8. Find customers whose credit limit is above the average credit limit
SELECT customerName, creditLimit
FROM customers
WHERE creditLimit > (
    SELECT AVG(creditLimit) FROM customers
);

-- 9. Calculate total revenue (spending) for each customer
SELECT c.customerName, 
       ROUND(SUM(od.quantityOrdered * od.priceEach), 2) AS total_spent
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY c.customerName;

-- 10. Create a view of high-value customers (credit limit > 100,000)
CREATE VIEW high_value_customers AS
SELECT customerName, country, creditLimit
FROM customers
WHERE creditLimit > 100000;

-- 11. Display all records from the high_value_customers view
SELECT * FROM high_value_customers;
