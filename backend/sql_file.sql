CREATE TABLE customers (
    customer_id            INT PRIMARY KEY,
    first_name             VARCHAR(50),
    last_name              VARCHAR(50),
    email                  VARCHAR(100),
    phone_number           VARCHAR(15),
    age                    INT,
    gender                 VARCHAR(10),
    location               VARCHAR(50),
    branch                 VARCHAR(50),
    account_number         BIGINT,
    account_type           VARCHAR(20),
    account_created_date   DATE,
    income                 NUMERIC(12, 2),
    account_balance        NUMERIC(12, 2),
    avg_monthly_balance    NUMERIC(12, 2),
    credit_score           NUMERIC,
    mobile_app             BOOLEAN
);
DROP TABLE customers;

SELECT * FROM customers;

select * from customers where phone_number is null;

CREATE TABLE transactions (
    transaction_id VARCHAR PRIMARY KEY NOT NULL,
    customer_id INT NOT NULL,
    amount INT,
    transaction_date DATE,  -- renamed and corrected datatype
    transaction_type VARCHAR(10),  -- 'Credit' or 'Debit'
    beneficiary VARCHAR(50),
    location VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

ALTER TABLE transactions
ALTER COLUMN amount TYPE numeric(12,2);

SELECT * FROM TRANSACTIONS;

select customer_id, sum(amount) as total_amount, count(customer_id) as total_transactions
from transactions group by customer_id;


SELECT 
  c.customer_id,
  c.first_name,
  c.last_name,
  SUM(t.amount) AS total_amount,
  COUNT(t.transaction_id) AS transaction_count
FROM 
  customers c
JOIN 
  transactions t ON c.customer_id = t.customer_id
GROUP BY 
  c.customer_id, c.first_name, c.last_name;



CREATE TABLE feedback (
    customer_id int,
    feedback_id INT CHECK (feedback_id BETWEEN 1000 AND 9999),
    feedback_type VARCHAR CHECK (feedback_type IN ('Suggestion', 'Praise', 'Complaint', 'Query')),
    feedback_rating INT,
    issue_category VARCHAR,
    resolved BOOLEAN,
    response_time_days INT,
    submitted_on DATE,
    feedback_text VARCHAR,
	PRIMARY KEY (customer_id, feedback_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


SELECT * FROM FEEDBACK;

CREATE TABLE churn_status (
    customer_id int,
    login_frequency INT,
    feedback_rating INT,
    support_calls INT,
    avg_transaction_value NUMERIC(10, 2),
    offers_used INT,
    churn BOOLEAN,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

