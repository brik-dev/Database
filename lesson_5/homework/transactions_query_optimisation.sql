-- == Homework 5 == --
-- 1. Реализовать практические задания на примере других таблиц и запросов.
-- Screenshot uploaded

-- 2. Подумать, какие операции являются транзакционными, и написать несколько примеров с транзакционными запросами.
-- Оплата по карте, если нет достаточной суммы, чтобы покрыть расходы на покупку, то транзакция отменится.

-- 3. Проанализировать несколько запросов с помощью EXPLAIN.
-- Used the following query and empoved by addint INDEX to the tables salaries.to_date and department.to_date
EXPLAIN SELECT
	dp.dept_name,
	COUNT(de.emp_no) AS emp_number,
	SUM(s.salary) AS salary_amount
FROM departments AS dp
	JOIN dept_emp AS de ON de.dept_no = dp.dept_no AND de.to_date = '9999-01-01'
	JOIN salaries AS s ON de.emp_no = s.emp_no AND s.to_date = '9999-01-01'
GROUP BY dp.dept_name
;