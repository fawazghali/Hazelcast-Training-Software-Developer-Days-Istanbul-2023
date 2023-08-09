CREATE OR REPLACE VIEW orders_ordered AS
SELECT *
  FROM TABLE(IMPOSE_ORDER(
  TABLE orders,
  DESCRIPTOR(order_ts),
  INTERVAL '0.5' SECONDS));
  
CREATE OR REPLACE VIEW high_low AS
     SELECT
          window_start,
          window_end,
          customer,
          ROUND(MAX(price),2) AS high,
          ROUND(MIN(price),2) AS low
     FROM TABLE(TUMBLE(
          TABLE orders_ordered,
          DESCRIPTOR(order_ts),
          INTERVAL '5' SECONDS
     ))
     GROUP BY 1,2,3;
