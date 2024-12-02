-- Create the Books table
CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    author VARCHAR(50) NOT NULL,
    genre VARCHAR(50),
    published_year INT,
);

-- Create the Borrowers table
CREATE TABLE Borrowers (
    BorrowerID INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    phone_number VARCHAR(50)
);

-- Create Borrowed Books table
CREATE TABLE BorrowedBooks (
	borrowed_id int primary key,
    book_id int references books (book_id),
    borrower_id int references borrowers (borrowers_id),
    borrow_date date,
    return_date date,
    FOREIGN KEY (book_id) REFERENCES Books (book_id),
    FOREIGN KEY (borrower_id) REFERENCES Borrowers (borrower_id)
);

-- Insert first batches of data
-- Insert books sample
INSERT INTO Books (book_id, title, author, genre, published_year)
VALUES
('1','Born Rich','Querida McCullogh','Documentary','2002'),
('2','Truth or Consequences','N.M.	Leigh Bishop','Action','2012'),
('3','Lupin the Third: The Secret of Mamo','Wanda Waterman','Action','1989'),
('4','State Property','Hetti Pitrollo','Crime','2002');

--Insert Borrowers sample
INSERT INTO Borrowers (BorrowerID, full_name, email, phone_number)
VALUES
('1','Karina Gow','kgow0@topsy.com','8772662000'),
('2','Viviana Borgne','vborgne1@tiny.cc','1182029500'),
('3','Anneliese Espinos','aespinos2@un.org','7202238384'),
('4','Barney Kampshell','bkampshell3@photobucket.com','2168660484');

-- Insert borrowed books sample
INSERT INTO BorrowedBooks (book_id, borrower_id, borrow_date, return_date)
VALUES
(1, 4, '2024-11-01', '2024-11-07'),
(2, 3, '2024-11-15', '2024-11-22'),
(3, 2, '2024-12-01', '2024-12-12'),
(4, 1, '2024-12-01', '2024-12-05');

-- View available books
SELECT * 
FROM Books 
WHERE book_id NOT IN (SELECT book_id FROM BorrowedBooks WHERE return_date IS NULL);

-- Update when a book is returned
UPDATE BorrowedBooks
SET return_date = CURDATE()
WHERE borrowed_id = [BORROWED_ID] AND return_date IS NULL;

-- Delete a record when a borrower no long have books
DELETE FROM Borrowers
WHERE borrower_id = [BORROWER_ID]
AND NOT EXISTS (
    SELECT 1
    FROM BorrowedBooks
    WHERE borrower_id = Borrowers.borrower_id
    AND return_date IS NULL
);