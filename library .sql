-- Library Management System SQL Schema

-- 1. Create Database
CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;

-- 2. Create Tables

-- Authors Table
CREATE TABLE Authors (
	AuthorID INT AUTO_INCREMENT PRIMARY KEY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL
);

-- Categories Table
CREATE TABLE Categories (
	CategoryID INT AUTO_INCREMENT PRIMARY KEY,
	CategoryName VARCHAR(100) NOT NULL UNIQUE
);

-- Books Table
CREATE TABLE Books (
	BookID INT AUTO_INCREMENT PRIMARY KEY,
	Title VARCHAR(200) NOT NULL,
	ISBN VARCHAR(20) NOT NULL UNIQUE,
	PublicationYear INT,
	Publisher VARCHAR(100),
	CopiesAvailable INT NOT NULL DEFAULT 1
);

-- BookAuthors (Many-to-Many: Books-Authors)
CREATE TABLE BookAuthors (
	BookID INT NOT NULL,
	AuthorID INT NOT NULL,
	PRIMARY KEY (BookID, AuthorID),
	FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE,
	FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID) ON DELETE CASCADE
);

-- BookCategories (Many-to-Many: Books-Categories)
CREATE TABLE BookCategories (
	BookID INT NOT NULL,
	CategoryID INT NOT NULL,
	PRIMARY KEY (BookID, CategoryID),
	FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE,
	FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID) ON DELETE CASCADE
);

-- Members Table
CREATE TABLE Members (
	MemberID INT AUTO_INCREMENT PRIMARY KEY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	Email VARCHAR(100) NOT NULL UNIQUE,
	Phone VARCHAR(20),
	Address VARCHAR(200),
	JoinDate DATE NOT NULL
	
);


-- Staff Table
CREATE TABLE Staff (
	StaffID INT AUTO_INCREMENT PRIMARY KEY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	Email VARCHAR(100) NOT NULL UNIQUE,
	Role VARCHAR(50) NOT NULL
);

-- Loans Table
CREATE TABLE Loans (
	LoanID INT AUTO_INCREMENT PRIMARY KEY,
	BookID INT NOT NULL,
	MemberID INT NOT NULL,
	StaffID INT NOT NULL,
	LoanDate DATE NOT NULL,
	DueDate DATE NOT NULL,
	ReturnDate DATE,
	FOREIGN KEY (BookID) REFERENCES Books(BookID),
	FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
	FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
	
);

-- Sample Data: Financial Books
INSERT INTO Books (Title, ISBN, PublicationYear, Publisher, CopiesAvailable) VALUES
('The Intelligent Investor', '9780060555665', 2006, 'HarperBusiness', 5),
('Rich Dad Poor Dad', '9781612680194', 2011, 'Plata Publishing', 4),
('Think and Grow Rich', '9780449214923', 1987, 'Ballantine Books', 3),
('The Millionaire Next Door', '9780671015206', 1998, 'Pocket Books', 2),
('Your Money or Your Life', '9780143115762', 2008, 'Penguin Books', 3),
('The Richest Man in Babylon', '9780451205360', 2002, 'Signet', 4),
('Unshakeable', '9781501164583', 2017, 'Simon & Schuster', 2),
('Money Master the Game', '9781476757803', 2014, 'Simon & Schuster', 3),
('I Will Teach You to Be Rich', '9780761147480', 2009, 'Workman Publishing', 4),
('Financial Freedom', '9780525540885', 2019, 'Avery', 2);

-- Sample Data: Kenyan Staff
INSERT INTO Staff (FirstName, LastName, Email, Role) VALUES
('Wanjiku', 'Mwangi', 'wanjiku.mwangi@library.co.ke', 'Librarian'),
('Otieno', 'Omondi', 'otieno.omondi@library.co.ke', 'Assistant Librarian'),
('Akinyi', 'Odhiambo', 'akinyi.odhiambo@library.co.ke', 'Library Clerk'),
('Mutiso', 'Muthoni', 'mutiso.muthoni@library.co.ke', 'Library Manager'),
('Kiptoo', 'Cheruiyot', 'kiptoo.cheruiyot@library.co.ke', 'Archivist');
