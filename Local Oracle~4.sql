select account_id, sum(amount) over(partition by account_id order by transaction_date) from transactions;

select account_id, amount, amount/max(amount) over(partition by account_id) from transactions;

select branch_id, sum(amount) over(partition by branch_id order by loan_date) from loans;

select customer_id, round(avg(balance) over(partition by customer_id), 2) from accounts;