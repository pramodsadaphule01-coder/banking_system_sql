CREATE DATABASE bank;
use bank;

CREATE TABLE accounts(
account_number INT PRIMARY KEY,
customer_name VARCHAR(50),
current_balance DECIMAL (10,2),
account_type VARCHAR(20)
);

 desc accounts;
+-----------------+---------------+------+-----+---------+-------+
| Field           | Type          | Null | Key | Default | Extra |
+-----------------+---------------+------+-----+---------+-------+
| account_number  | int           | NO   | PRI | NULL    |       |
| customer_name   | varchar(50)   | YES  |     | NULL    |       |
| current_balance | decimal(10,2) | YES  |     | NULL    |       |
| account_type    | varchar(20)   | YES  |     | NULL    |       |
+-----------------+---------------+------+-----+---------+-------+

INSERT INTO accounts VALUES
(1001,"rohit sharma",52000,'saving'),
(1002,"virat kohli",54000,'current'),
(1003,"shubhman gill",77000,'saving'),
(1004,"hardik pandya",'40000','current'),
(1005,"kl rahul",70000,'saving'),
(1006,"shreyash iyer",72000,'current'),
(1007,"ms dhoni",74000,'saving'),
(1008,"akash gupta",50000,'current'),
(1009,"harsh rane",46000,'saving'),
(1010,"ravi shastri",30000,'current'),
(1011,"kapil dev",60000,'saving');

 select * from accounts;
+----------------+---------------+-----------------+--------------+
| account_number | customer_name | current_balance | account_type |
+----------------+---------------+-----------------+--------------+
|           1001 | rohit sharma  |        52000.00 | saving       |
|           1002 | virat kohli   |        54000.00 | current      |
|           1003 | shubman gill  |        77000.00 | saving       |
|           1004 | hardik pandya |        40000.00 | current      |
|           1005 | kl rahul      |        70000.00 | saving       |
|           1006 | shreyash iyer |        72000.00 | current      |
|           1007 | ms dhoni      |        74000.00 | saving       |
|           1008 | akash gupta   |        50000.00 | current      |
|           1009 | harsh rane    |        46000.00 | saving       |
|           1010 | ravi shastri  |        30000.00 | current      |
|           1011 | kapil dev     |        60000.00 | saving       |
+----------------+---------------+-----------------+--------------+

CREATE TABLE transactions(
account_number INT,
trans_type ENUM('deposit','withdraw')NOT NULL,
amount DECIMAL (10,2) NOT NULL,
FOREIGN KEY(account_number)REFERENCES accounts(account_number));

 desc transactions;
+----------------+----------------------------+------+-----+---------+-------+
| Field          | Type                       | Null | Key | Default | Extra |
+----------------+----------------------------+------+-----+---------+-------+
| account_number | int                        | YES  | MUL | NULL    |       |
| trans_type     | enum('deposit','withdraw') | NO   |     | NULL    |       |
| amount         | decimal(10,2)              | NO   |     | NULL    |       |
| date_time      | datetime                   | YES  |     | NULL    |       |
+----------------+----------------------------+------+-----+---------+-------+

INSERT INTO transactions (account_number,trans_type,amount,date_time) values
(1001,'deposit',5000.00),
(1002,'withdraw',2000.00),
(1003,'deposit',9000.00),
(1004,'withdraw',8000.00),
(1005,'deposit',6500.00),
(1006,'withdraw',5000.00),
(1007,'deposit',2000.00),
(1008,'withdraw',3000.00),
(1009,'deposit',4000.00),
(1010,'withdraw',1000.00),
(1011,'deposit',3500.00);

  select * from transactions;
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

