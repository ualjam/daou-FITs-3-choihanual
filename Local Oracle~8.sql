select department_id, sum(salary) from employees
where department_id is not null
group by rollup(department_id)
order by department_id;

select hire_date, count(*) as cnt from employees
group by rollup(hire_date)
having count(*) >= 2
order by hire_date;

select 
case when branches.name is null then 'All Branch' else branches.name end, 
sum(loans.amount) 
from loans
left join branches
on loans.branch_id = branches.branch_id
group by rollup(branches.name)
order by branches.name;

