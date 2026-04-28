-- Q1 — Basic JOIN
-- List all employees with their department name and location.
-- Also show employees who don't belong to any department.
-- Hint: Some dept_ids may not match — think about which JOIN to use.
select e.name,d.dept_name,d.location from sql_practice.employees e
left join sql_practice.departments d
on e.dept_id=d.dept_id;

-- Q2 — GROUP BY + Aggregate
-- Find the total salary spent per department and the number of employees in each.
-- Only show departments with more than 1 employee.
-- Hint: GROUP BY + HAVING
select sum(e.salary) as total_salary,
	   count(e.emp_id) as no_of_emp,
       d.dept_name
       from sql_practice.employees e
join sql_practice.departments d
on e.dept_id=d.dept_id
group by d.dept_name
having no_of_emp>1;

-- Q3 — MAX per Group (like Leetcode)
-- Find the highest paid employee in each department.
-- Show department name, employee name, salary.
-- Hint: You already know two ways to do this!
SELECT e.salary, d.dept_name
FROM sql_practice.employees e
JOIN sql_practice.departments d
ON d.dept_id = e.dept_id
JOIN (
    SELECT dept_id, MAX(salary) AS max_salary
    FROM sql_practice.employees
    GROUP BY dept_id
) t
ON e.dept_id = t.dept_id 
AND e.salary = t.max_salary;

-- Q4 — Self JOIN
-- Find all employees and their manager's name.
-- If they have no manager, show 'No Manager'.
-- Hint: Join Employees table with itself on manager_id = emp_id
select e.emp_id,e.name as employee_name ,m.name as manager_name
from employees e
join employees m
on m.emp_id=e.manager_id;

-- Q5 — Date Filter
-- Find all employees who joined in the last 5 years from today.
-- Show their name and how many days they have worked.
-- Hint: DATEDIFF + DATE_SUB
select e.name,datediff(curdate(),e.joining_date) as working_days 
from employees e
where e.joining_date>date_sub(curdate() , interval 5 year);

-- Q6 — Date GROUP BY
-- Find total order amount per month for the year 2024.
-- Show month name and total amount.
-- Hint: MONTH() + YEAR() + GROUP BY
select sum(amount),monthname(order_date) as order_month from orders
where year(order_date) =2024
group by order_month;

-- Q7 — LEFT JOIN to Find Missing
-- Find all departments that have NO employees assigned to them.
-- Hint: LEFT JOIN + check for NULL
select d.dept_name,count(e.emp_id) as no_of_emp
from employees e 
right join departments d 
on e.dept_id = d.dept_id
group by d.dept_name
having count(e.emp_id) = 0;

-- Q8 — Previous Row Comparison (Tricky)
-- For each order placed by employee 1 (Alice), find the gap in days
-- between that order and her previous order.
-- Hint: LAG() + DATEDIFF
SELECT 
    e.name as emp_name,
    o.order_date,
    LAG(o.order_date) OVER (PARTITION BY e.emp_id ORDER BY o.order_date) AS previous_order,
    DATEDIFF(o.order_date, LAG(o.order_date) OVER (PARTITION BY e.emp_id ORDER BY o.order_date)) AS gap_days
FROM Employees e
JOIN Orders o ON e.emp_id = o.emp_id
WHERE e.emp_id = 1;

-- Q9 — Multi Table JOIN + Filter
-- Find employees who have only placed cancelled orders — never delivered, never pending.
-- Show their name and department.
-- Hint: Think about what NOT IN or HAVING can do here
SELECT o.emp_id
FROM orders o
GROUP BY o.emp_id
HAVING 
    SUM(CASE WHEN o.status = 'cancelled' THEN 1 ELSE 0 END) > 0
    AND
    SUM(CASE WHEN o.status IN ('delivered', 'pending') THEN 1 ELSE 0 END) = 0;

-- Q10 — Hardest — Running Total
-- Show each order with a running total of amount ordered by date.
-- So each row shows how much has been spent cumulatively up to that order.
select o.order_id,o.amount, 
       sum(o.amount) over (order by o.order_id) as total_amount
from orders o
where o.status !='cancelled'
