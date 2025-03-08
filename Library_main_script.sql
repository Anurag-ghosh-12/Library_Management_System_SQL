-- Library System Management SQL Project

-- CREATE DATABASE library_system;

-- Create table "LibraryBranch"
DROP TABLE IF EXISTS LibraryBranch;
CREATE TABLE LibraryBranch
(
    branch_id VARCHAR(10) PRIMARY KEY,
    manager_id VARCHAR(10),
    branch_address VARCHAR(50),
    contact_no VARCHAR(15)
);

-- Create table "Staff"
DROP TABLE IF EXISTS Staff;
CREATE TABLE Staff
(
    staff_id VARCHAR(10) PRIMARY KEY,
    staff_name VARCHAR(40),
    position VARCHAR(30),
    salary DECIMAL(10,2),
    branch_id VARCHAR(10),
    FOREIGN KEY (branch_id) REFERENCES LibraryBranch(branch_id)
);

-- Create table "LibraryMembers"
DROP TABLE IF EXISTS LibraryMembers;
CREATE TABLE LibraryMembers
(
    member_id VARCHAR(15) PRIMARY KEY,
    member_name VARCHAR(40),
    member_address VARCHAR(50),
    reg_date DATE
);

-- Create table "Books"
DROP TABLE IF EXISTS Books;
CREATE TABLE Books
(
    isbn VARCHAR(50) PRIMARY KEY,
    book_title VARCHAR(80),
    category VARCHAR(50),
    rental_price DECIMAL(10,2),
    status VARCHAR(10),
    author VARCHAR(40),
    publisher VARCHAR(40)
);

-- Create table "IssueStatus"
DROP TABLE IF EXISTS IssueStatus;
CREATE TABLE IssueStatus
(
    issued_id VARCHAR(10) PRIMARY KEY,
    issued_member_id VARCHAR(15),
    issued_book_isbn VARCHAR(50),
    issued_date DATE,
    issued_staff_id VARCHAR(10),
    FOREIGN KEY (issued_member_id) REFERENCES LibraryMembers(member_id),
    FOREIGN KEY (issued_staff_id) REFERENCES Staff(staff_id),
    FOREIGN KEY (issued_book_isbn) REFERENCES Books(isbn)
);

-- Create table "ReturnStatus"
DROP TABLE IF EXISTS ReturnStatus;
CREATE TABLE ReturnStatus
(
    return_id VARCHAR(10) PRIMARY KEY,
    issued_id VARCHAR(10),
    return_date DATE,
    FOREIGN KEY (issued_id) REFERENCES IssueStatus(issued_id)
);

-- Insert data into LibraryBranch
INSERT INTO LibraryBranch VALUES
('B001', 'FACC001', 'IIEST Shibpur Main Library', '9876543210'),
('B002', 'FACC002', 'IIEST Shibpur Tech Library', '9876543211'),
('B003', 'FACC003', 'IIEST Digital Library', '9876543212'),
('B004', 'FACC004', 'IIEST Research Library', '9876543213');

-- Insert data into Staff
INSERT INTO Staff VALUES
('FACC001', 'Dr. A. Sharma', 'Chief Librarian', 80000, 'B001'),
('FACC002', 'Mr. B. Roy', 'Assistant Librarian', 50000, 'B002'),
('FACC003', 'Ms. C. Ghosh', 'Library Staff', 35000, 'B003'),
('FACC004', 'Mr. D. Singh', 'Library Staff', 35000, 'B004'),
('FACC005', 'Mrs. E. Das', 'Library Staff', 35000, 'B001'),
('FACC006', 'Mr. F. Mukherjee', 'Library Staff', 35000, 'B002'),
('FACC007', 'Dr. G. Bose', 'Senior Librarian', 60000, 'B003'),
('FACC008', 'Dr. H. Nandi', 'Library Staff', 40000, 'B004'),
('FACC009', 'Mr. I. Sinha', 'Library Staff', 35000, 'B001'),
('FACC010', 'Ms. J. Chatterjee', 'Library Assistant', 32000, 'B002');

-- Insert data into LibraryMembers
INSERT INTO LibraryMembers VALUES
('2022CSB13STU', 'Rahul Sharma', 'Burdwan, West Bengal', '2025-01-15'),
('2022CSB2STU', 'Priya Das', 'Kolkata, West Bengal', '2023-02-10'),
('2022CSB3STU', 'Amit Kumar', 'Durgapur, West Bengal', '2023-03-05'),
('2022CSB4STU', 'Suman Karmakar', 'Siliguri, West Bengal', '2023-04-12'),
('2022CSB5STU', 'Neha Sharma', 'Patna, Bihar', '2023-05-20'),
('2022CSB6STU', 'Arjun Roy', 'Bhubaneswar, Odisha', '2023-06-18'),
('2022CSB7STU', 'Meera Gupta', 'Ranchi, Jharkhand', '2023-07-25'),
('2022CSB8STU', 'Kiran Pandey', 'Jamshedpur, Jharkhand', '2023-08-30'),
('2022CSB9STU', 'Aniket Saha', 'Lucknow, Uttar Pradesh', '2023-09-15'),
('2022CSB10STU', 'Sneha Reddy', 'Hyderabad, Telangana', '2023-10-05');

ALTER TABLE Books 
ALTER COLUMN book_title TYPE VARCHAR(100),
ALTER COLUMN author TYPE VARCHAR(80),
ALTER COLUMN publisher TYPE VARCHAR(60);

-- Insert data into Books (Engineering Related)
INSERT INTO Books VALUES
('978-0-07-339823-3', 'Data Structures and Algorithm Analysis in C++', 'Computer Science', 8.50, 'yes', 'Mark Allen Weiss', 'Pearson'),
('978-0-13-359162-0', 'Computer Organization and Design', 'Computer Science', 9.00, 'yes', 'David A. Patterson, John L. Hennessy', 'Morgan Kaufmann'),
('978-0-07-163528-2', 'Digital Signal Processing', 'Electronics', 7.50, 'yes', 'John G. Proakis', 'McGraw-Hill'),
('978-0-07-066923-3', 'Microelectronics Circuits', 'Electronics', 8.50, 'yes', 'Adel S. Sedra, Kenneth C. Smith', 'Oxford'),
('978-1-292-02848-3', 'Electrical Engineering: Principles and Applications', 'Electrical', 9.00, 'yes', 'Allan R. Hambley', 'Pearson'),
('978-0-13-438259-3', 'Power System Analysis and Design', 'Electrical', 8.00, 'yes', 'J. Duncan Glover', 'Cengage'),
('978-0-07-339817-2', 'Control Systems Engineering', 'Electrical', 8.50, 'yes', 'Norman S. Nise', 'Wiley'),
('978-0-07-246563-1', 'Signals and Systems', 'Electronics', 9.00, 'yes', 'Alan V. Oppenheim, Alan S. Willsky', 'Pearson'),
('978-1-260-57145-3', 'Communication Systems', 'Electronics', 7.50, 'yes', 'Simon Haykin', 'Wiley'),
('978-1-400-06766-6', 'The Art of Electronics', 'Electronics', 9.50, 'yes', 'Paul Horowitz, Winfield Hill', 'Cambridge'),
('978-0-07-126784-3', 'Engineering Electromagnetics', 'Electrical', 8.50, 'yes', 'William H. Hayt', 'McGraw-Hill'),
('978-0-07-354595-6', 'Introduction to Fluid Mechanics', 'Mechanical', 8.00, 'yes', 'Robert W. Fox', 'Wiley'),
('978-0-07-339820-4', 'Thermodynamics: An Engineering Approach', 'Mechanical', 9.00, 'yes', 'Yunus A. Cengel', 'McGraw-Hill'),
('978-1-119-32226-0', 'Machine Design', 'Mechanical', 8.50, 'yes', 'Robert L. Norton', 'Pearson'),
('978-0-07-066595-2', 'Strength of Materials', 'Mechanical', 8.00, 'yes', 'R. K. Bansal', 'Laxmi'),
('978-0-07-352935-0', 'Manufacturing Engineering and Technology', 'Mechanical', 9.00, 'yes', 'Serope Kalpakjian', 'Pearson'),
('978-0-13-600663-3', 'Materials Science and Engineering', 'Materials', 8.50, 'yes', 'William D. Callister', 'Wiley'),
('978-0-07-352930-5', 'Engineering Mechanics: Statics and Dynamics', 'Mechanical', 8.50, 'yes', 'J. L. Meriam', 'Wiley'),
('978-0-07-126779-9', 'Structural Analysis', 'Civil', 8.00, 'yes', 'R. C. Hibbeler', 'Pearson'),
('978-0-07-339812-9', 'Mechanics of Materials', 'Mechanical', 8.50, 'yes', 'James M. Gere', 'Cengage'),
('978-0-07-329349-0', 'Hydraulics and Fluid Mechanics', 'Civil', 8.00, 'yes', 'P. N. Modi, S. M. Seth', 'Standard'),
('978-0-07-339818-1', 'Soil Mechanics and Foundations', 'Civil', 8.50, 'yes', 'Muni Budhu', 'Wiley'),
('978-0-07-321573-2', 'Structural Steel Design', 'Civil', 8.50, 'yes', 'Jack C. McCormac', 'Prentice Hall'),
('978-0-13-335106-8', 'Construction Planning, Equipment, and Methods', 'Civil', 8.00, 'yes', 'Robert L. Peurifoy', 'McGraw-Hill'),
('978-0-07-340110-3', 'Transportation Engineering', 'Civil', 8.50, 'yes', 'Nicholas J. Garber', 'Pearson'),
('978-0-07-321549-7', 'Environmental Engineering', 'Civil', 8.50, 'yes', 'Howard S. Peavy', 'McGraw-Hill'),
('978-0-13-336093-0', 'Water Resources Engineering', 'Civil', 8.00, 'yes', 'Larry W. Mays', 'Wiley'),
('978-0-07-128792-2', 'Chemical Engineering Thermodynamics', 'Chemical', 8.50, 'yes', 'J. M. Smith', 'McGraw-Hill'),
('978-0-07-352302-6', 'Transport Processes and Separation Process Principles', 'Chemical', 9.00, 'yes', 'Christie J. Geankoplis', 'Prentice Hall'),
('978-0-07-151021-9', 'Introduction to Chemical Engineering', 'Chemical', 8.00, 'yes', 'Kenneth A. Solen', 'Wiley'),
('978-0-07-340113-4', 'Bioprocess Engineering', 'Biotechnology', 8.50, 'yes', 'Michael L. Shuler', 'Pearson'),
('978-0-13-231233-6', 'Fundamentals of Bioengineering', 'Biotechnology', 8.50, 'yes', 'D. M. Himmelblau', 'Pearson'),
('978-1-118-09916-2', 'Molecular Biology of the Cell', 'Biotechnology', 9.00, 'yes', 'Bruce Alberts', 'Garland Science'),
('978-1-118-27658-3', 'Machine Learning', 'Computer Science', 9.50, 'yes', 'Tom M. Mitchell', 'McGraw-Hill'),
('978-1-593-27082-7', 'Deep Learning', 'Computer Science', 9.50, 'yes', 'Ian Goodfellow, Yoshua Bengio, Aaron Courville', 'MIT Press'),
('978-0-321-44668-8', 'Pattern Recognition and Machine Learning', 'Computer Science', 9.00, 'yes', 'Christopher M. Bishop', 'Springer'),
('978-0-262-03384-8', 'Computer Vision: Algorithms and Applications', 'Computer Science', 9.50, 'yes', 'Richard Szeliski', 'Springer'),
('978-0-07-182285-2', 'Introduction to Robotics: Mechanics and Control', 'Mechanical', 8.50, 'yes', 'John J. Craig', 'Pearson'),
('978-0-262-01802-9', 'Artificial Intelligence: Foundations of Computational Agents', 'Computer Science', 9.00, 'yes', 'David L. Poole, Alan K. Mackworth', 'Cambridge'),
('978-0-262-03384-6', 'Neural Networks and Deep Learning', 'Computer Science', 9.50, 'yes', 'Michael Nielsen', 'MIT Press');
SELECT * FROM Books;

--Insert the Issued Books data into IssueStatus
INSERT INTO IssueStatus VALUES
('IS016', '2022CSB10STU', '978-0-07-066923-3', '2024-02-21', 'FACC001'),
('IS012', '2022CSB2STU', '978-0-13-438259-3', '2024-02-23', 'FACC002'),
('IS013', '2022CSB3STU', '978-0-07-339817-2', '2024-02-24', 'FACC003'),
('IS014', '2022CSB4STU', '978-0-07-126784-3', '2024-02-25', 'FACC004');

-- Insert data in the Return status table
INSERT INTO ReturnStatus VALUES
('RT011', 'IS014', NULL),
('RT007', 'IS007', '2024-03-22'),
('RT008', 'IS008', '2024-03-25'),
('RT009', 'IS009', '2024-03-28'),
('RT010', 'IS010', '2024-03-30');

--Update an Existing Librarymember's Address
UPDATE LibraryMembers 
SET member_address = 'Kolkata , West Bengal' 
WHERE member_id = '2022CSB1STU';

--Delete a Record from the IssueStatus Table
DELETE FROM IssueStatus 
WHERE issued_id = 'IS011';

--Retrieve All Books Issued by a Specific Employee
SELECT issued_book_isbn, issued_date 
FROM IssueStatus 
WHERE issued_staff_id = 'FACC001';

--List Members Who Have Issued More Than One Book
SELECT issued_member_id, COUNT(*) AS issued_count 
FROM IssueStatus 
GROUP BY issued_member_id 
HAVING COUNT(*) > 1;

-------------------BOOK RELATED DATA ANALYSIS------------------------
-- 1. View All Books
SELECT * FROM Books;

-- 2. Count Total Books
SELECT COUNT(*) AS total_books FROM Books;

-- 3. Count Books by Category
SELECT category, COUNT(*) AS book_count 
FROM Books 
GROUP BY category 
ORDER BY book_count DESC;

-- 4. Find the Most Expensive & Cheapest Books
SELECT * FROM Books ORDER BY rental_price DESC LIMIT 1;  -- Most expensive book
SELECT * FROM Books ORDER BY rental_price ASC LIMIT 1;   -- Cheapest book

-- 5. Find Available Books for Rent
SELECT * FROM Books WHERE status = 'yes';

-- 6. Find Books by a Specific Author
SELECT * FROM Books WHERE author LIKE '%Norman S. Nise%';

-- 7. Find Books Published by a Specific Publisher
SELECT publisher, COUNT(*) AS total_books 
FROM Books 
GROUP BY publisher 
ORDER BY total_books DESC;

-- 8. Find Books with Rental Price Above Average
SELECT * FROM Books 
WHERE rental_price > (SELECT AVG(rental_price) FROM Books);

-- 9. Find the Category with the Most Expensive Books (on average)
SELECT category, AVG(rental_price) AS avg_price 
FROM Books 
GROUP BY category 
ORDER BY avg_price DESC 
LIMIT 1;

-- 10. Find Books Whose Title Contains a Specific Keyword
SELECT * FROM Books WHERE book_title LIKE '%Networks%';

-- Create Summary Table to to generate new tables based on - each book and total book_issued_cnt
CREATE TABLE BookSummary AS
SELECT b.isbn, b.book_title, COUNT(i.issued_id) AS book_issued_cnt
FROM Books b
LEFT JOIN IssueStatus i ON b.isbn = i.issued_book_isbn
GROUP BY b.isbn, b.book_title;

SELECT * FROM BookSummary;

--Find Total Rental Income grouped by Category:
SELECT category, SUM(rental_price) AS total_rental_income 
FROM Books 
GROUP BY category;

-- Find all those members who registered in the last 180 days
SELECT * 
FROM LibraryMembers 
WHERE (CURRENT_DATE - reg_date) * 24 < 180 * 24;

--Employee details with their managers:
SELECT s.staff_name, lb.manager_id, lb.branch_address, lb.contact_no 
FROM Staff s
JOIN LibraryBranch lb ON s.branch_id = lb.branch_id;

--Along with the name of the managers (Excluding those who are managers themselves)
SELECT s.staff_name, lb.manager_id, m.staff_name AS manager_name, lb.branch_address, lb.contact_no 
FROM Staff s
JOIN LibraryBranch lb ON s.branch_id = lb.branch_id
LEFT JOIN Staff m ON lb.manager_id = m.staff_id
WHERE s.staff_id <> lb.manager_id;

--- FUNCTIONALITIES:

-- Identify members with Overdue Books(more than 30 days)
SELECT 
    ist.issued_member_id,
    m.member_name,
    bk.book_title,
    ist.issued_date,
    CURRENT_DATE - ist.issued_date AS overdue_days
FROM issued_status ist
JOIN members m ON m.member_id = ist.issued_member_id
JOIN books bk ON bk.isbn = ist.issued_book_isbn
LEFT JOIN return_status rs ON rs.issued_id = ist.issued_id
WHERE rs.return_date IS NULL AND (CURRENT_DATE - ist.issued_date) > 30
ORDER BY overdue_days DESC;

-- Update status of book to "YES" when they are returned
UPDATE books
SET status = 'yes'
WHERE isbn IN (
    SELECT ist.issued_book_isbn 
    FROM issued_status ist
    JOIN return_status rs ON ist.issued_id = rs.issued_id
);

-- Branchwise report
SELECT 
    lb.branch_id,
    COUNT(DISTINCT iss.issued_id) AS total_books_issued,
    COUNT(DISTINCT ret.return_id) AS total_books_returned,
    COALESCE(SUM(b.rental_price), 0) AS total_revenue
FROM LibraryBranch lb
LEFT JOIN Staff s ON lb.branch_id = s.branch_id
LEFT JOIN IssueStatus iss ON s.staff_id = iss.issued_staff_id
LEFT JOIN ReturnStatus ret ON iss.issued_id = ret.issued_id
LEFT JOIN Books b ON iss.issued_book_isbn = b.isbn
GROUP BY lb.branch_id
ORDER BY total_books_issued DESC;

