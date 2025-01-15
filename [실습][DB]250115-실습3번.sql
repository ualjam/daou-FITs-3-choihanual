select name, email from customers where phone like '555-1000%';

select account_id, balance from accounts where account_type = 'SAVINGS' and balance >= 10000;

select transaction_id, amount from transactions where transaction_type = 'DEPOSIT' and amount >= 1000;

select loan_id, amount from loans where amount >= 50000 and status = 'PENDING'
