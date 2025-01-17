
select b.name, c.customer_id, c.name, c.email, c.phone, c.address from branches b 
left outer join loans l
on b.branch_id = l.branch_id
left outer join customers c
on l.customer_id = c.customer_id;

select c.name, c.email from customers c
inner join accounts a
on c.customer_id = a.customer_id
where a.balance >= 50000;

select c.name, l.amount from customers c
join loans l
on c.customer_id = l.customer_id
where l.status = 'PENDING';