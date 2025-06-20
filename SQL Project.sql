create database Management
use Management

CREATE TABLE MenuItems (
    ItemID INT PRIMARY KEY , 
	ItemName VARCHAR(100) NOT NULL,         
    Category VARCHAR(50), 
	Price DECIMAL(10,2) NOT NULL)


CREATE TABLE Tables (
    TableID INT PRIMARY KEY , 
	TableNumber INT NOT NULL UNIQUE,        
    Capacity INT NOT NULL, 
	Location VARCHAR(50) )


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY , 
	TableID INT NOT NULL,                    
    OrderDateTime DATETIME DEFAULT CURRENT_TIMESTAMP, 
	TotalAmount DECIMAL(10, 2) NOT NULL,       
    OrderStatus VARCHAR(20) DEFAULT 'Pending', 
    FOREIGN KEY (TableID) REFERENCES Tables(TableID) )


CREATE TABLE Reservations (
    ReservationID INT PRIMARY KEY, 
	CustomerName VARCHAR(100) NOT NULL,            
    ContactNumber VARCHAR(15) NOT NULL, 
	TableID INT NOT NULL, 
	ReservationDate DATE NOT NULL,                 
    ReservationTime TIME NOT NULL, 
	NumberOfGuests INT NOT NULL, 
	Status VARCHAR(20) DEFAULT 'Booked',           
    FOREIGN KEY (TableID) REFERENCES Tables(TableID) )


CREATE TABLE Customers(
    Customer_ID INT PRIMARY KEY,
    Cname VARCHAR(20),
    phone VARCHAR(20),
    email VARCHAR(20),
    address varchar(50))


CREATE TABLE Payment(
    Payment_ID INT PRIMARY KEY,
    Order_ID INT,
    Amount DECIMAL(10,2),
    Payment_method VARCHAR(20) NOT NULL CHECK(Payment_method IN('Cash', 'Card', 'UPI', 'Wallet')),
    Payment_time DATETIME,
	transaction_id VARCHAR(50),
	FOREIGN KEY (Order_ID) REFERENCES Orders(OrderID))


CREATE TABLE Employee(
    employee_id INT PRIMARY KEY,
    name VARCHAR(20),
    role VARCHAR(20),
    phone VARCHAR(20),
    email VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE)


CREATE TABLE Shifts (
    shift_id INT PRIMARY KEY,
    employee_id INT,
    shift_date DATE,
    start_time TIME,
    end_time TIME,
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id))


CREATE TABLE Feedbacks(
    feedback_id INT PRIMARY KEY,
    feedback_text NVARCHAR(1000),
    feedback_date DATETIME DEFAULT GETDATE())


INSERT INTO MenuItems ( ItemID,ItemName, Category, Price) VALUES
(1,'Chicken Biryani', 'Main Course', 180.00),
(2,'Mutton Biryani', 'Main Course', 220.00),
(3,'Paneer Butter Masala', 'Main Course', 160.00),
(4,'Butter Naan', 'Main Course', 40.00),
(5,'Veg Pulao', 'Main Course', 120.00),
(6,'Gobi Manchurian', 'Starter', 100.00),
(7,'Chicken 65', 'Starter', 140.00),
(8,'Fish Fry', 'Starter', 160.00),
(9,'French Fries', 'Starter', 90.00),
(10,'Samosa', 'Starter', 30.00),
(11,'Tomato Soup', 'Starter', 70.00),
(12,'Veg Sandwich', 'Snacks', 60.00),
(13,'Chicken Burger', 'Snacks', 120.00),
(14,'Egg Fried Rice', 'Main Course', 130.00),
(15,'Paneer Tikka', 'Starter', 150.00),
(16,'Veg Noodles', 'Main Course', 110.00),
(17,'Mutton Curry', 'Main Course', 200.00),
(18,'Masala Dosa', 'Snacks', 50.00),
(19,'Idli', 'Breakfast', 30.00),
(20,'Vada', 'Breakfast', 25.00),
(21,'Upma', 'Breakfast', 40.00),
(22,'Gulab Jamun', 'Dessert', 60.00),
(23,'Rasmalai', 'Dessert', 70.00),
(24,'Ice Cream', 'Dessert', 80.00),
(25,'Chocolate Brownie', 'Dessert', 90.00)



INSERT INTO Tables (TableID, TableNumber, Capacity, Location) VALUES
(1, 101, 2, 'Indoor'),
(2, 102, 4, 'Indoor'),
(3, 103, 2, 'Patio'),
(4, 104, 6, 'Indoor'),
(5, 105, 4, 'Patio'),
(6, 106, 2, 'Balcony'),
(7, 107, 6, 'Indoor'),
(8, 108, 4, 'Balcony'),
(9, 109, 2, 'Indoor'),
(10, 110, 8, 'Private Room'),
(11, 111, 4, 'Indoor'),
(12, 112, 2, 'Patio'),
(13, 113, 6, 'Indoor'),
(14, 114, 4, 'Balcony'),
(15, 115, 2, 'Indoor'),
(16, 116, 8, 'Private Room'),
(17, 117, 4, 'Patio'),
(18, 118, 2, 'Indoor'),
(19, 119, 6, 'Indoor'),
(20, 120, 4, 'Balcony'),
(21, 121, 2, 'Patio'),
(22, 122, 4, 'Indoor'),
(23, 123, 6, 'Indoor'),
(24, 124, 2, 'Balcony'),
(25, 125, 8, 'Private Room')

INSERT INTO Orders (OrderID, TableID, TotalAmount, OrderStatus)
VALUES 
(1, 1, 45.90, 'Pending'),
(2, 2, 89.50, 'Completed'),
(3, 3, 22.10, 'Pending'),
(4, 4, 64.00, 'Cancelled'),
(5, 5, 31.25, 'Completed'),
(6, 6, 78.40, 'Pending'),
(7, 7, 50.10, 'Completed'),
(8, 8, 92.00, 'Pending'),
(9, 9, 30.00, 'Pending'),
(10, 10, 55.75, 'Completed'),
(11, 1, 47.20, 'Pending'),
(12, 2, 34.80, 'Completed'),
(13, 3, 29.90, 'Cancelled'),
(14, 4, 63.50, 'Pending'),
(15, 5, 74.10, 'Completed'),
(16, 6, 60.00, 'Pending'),
(17, 7, 85.25, 'Pending'),
(18, 8, 99.90, 'Completed'),
(19, 9, 49.60, 'Pending'),
(20, 10, 78.30, 'Completed'),
(21, 1, 36.90, 'Cancelled'),
(22, 2, 67.20, 'Pending'),
(23, 3, 51.75, 'Completed'),
(24, 4, 44.50, 'Pending'),
(25, 5, 73.00, 'Completed')
 


INSERT INTO Reservations (
    ReservationID, CustomerName, ContactNumber, TableID, 
    ReservationDate, ReservationTime, NumberOfGuests, Status
)
VALUES 
(1, 'John Doe', '1234567890', 1, '2025-06-05', '18:00:00', 4, 'Booked'),
(2, 'Jane Smith', '2345678901', 2, '2025-06-05', '19:00:00', 2, 'Confirmed'),
(3, 'Alice Johnson', '3456789012', 3, '2025-06-06', '20:00:00', 6, 'Booked'),
(4, 'Bob Williams', '4567890123', 4, '2025-06-07', '18:30:00', 3, 'Cancelled'),
(5, 'Emma Brown', '5678901234', 5, '2025-06-07', '19:15:00', 2, 'Booked'),
(6, 'Liam Davis', '6789012345', 6, '2025-06-08', '20:45:00', 5, 'Booked'),
(7, 'Olivia Miller', '7890123456', 7, '2025-06-08', '17:00:00', 4, 'Confirmed'),
(8, 'Noah Wilson', '8901234567', 8, '2025-06-09', '18:45:00', 3, 'Booked'),
(9, 'Ava Moore', '9012345678', 9, '2025-06-09', '19:30:00', 6, 'Booked'),
(10, 'Elijah Taylor', '0123456789', 10, '2025-06-10', '20:15:00', 2, 'Booked'),
(11, 'Sophia Anderson', '1122334455', 1, '2025-06-11', '18:00:00', 4, 'Booked'),
(12, 'James Thomas', '2233445566', 2, '2025-06-12', '19:00:00', 2, 'Booked'),
(13, 'Isabella Jackson', '3344556677', 3, '2025-06-12', '20:00:00', 5, 'Cancelled'),
(14, 'Lucas White', '4455667788', 4, '2025-06-13', '18:30:00', 3, 'Booked'),
(15, 'Mia Harris', '5566778899', 5, '2025-06-13', '19:15:00', 2, 'Confirmed'),
(16, 'Benjamin Martin', '6677889900', 6, '2025-06-14', '20:45:00', 4, 'Booked'),
(17, 'Charlotte Thompson', '7788990011', 7, '2025-06-14', '17:00:00', 3, 'Booked'),
(18, 'Henry Garcia', '8899001122', 8, '2025-06-15', '18:45:00', 5, 'Booked'),
(19, 'Amelia Martinez', '9900112233', 9, '2025-06-15', '19:30:00', 6, 'Cancelled'),
(20, 'William Robinson', '1011121314', 10, '2025-06-16', '20:15:00', 2, 'Booked'),
(21, 'Evelyn Clark', '1213141516', 1, '2025-06-17', '18:00:00', 4, 'Booked'),
(22, 'Sebastian Rodriguez', '1314151617', 2, '2025-06-18', '19:00:00', 2, 'Booked'),
(23, 'Harper Lewis', '1415161718', 3, '2025-06-18', '20:00:00', 5, 'Confirmed'),
(24, 'Daniel Lee', '1516171819', 4, '2025-06-19', '18:30:00', 3, 'Booked'),
(25, 'Abigail Walker', '1617181920', 5, '2025-06-19', '19:15:00', 2, 'Booked')



INSERT INTO Customers (Customer_ID, Cname, phone, email, address) VALUES
(1, 'Amit Sharma', '9876543210', 'amit@gmail.com', 'Delhi'),
(2, 'Priya Mehta', '9812345678', 'priya@yahoo.com', 'Mumbai'),
(3, 'Ravi Kumar', '9123456789', 'ravi@hotmail.com', 'Bangalore'),
(4, 'Sneha Reddy', '9988776655', 'sneha@gmail.com', 'Hyderabad'),
(5, 'Rahul Verma', '9876512345', 'rahul@gmail.com', 'Pune'),
(6, 'Anjali Singh', '9123987654', 'anjali@gmail.com', 'Chennai'),
(7, 'Vikas Yadav', '9845123789', 'vikas@rediff.com', 'Noida'),
(8, 'Pooja Jain', '9977553311', 'pooja@yahoo.com', 'Jaipur'),
(9, 'Manish Desai', '9811223344', 'manish@gmail.com', 'Ahmedabad'),
(10, 'Kavita Nair', '9955443322', 'kavita@hotmail.com', 'Kochi'),
(11, 'Arjun Das', '9822113344', 'arjun@gmail.com', 'Kolkata'),
(12, 'Meena Joshi', '9898989898', 'meena@yahoo.com', 'Surat'),
(13, 'Karan Kapoor', '9933445566', 'karan@gmail.com', 'Ludhiana'),
(14, 'Neha Saxena', '9811998877', 'neha@outlook.com', 'Bhopal'),
(15, 'Siddharth Rao', '9944332211', 'siddharth@gmail.com', 'Mysore'),
(16, 'Divya Malhotra', '9977886655', 'divya@yahoo.com', 'Indore'),
(17, 'Rohit Sinha', '9833557788', 'rohit@gmail.com', 'Nagpur'),
(18, 'Simran Kaur', '9844112233', 'simran@hotmail.com', 'Chandigarh'),
(19, 'Nikhil Jain', '9866554433', 'nikhil@gmail.com', 'Varanasi'),
(20, 'Tanya Gupta', '9877123456', 'tanya@yahoo.com', 'Patna'),
(21, 'Harsh Vardhan', '9888997766', 'harsh@gmail.com', 'Lucknow'),
(22, 'Ritika Arora', '9822446688', 'ritika@outlook.com', 'Amritsar'),
(23, 'Suresh Babu', '9844001122', 'suresh@gmail.com', 'Vijayawada'),
(24, 'Aarti Chauhan', '9866223344', 'aarti@yahoo.com', 'Guwahati'),
(25, 'Naveen Kumar', '9833445566', 'naveen@gmail.com', 'Thiruvananthapuram')

INSERT INTO Payment(Payment_ID, Order_ID, Amount, Payment_method, Payment_time, transaction_id) VALUES
(1, 101, 1500.00, 'Card', '2025-06-01 14:30:00', 'TXN101001'),
(2, 102, 250.50, 'Cash', '2025-06-01 15:00:00', 'TXN102002'),
(3, 103, 799.99, 'UPI', '2025-06-02 11:15:00', 'TXN103003'),
(4, 104, 560.75, 'Wallet', '2025-06-02 16:45:00', 'TXN104004'),
(5, 105, 3000.00, 'Card', '2025-06-03 10:00:00', 'TXN105005'),
(6, 106, 1200.25, 'UPI', '2025-06-03 14:25:00', 'TXN106006'),
(7, 107, 450.00, 'Cash', '2025-06-03 19:30:00', 'TXN107007'),
(8, 108, 899.00, 'Card', '2025-06-04 09:45:00', 'TXN108008'),
(9, 109, 1350.40, 'UPI', '2025-06-04 12:10:00', 'TXN109009'),
(10, 110, 999.99, 'Wallet', '2025-06-04 17:00:00', 'TXN110010'),
(11, 111, 1850.00, 'Card', '2025-06-05 10:30:00', 'TXN111011'),
(12, 112, 75.00, 'Cash', '2025-06-05 12:00:00', 'TXN112012'),
(13, 113, 620.50, 'Wallet', '2025-06-05 15:30:00', 'TXN113013'),
(14, 114, 1100.75, 'UPI', '2025-06-05 18:15:00', 'TXN114014'),
(15, 115, 2000.00, 'Card', '2025-06-06 09:00:00', 'TXN115015'),
(16, 116, 300.00, 'Cash', '2025-06-06 11:45:00', 'TXN116016'),
(17, 117, 850.30, 'UPI', '2025-06-06 14:20:00', 'TXN117017'),
(18, 118, 499.99, 'Wallet', '2025-06-06 17:10:00', 'TXN118018'),
(19, 119, 1300.00, 'Card', '2025-06-07 10:00:00', 'TXN119019'),
(20, 120, 225.00, 'Cash', '2025-06-07 13:30:00', 'TXN120020'),
(21, 121, 780.20, 'UPI', '2025-06-07 16:50:00', 'TXN121021'),
(22, 122, 950.75, 'Wallet', '2025-06-08 09:30:00', 'TXN122022'),
(23, 123, 2100.00, 'Card', '2025-06-08 11:40:00', 'TXN123023'),
(24, 124, 500.00, 'Cash', '2025-06-08 14:15:00', 'TXN124024'),
(25, 125, 675.25, 'UPI', '2025-06-08 17:30:00', 'TXN125025')


INSERT INTO Employee (employee_id, name, role, phone, email, salary, hire_date) VALUES
(1, 'Amit Singh', 'Manager', '9876543210', 'amit@company.com', 75000.00, '2020-01-15'),
(2, 'Priya Mehta', 'HR', '9812345678', 'priya@company.com', 52000.00, '2021-03-20'),
(3, 'Ravi Kumar', 'Developer', '9123456789', 'ravi@company.com', 60000.00, '2019-06-10'),
(4, 'Sneha Reddy', 'Tester', '9988776655', 'sneha@company.com', 48000.00, '2022-01-12'),
(5, 'Rahul Verma', 'Developer', '9876512345', 'rahul@company.com', 61000.00, '2021-11-05'),
(6, 'Anjali Singh', 'Manager', '9123987654', 'anjali@company.com', 77000.00, '2020-08-30'),
(7, 'Vikas Yadav', 'HR', '9845123789', 'vikas@company.com', 53000.00, '2022-04-17'),
(8, 'Pooja Jain', 'Developer', '9977553311', 'pooja@company.com', 62000.00, '2023-01-25'),
(9, 'Manish Desai', 'Tester', '9811223344', 'manish@company.com', 49000.00, '2022-09-14'),
(10, 'Kavita Nair', 'Manager', '9955443322', 'kavita@company.com', 80000.00, '2018-12-01'),
(11, 'Arjun Das', 'Developer', '9822113344', 'arjun@company.com', 60500.00, '2021-07-07'),
(12, 'Meena Joshi', 'HR', '9898989898', 'meena@company.com', 51000.00, '2023-03-10'),
(13, 'Karan Kapoor', 'Tester', '9933445566', 'karan@company.com', 47000.00, '2020-06-18'),
(14, 'Neha Saxena', 'Developer', '9811998877', 'neha@company.com', 63000.00, '2021-01-20'),
(15, 'Siddharth Rao', 'Manager', '9944332211', 'siddharth@company.com', 82000.00, '2019-04-11'),
(16, 'Divya Malhotra', 'HR', '9977886655', 'divya@company.com', 52500.00, '2020-10-16'),
(17, 'Rohit Sinha', 'Tester', '9833557788', 'rohit@company.com', 46000.00, '2023-02-14'),
(18, 'Simran Kaur', 'Developer', '9844112233', 'simran@company.com', 61500.00, '2021-08-03'),
(19, 'Nikhil Jain', 'Manager', '9866554433', 'nikhil@company.com', 79000.00, '2020-05-09'),
(20, 'Tanya Gupta', 'Developer', '9877123456', 'tanya@company.com', 60000.00, '2022-06-22'),
(21, 'Harsh Vardhan', 'HR', '9888997766', 'harsh@company.com', 54000.00, '2019-09-13'),
(22, 'Ritika Arora', 'Tester', '9822446688', 'ritika@company.com', 45500.00, '2023-05-01'),
(23, 'Suresh Babu', 'Developer', '9844001122', 'suresh@company.com', 62500.00, '2020-07-27'),
(24, 'Aarti Chauhan', 'HR', '9866223344', 'aarti@company.com', 50000.00, '2021-10-04'),
(25, 'Naveen Kumar', 'Developer', '9833445566', 'naveen@company.com', 63500.00, '2022-11-29')

INSERT INTO Shifts(shift_id, employee_id, shift_date, start_time, end_time) VALUES
(1, 1, '2025-06-01', '09:00:00', '17:00:00'),
(2, 2, '2025-06-01', '10:00:00', '18:00:00'),
(3, 3, '2025-06-01', '08:00:00', '16:00:00'),
(4, 4, '2025-06-01', '09:00:00', '17:00:00'),
(5, 5, '2025-06-01', '11:00:00', '19:00:00'),
(6, 6, '2025-06-02', '09:00:00', '17:00:00'),
(7, 7, '2025-06-02', '10:00:00', '18:00:00'),
(8, 8, '2025-06-02', '08:00:00', '16:00:00'),
(9, 9, '2025-06-02', '09:00:00', '17:00:00'),
(10, 10,'2025-06-02', '11:00:00', '19:00:00'),
(11, 11,'2025-06-03', '09:00:00', '17:00:00'),
(12, 12,'2025-06-03', '10:00:00', '18:00:00'),
(13, 13,'2025-06-03', '08:00:00', '16:00:00'),
(14, 14,'2025-06-03', '09:00:00', '17:00:00'),
(15, 15,'2025-06-03', '11:00:00', '19:00:00'),
(16, 16,'2025-06-04', '09:00:00', '17:00:00'),
(17, 17,'2025-06-04', '10:00:00', '18:00:00'),
(18, 18,'2025-06-04', '08:00:00', '16:00:00'),
(19, 19,'2025-06-04', '09:00:00', '17:00:00'),
(20, 20,'2025-06-04', '11:00:00', '19:00:00'),
(21, 21,'2025-06-05', '09:00:00', '17:00:00'),
(22, 22,'2025-06-05', '10:00:00', '18:00:00'),
(23, 23,'2025-06-05', '08:00:00', '16:00:00'),
(24, 24,'2025-06-05', '09:00:00', '17:00:00'),
(25, 25,'2025-06-05', '11:00:00', '19:00:00')

INSERT INTO Feedbacks (feedback_id, feedback_text) VALUES
(1, 'Great service and fast delivery!'),
(2, 'Product quality was excellent.'),
(3, 'Customer support was very helpful.'),
(4, 'Delivery took longer than expected.'),
(5, 'Website is user-friendly.'),
(6, 'Found what I was looking for easily.'),
(7, 'The checkout process could be faster.'),
(8, 'Very satisfied with my purchase.'),
(9, 'Packaging was good and secure.'),
(10, 'Product arrived damaged.'),
(11, 'Would definitely recommend to others.'),
(12, 'Had trouble tracking my order.'),
(13, 'Excellent variety of products.'),
(14, 'Wish there were more payment options.'),
(15, 'Smooth and hassle-free shopping experience.'),
(16, 'Live chat support was responsive.'),
(17, 'Mobile app needs improvement.'),
(18, 'Fast refund process, appreciated!'),
(19, 'Product didn’t match the description.'),
(20, 'Loved the discounts and offers.'),
(21, 'Received a wrong item.'),
(22, 'Replaced item quickly, thank you!'),
(23, 'Please improve the return policy.'),
(24, 'Very professional delivery personnel.'),
(25, 'Looking forward to shopping again!')


/* TO VIEW THE TABLES */
Select * from MenuItems
Select * from Tables
Select * from Orders
Select * from Reservations
Select * from Customers
Select * from Payment
Select * from Employee
Select * from Feedbacks
Select * from Shifts

/* USING ALTER COMMAND TO ADD COLUMN IN THE TABLE */
ALTER TABLE MenuItems
ADD SpicyLevel INT

/* USING UPDATE COMMAND TO MODIFY THE TABLE */
UPDATE MenuItems
SET Category = 'Dessert',
    ItemID = 2
WHERE Category = 'Snacks'

/* USING ALL AGGREGATE FUNCTION */
Select Min(TotalAmount) as minimum from Orders
Select Avg(TotalAmount) as Average from Orders
Select Sum(TotalAmount) as Total from Orders
Select Count(TotalAmount) as Count from Orders
Select Max(TotalAmount) as Maximum from Orders

/* TO VIEW TOP 5 RESERVATIONS */
SELECT * FROM payments where max(amount) > 500

/* TO VIEW THE RESERVATIONS UPTO THE RANGE */
Select * from Reservations where ReservationDate BETWEEN '2025-06-05' AND '2025-06-15'

/* TO VIEW THE CUSTOMER'S NAME STARTS WITH A IN RESERVATION TABLE */
Select * from Reservations where CustomerName LIKE 'A%'
ORDER BY ReservationDate 

/*  */
SELECT r.ReservationID,r.CustomerName,r.ReservationDate,r.ReservationTime,r.NumberOfGuests,r.Status AS ReservationStatus,
o.OrderID,o.TotalAmount,o.OrderStatus
FROM Reservations as r
JOIN 
Orders as o ON r.TableID = o.OrderID

/* TO CREATE PROCEDURE AND INSERT VALUES IN MENUITEMS TABLES */
CREATE PROCEDURE InsertMenuItems
    @ItemID INT,
    @ItemName VARCHAR(100),
    @Category VARCHAR(50),
    @Price DECIMAL(10, 2)
AS
BEGIN
    INSERT INTO MenuItems (ItemID, ItemName, Category, Price)
    VALUES (101,'ice cream','Dessert',150.00)
END

EXEC sp_helptext 'InsertMenuItems'
select * from MenuItems




























