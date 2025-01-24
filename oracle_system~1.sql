alter session set statistics_level=all;
select * from employees where rownum <= 100;
select * from table(dbms_xplan.display_cursor(null,null,'allstats last'));

select * from employees
where emp_no >= 10100 and emp_no <= 10199
or emp_no >= 10300 and emp_no <= 10399;

select * from employees
where emp_no >= 10100 and emp_no <= 10199
union all
select * from employees
where emp_no >= 10300 and emp_no <= 10399;


select gender as gender, count(*)
from employees
group by gender;

create index idx_gender on employees(gender);

select * from employees
where last_name = 'Radwan' and gender = 'M';
--where gender = 'M' and last_name = 'Radwan';
--where gender||' ' || last_name = 'M Radwan';

create index idx_last_name on employees(last_name);

-- emp_record 테이블에 인덱스 추가
CREATE INDEX idx_gate ON emp_record (gate);
CREATE INDEX idx_locate ON emp_record (locate);
CREATE INDEX idx_access_time ON emp_record (access_time);

-- dept_emp 테이블에 인덱스 추가
CREATE INDEX idx_dept_no ON dept_emp (dept_no);

-- dept_manager 테이블에 인덱스 추가
CREATE INDEX idx_dept_no_man ON dept_manager (dept_no);

CREATE INDEX idx_gender_last_name ON employees (gender, last_name);
CREATE INDEX idx_hire_date ON employees (hire_date);



select first_name, last_name, emp_no
from employees
--where substr(emp_no, 1, 4) = 1030;
where emp_no >= 10300 and emp_no < 10310;

select e.emp_no, e.first_name, e.last_name, d.dept_no
from employees e, dept_manager d
where e.emp_no = d.emp_no;

select e.emp_no, e.first_name, e.last_name, d.dept_no
from dept_manager d, employees e
where e.emp_no = d.emp_no;

select count(e.emp_no) as cnt
from employees e,
(select distinct emp_no
from salaries
where salary > 50000
) s
where e.emp_no = s.emp_no;

select count(distinct e.emp_no) as cnt
from employees e,
(select emp_no
from salaries
where salary > 50000
) s
where e.emp_no = s.emp_no;

select count(e.emp_no) as cnt
from employees e
where exists (select 1
from salaries s
where s.emp_no = e.emp_no
and s.salary > 50000);


select count(distinct e.emp_no) as cnt
from salaries s, employees e
where salary > 50000 and e.emp_no = s.emp_no;

select count(distinct e.emp_no) from employees e, salaries s
where s.salary > 50000 and e.emp_no = s.emp_no;



select * from table(dbms_xplan.display_cursor(null,null,'ALLSTATS LAST'));


