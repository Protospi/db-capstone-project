# Meta Capstone Project: Little Lemon Restaurant Database Schema and Entity Relationship Modeling

Welcome to the readme file for the Meta Capstone Project, focused on building the Little Lemon restaurant database schema and entity relationship modeling. This document provides an overview of the project and the systems used, as well as the steps to complete the project.

## Systems Used

The following systems are utilized in the project:

1. **Git**: Version control system for tracking changes and enabling collaboration.
   - Download Git from: [https://git-scm.com/downloads](https://git-scm.com/downloads)
   - Refer to subsequent readings for installation and usage instructions.

2. **MySQL**: Database management system for storing and accessing information.
   - MySQL Workbench, command-line interface, or application clients can be used.
   - Download MySQL from: [https://dev.mysql.com/downloads/](https://dev.mysql.com/downloads/)

3. **Python**: Programming language used for communicating with the database.
   - Python is the preferred method for interacting with the MySQL database.
   - Download Python from: [https://www.python.org/downloads/](https://www.python.org/downloads/)

4. **Tableau**: Business intelligence tool for analyzing and visualizing data.
   - Tableau is used for extracting and displaying meaningful information.
   - Visit [https://www.tableau.com/](https://www.tableau.com/) for more information.

## Scenario

Little Lemon needs to build a robust relational database system in MySQL in which they can store large amounts of data. They then need to easily manage and find this data as required. This database system should maintain information about the following aspects of the business:  

- Bookings.
- Orders.
- Order delivery status.
- Menu.
- Customer details.
- Staff information.

## Project Steps

Follow these steps to complete the Little Lemon Restaurant Database Schema and Entity Relationship Modeling project:

1. **Repository Setup**:
   - Set up a repository or local directory to house your code.
   - Initialize Git in the project directory using the `git init` command.

2. **Record Changes**:
   - Use Git to track and record all modifications made to the project.
   - Add changes to the staging area using `git add <file>` or `git add .` (for all files).
   - Commit changes with a descriptive message using `git commit -m "Commit message"`.

3. **Collaboration**:
   - Share the Git repository with others involved in the project.
   - Allow others to view, review, and contribute to the code by providing appropriate access permissions.

4. **Design the Database Schema**:
   - Create a normalized ER diagram adhering to 1NF, 2NF, and 3NF.
   - Identify entities, attributes, primary keys, and foreign keys.
   - Define data types and constraints.

5. **Implement the Data Model**:
   - Use MySQL Workbench's forward engineer method to implement the Little Lemon data model in the MySQL server.
   - Name the database as "LittleLemonDB".
   - Export the LittleLemonDB as a single contained SQL file and save it in the "db-capstone-project" folder.

6. **Show Databases in MySQL Server**:
   - Write SQL code inside MySQL Workbench SQL editor to show all databases in the MySQL server.
   - Check if the Little Lemon database ("LittleLemonDB") is included in the list.

7. **Develop a Python Application**:
   - Develop a Python application that communicates with the MySQL database.
   - Write code to handle user input and update the database based on bookings and guest visits.
   - Test the Python application to ensure it correctly interacts with the database.

8. **Explore Data using Tableau**:
   - Extract meaningful information from the database using Tableau.
   - Generate visualizations and analyze the data for patterns or trends relevant to the restaurant's operations.

9. **Documentation and Collaboration**:
   - Document the project, including the schema, SQL statements, Python code, and Tableau visualizations.
   - Update the Git repository with all project files and changes made during the development process.
   - Collaborate with others by sharing the Git repository and allowing them to review and contribute to the code.


Sure! Here is the revised Readme.md text that explains the relationships between the tables and how they conform to the third normal form (3NF):

## Entity-Relationship Diagram (ERD) Analysis

The revised database schema represents the Little Lemon restaurant database and adheres to the principles of the third normal form (3NF). Let's analyze the relationships between the tables and their compliance with the 3NF:

**Bookings table:**
- **Primary Key:** booking_id (Uniquely identifies each booking).
- **Attributes:** date, slot_hours, table_number (Functionally dependent on the booking_id, 1NF).
- **Foreign Key:** customer_id (References the primary key of the Customer Details table, ensuring referential integrity, 2NF).
- **Relation Type:** One-to-many (One booking can have only one customer, but one customer can have multiple bookings).

**Orders table:**
- **Primary Key:** order_id (Uniquely identifies each order).
- **Attributes:** order_date, total_cost (Functionally dependent on the order_id, 1NF).
- **Foreign Keys:** staff_id (References the primary key of the Staff Information table, ensuring referential integrity, 2NF), customer_id (References the primary key of the Customers table, ensuring referential integrity, 2NF), order_delivery_id (References the primary key of the Orders Delivery table, ensuring referential integrity, 2NF).
- **Relation Type:** One-to-many (One order can be associated with only one staff member, one customer, and one order delivery status, but one staff member, one customer, and one order delivery status can be associated with multiple orders).

**Order Delivery Status table:**
- **Primary Key:** order_delivery_id (Uniquely identifies each order delivery status).
- **Attributes:** delivery_date, status (Functionally dependent on the order_delivery_id, 1NF).
- **Relation Type:** One-to-one (One order delivery status corresponds to one order).

**Menu Items table:**
- **Primary Key:** menu_item_id (Uniquely identifies each menu item).
- **Attributes:** item_name, price, cuisine_id, item_type_id (Functionally dependent on the menu_item_id, 1NF).
- **Foreign Keys:** cuisine_id (References the primary key of the Cuisines table, ensuring referential integrity, 2NF), item_type_id (References the primary key of the Items Type table, ensuring referential integrity, 2NF).
- **Relation Type:** One-to-many (One menu item can be associated with only one cuisine and one item type, but one cuisine and one item type can be associated with multiple menu items).

**Customers table:**
- **Primary Key:** customer_id (Uniquely identifies each customer).
- **Attributes:** customer_name, telefone, email (Functionally dependent on the customer_id, 1NF).
- **Relation Type:** One-to-many (One customer can have multiple bookings and orders, but one booking and one order can have only one customer).

**Staff Information table:**
- **Primary Key:** staff_id (Uniquely identifies each staff member).
- **Attributes:** role, salary (Functionally dependent on the staff_id, 1NF).
- **Relation Type:** One-to-many (One staff member can be associated with multiple orders, but one order can be associated with only one staff member).

**Cuisines table:**
- **Primary Key:** cuisine_id (Uniquely identifies each cuisine).
- **Attributes:** cuisine_name (Functionally dependent on the cuisine_id, 1NF).
- **Relation Type:** One-to-many (One cuisine can have multiple menu items, but one menu item can be associated with only one cuisine).

**Items Type table:**
- **Primary Key:** item_type_id (Uniquely identifies each item type).
- **Attributes:** item_type_name (Functionally dependent on the item_type_id, 1NF).
- **Relation Type:** One-to-many (One item type can have multiple menu items, but one menu item can be associated with only one item type).

The revised ERD complies with the third normal form (3NF) by ensuring data integrity, eliminating data redundancy, and representing the relationships between the entities in the Little Lemon restaurant database efficiently.