select b.name, sum(l.amount), round((select avg(amount)from loans where status = 'APPROVED'),2)
from loans l
left outer join branches b
on b.branch_id = l.branch_id
where l.status = 'APPROVED'
group by b.name
having sum(l.amount) < (select avg(amount) from loans where status = 'APPROVED');


select e1.employee_id, e1.name, nvl(e2.name, 'NO MANAGER'), nvl((select department_name from departments where department_id = e2.department_id), 'NO DEPARTMENT') 
from employees e1
left outer join employees e2
on e1.manager_id = e2.employee_id;


select e.employee_id, e.name, e.salary, round(e.salary/sum(salary) over() * 100, 2) as 백분율
from employees e
where e.salary is not null
order by 백분율;


--select account_id, rank() over(partition by account_id order by )
select t1.account_id, t1.max_amount from
(
select distinct t.account_id, dense_rank() over(order by max_amount desc) as rank, t.max_amount from
(
select distinct account_id, max(amount) over (partition by account_id) as max_amount from transactions
) t
) t1
where t1.rank <=5 ;


select distinct department_id, max(salary) over(partition by department_id) - min(salary) over(partition by department_id) 
from employees
where department_id is not null
order by department_id;



select employee_id, name, salary, round(avg(salary) over(partition by department_id), 0), round(salary - avg(salary) over(partition by department_id),0) 
from employees
where salary is not null;


select ltrim(sys_connect_by_path(name, '>'), '>') as path from employees
where level = 5
start with name = 'Employee 241'
connect by employee_id = prior manager_id;

--select employee_id, name, row_number() over(order by salary desc) from employees

select * from
(
select employee_id, salary from employees
where salary is not null
order by salary desc, name
)
where rownum <= 10;



select nvl(to_char(hire_date, 'YYYY'), 'ALL YEARS'), sum(salary) 
from employees
group by rollup(to_char(hire_date, 'YYYY'));



select d.department_name, e.job_id, sum(salary)
from employees e
left outer join departments d
on e.department_id = d.department_id
where e.department_id is not null
group by grouping sets(department_name, job_id, ())
order by department_name, job_id;



select department_id, sum(salary)
from employees
group by department_id;

select distinct department_id, name, salary, sum(salary) over(partition by department_id order by salary range between 100 preceding and 100 following) 
from employees ;

select t.employee_id, t.salary, 
case
when salary >= avg_salary then '직무 평균 이상'
else '직무 평균 이하' end,
case
when salary >= total_salary then '전체 평균 이상'
else '전체 평균 이하' end from
(
select employee_id, salary, avg(salary) over(partition by job_id) as avg_salary, avg(salary) over() as total_salary 
from employees
where salary is not null
) t
