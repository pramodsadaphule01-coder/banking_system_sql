1.Retrieve all customer name who have a balance greater than 50,000.
 select * from accounts where current_balance > 50000;
+----------------+---------------+-----------------+--------------+
| account_number | customer_name | current_balance | account_type |
+----------------+---------------+-----------------+--------------+
|           1001 | rohit sharma  |        52000.00 | saving       |
|           1002 | virat kohli   |        54000.00 | current      |
|           1003 | shubman gill  |        77000.00 | saving       |
|           1005 | kl rahul      |        70000.00 | saving       |
|           1006 | shreyash iyer |        72000.00 | current      |
|           1007 | ms dhoni      |        74000.00 | saving       |
|           1011 | kapil dev     |        60000.00 | saving       |
+----------------+---------------+-----------------+--------------+
2. display account number, customer name ,and account type of all customers having SAVING accounts.
 select * from accounts where account_type = 'SAVING';
+----------------+---------------+-----------------+--------------+
| account_number | customer_name | current_balance | account_type |
+----------------+---------------+-----------------+--------------+
|           1001 | rohit sharma  |        52000.00 | saving       |
|           1003 | shubman gill  |        77000.00 | saving       |
|           1005 | kl rahul      |        70000.00 | saving       |
|           1007 | ms dhoni      |        74000.00 | saving       |
|           1009 | harsh rane    |        46000.00 | saving       |
|           1011 | kapil dev     |        60000.00 | saving       |
+----------------+---------------+-----------------+--------------+
3. List all transactions made in the current month.
  select * from transactions where month(date_time)=month(curdate());
+----------------+------------+---------+---------------------+
| account_number | trans_type | amount  | date_time           |
+----------------+------------+---------+---------------------+
|           1001 | deposit    | 5000.00 | 2025-11-08 17:35:08 |
|           1002 | withdraw   | 2000.00 | 2025-11-08 17:35:08 |
|           1003 | deposit    | 9000.00 | 2025-11-08 17:35:08 |
|           1004 | withdraw   | 8000.00 | 2025-11-08 17:35:08 |
|           1005 | deposit    | 6500.00 | 2025-11-08 17:35:08 |
|           1006 | withdraw   | 5000.00 | 2025-11-08 17:35:08 |
|           1007 | deposit    | 2000.00 | 2025-11-08 17:35:08 |
|           1008 | withdraw   | 3000.00 | 2025-11-08 17:35:08 |
|           1009 | deposit    | 4000.00 | 2025-11-08 17:35:08 |
|           1010 | withdraw   | 1000.00 | 2025-11-08 17:35:08 |
|           1011 | deposit    | 3500.00 | 2025-11-08 17:35:08 |
+----------------+------------+---------+---------------------+
4.show customer who have not made any transaction yet.
 select * from accounts where account_number not in (select distinct account_number from transactions);
Empty set (0.01 sec)

5.display the top 3 customer with the highest  account balance.
 select * from accounts order by current_balance desc limit 3;
+----------------+---------------+-----------------+--------------+
| account_number | customer_name | current_balance | account_type |
+----------------+---------------+-----------------+--------------+
|           1003 | shubman gill  |        77000.00 | saving       |
|           1007 | ms dhoni      |        74000.00 | saving       |
|           1006 | shreyash iyer |        72000.00 | current      |
+----------------+---------------+-----------------+--------------+
6.Retrive all transactions where the amount is greater than 5,000.
 select * from transactions where amount > 5000;
+----------------+------------+---------+---------------------+
| account_number | trans_type | amount  | date_time           |
+----------------+------------+---------+---------------------+
|           1003 | deposit    | 9000.00 | 2025-11-08 17:35:08 |
|           1004 | withdraw   | 8000.00 | 2025-11-08 17:35:08 |
|           1005 | deposit    | 6500.00 | 2025-11-08 17:35:08 |
+----------------+------------+---------+---------------------+

7.show the total balance of all accounts combined.
 select sum(current_balance) from accounts;
+----------------------+
| sum(current_balance) |
+----------------------+
|            625000.00 |
+----------------------+
8. List customers along with their total deposited amount.
 select a.customer_name,t.amount from accounts a left join transactions t on a.account_number=t.account_number where trans_type ='deposit';
+---------------+---------+
| customer_name | amount  |
+---------------+---------+
| rohit sharma  | 5000.00 |
| shubman gill  | 9000.00 |
| kl rahul      | 6500.00 |
| ms dhoni      | 2000.00 |
| harsh rane    | 4000.00 |
| kapil dev     | 3500.00 |
+---------------+---------+
9. find customers who made a withdral of more than 5,000.
 select a.customer_name,t.trans_type,t.amount from accounts a left join transactions t on a.account_number=t.accou
nt_number where trans_type= 'withdraw' and t.amount > 5000;
+---------------+------------+---------+
| customer_name | trans_type | amount  |
+---------------+------------+---------+
| hardik pandya | withdraw   | 8000.00 |
+---------------+------------+---------+
10. display the most recent transaction date for each account.
 select account_number,max(date_time)as most_recent_transaction from transactions group by account_number
    -> ;
+----------------+-------------------------+
| account_number | most_recent_transaction |
+----------------+-------------------------+
|           1001 | 2025-11-08 17:35:08     |
|           1002 | 2025-11-08 17:35:08     |
|           1003 | 2025-11-08 17:35:08     |
|           1004 | 2025-11-08 17:35:08     |
|           1005 | 2025-11-08 17:35:08     |
|           1006 | 2025-11-08 17:35:08     |
|           1007 | 2025-11-08 17:35:08     |
|           1008 | 2025-11-08 17:35:08     |
|           1009 | 2025-11-08 17:35:08     |
|           1010 | 2025-11-08 17:35:08     |
|           1011 | 2025-11-08 17:35:08     |
+----------------+-------------------------+
11. retrive the number of transactions each customer has made.
 select a.customer_name, count(t.trans_type) from accounts a left join transactions t on a.account_number=t.accoun
t_number group by a.account_number,a.customer_name;
+---------------+---------------------+
| customer_name | count(t.trans_type) |
+---------------+---------------------+
| rohit sharma  |                   1 |
| virat kohli   |                   1 |
| shubman gill  |                   1 |
| hardik pandya |                   1 |
| kl rahul      |                   1 |
| shreyash iyer |                   1 |
| ms dhoni      |                   1 |
| akash gupta   |                   1 |
| harsh rane    |                   1 |
| ravi shastri  |                   1 |
| kapil dev     |                   1 |
+---------------+---------------------+
12.List customer who have both SAVINGS and CURRENT accounts(if allowed).
 select * from accounts where account_type='SAVING'and account_type='current';
Empty set (0.00 sec)

13.find all accounts created by customer whose name start with 'p'.
 select * from accounts where customer_name like'p%';
Empty set (0.00 sec)

14.Retrive customers sorted by their account balance in decending order.
 select * from accounts order by current_balance desc;
+----------------+---------------+-----------------+--------------+
| account_number | customer_name | current_balance | account_type |
+----------------+---------------+-----------------+--------------+
|           1003 | shubman gill  |        77000.00 | saving       |
|           1007 | ms dhoni      |        74000.00 | saving       |
|           1006 | shreyash iyer |        72000.00 | current      |
|           1005 | kl rahul      |        70000.00 | saving       |
|           1011 | kapil dev     |        60000.00 | saving       |
|           1002 | virat kohli   |        54000.00 | current      |
|           1001 | rohit sharma  |        52000.00 | saving       |
|           1008 | akash gupta   |        50000.00 | current      |
|           1009 | harsh rane    |        46000.00 | saving       |
|           1004 | hardik pandya |        40000.00 | current      |
|           1010 | ravi shastri  |        30000.00 | current      |
+----------------+---------------+-----------------+--------------+
15.Display the average account balance per account type.

