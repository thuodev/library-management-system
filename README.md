
Overview
--------
This project provides a SQL schema for a Library Management System. It defines the structure for managing books, authors, categories, members, staff, and loans in a library database.

Features
--------
- Authors, Books, and Categories management
- Many-to-many relationships for Books-Authors and Books-Categories
- Member and Staff records
- Book Loans tracking
- Sample data for books and Kenyan staff

How to Use
----------
1. Open your SQL client (e.g., MySQL Workbench).
2. Run the script `library .sql` to create the database and tables.
3. The script will also insert sample data for books and staff.

Tables
------
- Authors: Stores author details.
- Categories: Stores book categories.
- Books: Stores book information.
- BookAuthors: Links books and authors (many-to-many).
- BookCategories: Links books and categories (many-to-many).
- Members: Stores library member details.
- Staff: Stores staff details.
- Loans: Tracks book loans to members.

Customization
-------------
- Add more sample data as needed.
- Extend tables to include additional fields (e.g., book cover images, member status).
- Implement triggers or stored procedures for advanced features.

License
-------
This project is provided for educational purposes.
