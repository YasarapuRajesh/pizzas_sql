
# Pizza Sales Database

## Overview

This project is a Pizza Sales Database created using MySQL. It is designed to manage and track pizza sales, with tables that store information about pizzas, their types, customer orders, and detailed order information.

## Database Structure

The database consists of the following tables:

1. **Pizzas**
   - Stores information about the various pizzas offered.
   - Columns: `pizza_id`, `pizza_name`, `pizza_type_id`, `price`.

2. **Pizza_Types**
   - Contains different types of pizzas (e.g., vegetarian, non-vegetarian, vegan).
   - Columns: `pizza_type_id`, `name`, `category` , `ingredients' .

3. **Orders**
   - Records each customer order.
   - Columns: `order_id`, `date`, `time`.

4. **Order_Details**
   - Provides detailed information about the pizzas in each order.
   - Columns: `order_detail_id`, `order_id`, `pizza_id`, `quantity`.

## Installation and Setup

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/yourusername/pizza-sales-database.git
   cd pizza-sales-database
   ```

2. **Create the Database:**
   - Run the SQL script provided in the `database.sql` file to create the database and tables.

   ```sql
   mysql -u username -p < database.sql
   ```

3. **Populate the Database:**
   - You can use the provided `insert_data.sql` script to populate the tables with sample data.

   ```sql
   mysql -u username -p < insert_data.sql
   ```

4. **Connect to the Database:**
   - Use your preferred MySQL client to connect to the database and start querying.

## Usage

- **Retrieve all pizzas:**
  ```sql
  SELECT * FROM pizzas;
  ```

- **View all orders:**
  ```sql
  SELECT * FROM orders;
  ```

- **Get details of a specific order:**
  ```sql
  SELECT * FROM order_details WHERE order_id = 1;
  ```
  
## Contact

For any questions or issues, please reach out to (mailto:rajurajesh10121@gmail.com).
