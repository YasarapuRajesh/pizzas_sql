-- Calculate the percentage contribution of each pizza type to total revenue.

SELECT 
    pizza_types.category,
    round((SUM(order_details.quantity * pizzas.price) / (SELECT 
            ROUND(SUM(o.quantity * p.price), 2) AS total_revenue
        FROM
            order_details o
                NATURAL JOIN
            pizzas p)) * 100,2) AS revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY revenue DESC;

-- Analyze the cumulative revenue generated over time.

select 
	date, 
    sum(revenue) over(order by date) as cum_revenue
from
(SELECT 
    orders.date,
    SUM(order_details.quantity * pizzas.price) AS revenue
FROM
    order_details
        JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id
        JOIN
    orders ON orders.order_id = order_details.order_id
GROUP BY orders.date) as sales;
-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.

select 
	name , revenue
from
(select 
	category , name , revenue , 
	rank() over(partition by category order by revenue desc) as rn
from 
(SELECT 
    pizza_types.category,
    pizza_types.name,
    SUM(order_details.quantity * pizzas.price) AS revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category , pizza_types.name) as a) as b
where rn <=3;