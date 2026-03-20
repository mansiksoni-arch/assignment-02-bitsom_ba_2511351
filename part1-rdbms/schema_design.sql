CREATE TABLE Customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) UNIQUE,
    customer_city VARCHAR(50)
);

CREATE TABLE Products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    unit_price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE SalesReps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100),
    office_address VARCHAR(255)
);

CREATE TABLE Orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10),
    product_id VARCHAR(10),
    sales_rep_id VARCHAR(10),
    quantity INT NOT NULL,
    order_date DATE,
    -- These "Foreign Keys" link this table to the others
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (sales_rep_id) REFERENCES SalesReps(sales_rep_id)
);

INSERT INTO Customers (customer_id, customer_name, customer_email, customer_city) VALUES
('C001', 'Rohan Mehta', 'rohan@gmail.com', 'Mumbai'),
('C002', 'Priya Sharma', 'priya@gmail.com', 'Delhi'),
('C003', 'Amit Verma', 'amit@gmail.com', 'Bangalore'),
('C004', 'Sneha Iyer', 'sneha@gmail.com', 'Chennai'),
('C005', 'Vikram Singh', 'vikram@gmail.com', 'Mumbai');

INSERT INTO Products (product_id, product_name, category, unit_price) VALUES
('P001', 'Laptop', 'Electronics', 55000),
('P002', 'Mouse', 'Electronics', 800),
('P003', 'Desk Chair', 'Furniture', 8500),
('P004', 'Notebook', 'Stationery', 120),
('P005', 'Headphones', 'Electronics', 3200);

INSERT INTO SalesReps (sales_rep_id, sales_rep_name, sales_rep_email, office_address) VALUES
('SR01', 'Deepak Joshi', 'deepak@corp.com', 'Mumbai HQ, Nariman Point'),
('SR02', 'Anita Desai', 'anita@corp.com', 'Delhi Office, Connaught Place'),
('SR03', 'Ravi Kumar', 'ravi@corp.com', 'South Zone, MG Road, Bangalore'),
('SR04', 'Suresh Raina', 'suresh@corp.com', 'Chennai Branch'),
('SR05', 'Meera Nair', 'meera@corp.com', 'Hyderabad Hub');

INSERT INTO Orders (order_id, customer_id, product_id, sales_rep_id, quantity, order_date) VALUES
('ORD1001', 'C001', 'P001', 'SR01', 1, '2023-01-15'),
('ORD1002', 'C002', 'P004', 'SR02', 4, '2023-02-11'),
('ORD1003', 'C003', 'P005', 'SR03', 2, '2023-03-05'),
('ORD1004', 'C004', 'P002', 'SR01', 5, '2023-04-10'),
('ORD1005', 'C005', 'P003', 'SR03', 1, '2023-05-20');
