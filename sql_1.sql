select e.name,d.dept_name,d.location from sql_practice.employees e
left join sql_practice.departments d
on e.dept_id=d.dept_id;

select sum(e.salary) as total_salary,
	   count(e.emp_id) as no_of_emp,
       d.dept_name
       from sql_practice.employees e
join sql_practice.departments d
on e.dept_id=d.dept_id
group by d.dept_name
having no_of_emp>1;

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

select e.emp_id,e.name as employee_name ,m.name as manager_name
from employees e
join employees m
on m.emp_id=e.manager_id;

select e.name,datediff(curdate(),e.joining_date) as working_days 
from employees e
where e.joining_date>date_sub(curdate() , interval 5 year);

select sum(amount),monthname(order_date) as order_month from orders
where year(order_date) =2024
group by order_month;

select d.dept_name,count(e.emp_id) as no_of_emp
from employees e 
right join departments d 
on e.dept_id = d.dept_id
group by d.dept_name
having count(e.emp_id) = 0;

SELECT 
    e.name as emp_name,
    o.order_date,
    LAG(o.order_date) OVER (PARTITION BY e.emp_id ORDER BY o.order_date) AS previous_order,
    DATEDIFF(o.order_date, LAG(o.order_date) OVER (PARTITION BY e.emp_id ORDER BY o.order_date)) AS gap_days
FROM Employees e
JOIN Orders o ON e.emp_id = o.emp_id
WHERE e.emp_id = 1;

SELECT o.emp_id
FROM orders o
GROUP BY o.emp_id
HAVING 
    SUM(CASE WHEN o.status = 'cancelled' THEN 1 ELSE 0 END) > 0
    AND
    SUM(CASE WHEN o.status IN ('delivered', 'pending') THEN 1 ELSE 0 END) = 0;
    
select o.order_id,o.amount, 
       sum(o.amount) over (order by o.order_id) as total_amount
from orders o
where o.status !='cancelled'
    




