
-- analytical_queries.sql

-- Total spending by user
SELECT user_id, SUM(amount) AS total_spent
FROM expenses
GROUP BY user_id;

-- Spending by category
SELECT c.category_name, SUM(e.amount) AS category_total
FROM expenses e
JOIN categories c ON e.category_id = c.category_id
GROUP BY c.category_name;

-- Monthly spending trend
SELECT DATE_FORMAT(expense_date, '%Y-%m') AS month, SUM(amount) AS total
FROM expenses
GROUP BY month
ORDER BY month;

-- Highest spending category
SELECT c.category_name, SUM(e.amount) AS total
FROM expenses e
JOIN categories c ON e.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total DESC
LIMIT 1;
