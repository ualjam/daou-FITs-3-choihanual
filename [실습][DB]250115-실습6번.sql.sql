select count(*), sum(amount) from loans where status = 'APPROVED';
select count(*), sum(amount) from loans group by status having status= 'APPROVED';

select to_char(transaction_date, 'MONTH'), sum(amount) as total_amount from transactions group by to_char(transaction_date, 'MONTH') having sum(amount) > 10000;

select branch_id, avg(amount), sum(amount) from loans where status = 'APPROVED' group by branch_id order by branch_id;