
select customer_id from customers
minus
select customer_id from loans;

select account_id from transactions
intersect
select account_id from accounts;

select branch_id from branches
minus
select branch_id from loans;