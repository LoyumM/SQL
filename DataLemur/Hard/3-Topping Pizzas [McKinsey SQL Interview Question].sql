WITH
    all_details
    AS

    (
        SELECT
            a.topping_name AS first_topping,
            b.topping_name AS second_topping,
            c.topping_name AS third_topping,
            a.ingredient_cost AS first_cost,
            b.ingredient_cost AS second_cost,
            c.ingredient_cost AS third_cost
        FROM pizza_toppings AS a
        CROSS JOIN
            pizza_toppings AS b,
            pizza_toppings AS c
        WHERE a.topping_name < b.topping_name
            AND b.topping_name < c.topping_name
    )

SELECT
    CONCAT(first_topping,',',second_topping,',',third_topping) AS pizza,
    (first_cost + second_cost + third_cost) AS total_cost
FROM all_details
ORDER BY 2 DESC, 1;
  

