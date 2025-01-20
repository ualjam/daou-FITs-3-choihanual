select name from customers
where customer_id in (select l.customer_id from loans l
left outer join branches b
on l.branch_id = b.branch_id
where b.location = 'Location 1');

select transaction_id from transactions
where account_id in (select account_id from accounts where customer_id = 100);

select account_id from accounts
where balance = (select max(balance) from accounts);