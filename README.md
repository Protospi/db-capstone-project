
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

## Project Steps

Follow these steps to complete the Little Lemon Restaurant Database Schema and Entity Relationship Modeling project:

1. Set up a Git repository to manage the project code and track changes.
2. Design the database schema for the Little Lemon restaurant, considering tables, relationships, and attributes.
3. Create the necessary SQL statements to create the database and tables in MySQL.
4. Implement the database schema by executing the SQL statements in MySQL.
5. Develop a Python application to communicate with the MySQL database.
6. Write code to handle user input and update the database based on bookings and guest visits.
7. Test the Python application to ensure it correctly interacts with the database.
8. Explore the data using Tableau to extract meaningful information and generate visualizations.
9. Analyze the data in Tableau and identify patterns or trends relevant to the restaurant's operations.
10. Document the project, including the schema, SQL statements, Python code, and Tableau visualizations.
11. Update the Git repository with all project files and changes made during the development process.
12. Collaborate with others by sharing the Git repository and allowing them to review and contribute to the code.

## Entity-Relationship Diagram (ERD) Analysis

The revised database schema represents the Little Lemon restaurant database and adheres to the principles of the third normal form (3NF). Let's analyze the relationships between the tables and their compliance with the 3NF:

**Bookings table:**
- **Primary Key:** booking_id (Uniquely identifies each booking).
- **Attributes:** date, slot_hours, table_number (Functionally dependent on the booking_id, 1NF).
- **Foreign Key:** customer_id (References the primary key of the Customers table, ensuring referential integrity, 2NF).
- **Relation Type:** One-to-many (One booking can have only one customer, but one customer can have multiple bookings).

**Orders table:**
- **Primary Key:** order_id (Uniquely identifies each order).
- **Attributes:** order_date, total_cost (Functionally dependent on the order_id, 1NF).
- **Foreign Keys:** staff_id (References the primary key of the Staff table, ensuring referential integrity, 2NF), customer_id (References the primary key of the Customers table, ensuring referential integrity, 2NF), order_delivery_id (References the primary key of the Orders Delivery table, ensuring referential integrity, 2NF).
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

## Entity Relation Diagram

![Image Description](https://github.com/Protospi/db-capstone-project/blob/d1005371c592f238330e37f90ac84584f0724eee/ERD.png)


## Database Procedures and Prepared Statement:

1. **Stored Procedure: CancelOrder**
   - **Description**: The `CancelOrder` stored procedure allows the user to cancel an order by providing the order ID. If the order exists, it deletes the order record from the `Orders` table and the related records from the `orders_menu` table (assuming it's a foreign key referencing the `Orders` table). If the order ID does not exist, it returns a message indicating that the order was not found.

2. **Prepared Statement: GetOrderDetail**
   - **Description:** The `GetOrderDetail` prepared statement retrieves the `OrderID`, `Quantity`, and `OrderCost` from the `Orders` table, linked with the `orders_menu` table using the `OrderID`. It accepts one input argument, the `CustomerID`, and returns the order details for the specified customer.

3. **Stored Procedure: GetMaxQuantity**
   - **Description:** The `GetMaxQuantity` stored procedure retrieves the order ID and the maximum quantity for each order from the `orders_menu` table. It groups the results by `order_id`.

4. **View: orders_view**
   - Description:** The `orders_view` view contains all records from the `Orders` table where the `order_id` exists in the `orders_menu` table and the `quantity` is greater than or equal to 2.

5. **View: best_customers**
   - Description: The `best_customers` view provides information about the best customers based on their total order cost. It joins records from the `Customers`, `Orders`, `orders_menu`, `menu_items`, and `cuisines` tables to retrieve details about customers who have a total cost greater than 150.

6. **View: best_items**
   - Description: The `best_items` view lists the best-selling items based on the quantity sold. It joins records from the `menu_items` and `cuisines` tables and selects only the items with a quantity greater than 2.

These database procedures and views enhance the functionality and analytical capabilities of the database, allowing Little Lemon to manage orders efficiently, retrieve order details for specific customers, and obtain valuable insights about customers and popular items.