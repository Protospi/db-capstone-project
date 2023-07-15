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
