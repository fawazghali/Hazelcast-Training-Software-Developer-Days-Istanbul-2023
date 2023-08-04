CREATE OR REPLACE VIEW orders AS
  SELECT id,
       CASE WHEN userRand BETWEEN 0 AND 0.1 THEN 'Fawaz'
            WHEN userRand BETWEEN 0.1 AND 0.2 THEN 'Jon'
            WHEN userRand BETWEEN 0.2 AND 0.3 THEN 'Mike'
            WHEN userRand BETWEEN 0.3 AND 0.4 THEN 'Mark'
            WHEN userRand BETWEEN 0.4 AND 0.5 THEN 'Dale'
            WHEN userRand BETWEEN 0.5 AND 0.6 THEN 'Martin'
            WHEN userRand BETWEEN 0.6 AND 0.7 THEN 'Chiara'
            WHEN userRand BETWEEN 0.7 AND 0.8 THEN 'Denis'
            ELSE 'Johnson'
       END as customer,
       CASE WHEN userRand BETWEEN 0 and 0.1 then userRand*50+1
            WHEN userRand BETWEEN 0.1 AND 0.2 THEN userRand*75+.6
            WHEN userRand BETWEEN 0.2 AND 0.3 THEN userRand*60+.2
            WHEN userRand BETWEEN 0.3 AND 0.4 THEN userRand*30+.3
            WHEN userRand BETWEEN 0.4 AND 0.5 THEN userRand*43+.7
            WHEN userRand BETWEEN 0.5 AND 0.6 THEN userRand*100+.4
            WHEN userRand BETWEEN 0.6 AND 0.7 THEN userRand*25+.8
            WHEN userRand BETWEEN 0.6 AND 0.7 THEN userRand*80+.5
            WHEN userRand BETWEEN 0.7 AND 0.8 THEN userRand*10+.1
            ELSE userRand*100+4
       END as price,
       order_ts,
       amount
FROM
    (SELECT v as id,
           RAND(v*v) as userRand,
           TO_TIMESTAMP_TZ(v*10 + 1645484400000) as order_ts,
           ROUND(RAND()*100, 0) as amount
     FROM TABLE(generate_stream(100)));
