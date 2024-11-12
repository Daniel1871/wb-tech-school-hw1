WITH get_criteria AS (
  SELECT 
      customer_id, 
      ((shipment_date::TIMESTAMP - order_date::TIMESTAMP) > INTERVAL '5 days') AS is_delay,
      (order_status = 'Cancel') AS is_cancel,
      (
          CASE order_status
              WHEN 'Cancel' THEN order_ammount
              ELSE NULL
          END
      ) AS cancel_amount
  FROM Orders
)
SELECT 
    name,
    SUM(is_delay::INTEGER) delay_num,
    SUM(is_cancel::INTEGER) cancel_num,
    SUM(cancel_amount) AS total_canceled_amount
FROM 
    get_criteria JOIN Customers USING(customer_id)
WHERE
    is_delay OR is_cancel
GROUP BY
    customer_id, name
ORDER BY
    total_canceled_amount DESC NULLS LAST;