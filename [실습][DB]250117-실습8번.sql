select e.name, nvl(h.job_id, 'No Change') from employees e
left outer join job_history h
on e.employee_id = h.employee_id;


select nvl(e.salary, 0), d.department_name from employees e
left outer join departments d
on d.department_id = e.department_id
where e.name like '%Employee 1%'
order by d.department_name;

select a.account_id, t.amount, to_char(t.transaction_date, 'YYYY-MM-DD HH:MM:SS'), c.customer_id, c.name from transactions t
left outer join accounts a
on t.account_id = a.account_id
left outer join customers c
on c.customer_id = a.customer_id
where t.transaction_date >= add_months(sysdate, -6);

select e.job_id, count(*) from employees e
left outer join departments d
on e.department_id = d.department_id
where d.department_name in ('Department 3', 'Department 4', 'Department 5', 'Department 6')
group by e.job_id;


select account_type, trunc(avg(balance),2) from accounts
group by account_type
order by avg(balance) desc;

select a.account_id, count(t.account_id) from accounts a
left outer join transactions t
on a.account_id = t.account_id
group by a.account_id
order by count(t.account_id);

select * from (
select c.customer_id, nvl(sum(t.amount), 0) from customers c
left outer join accounts a
on a.customer_id = c.customer_id
left outer join transactions t
on a.account_id = t.account_id
where transaction_date >= '20240101' and transaction_date <= '20251231'
group by c.customer_id
order by nvl(sum(t.amount), 0) desc
)
where rownum <= 10;


select e.name, d.department_name from employees e
left outer join departments d
on e.department_id = d.department_id
where salary is null;

select * from
(
select c.customer_id, nvl(max(l.amount), 0) from customers c
left outer join loans l
on l.customer_id = c.customer_id
group by c.customer_id
order by nvl(max(l.amount), 0) desc
)
where rownum <= 15;

select d.department_id, count(e.employee_id) from departments d
left outer join employees e
on e.department_id = d.department_id
where e.salary <= 15000 and e.salary >=7000
group by d.department_id
having count(e.employee_id) >= 5
order by count(e.employee_id) desc;