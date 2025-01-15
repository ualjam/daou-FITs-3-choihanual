select name, phone from customers where address = 'Address 100';

select account_id, balance from accounts where balance >= 50000;

select transaction_id, amount from transactions where amount < 0;

select amount, customer_id from loans where status = 'APPROVED';