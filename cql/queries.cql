-- Query 1
SELECT SERVICE_NODE_ID
FROM cdr
WHERE mobile_id_type in (1,2,3,4) AND city_id > 1 AND city_id < 5
limit 100;

-- Query 2
select count(SEQ_NUM)
from cdr
where mobile_id_type = 1 and city_id =5 and month_day = 14 and msc_code > 1 and msc_code < 1500
limit 100;

-- Query 3
select seq_num
from cdr
where MOBILE_ID_TYPE in (1,3,4,5) AND (CITY_ID, MONTH_DAY, MSC_CODE, SERVICE_NODE_ID, SEQ_NUM) > (1,2,10,5,100) AND (CITY_ID, MONTH_DAY, MSC_CODE, SERVICE_NODE_ID, SEQ_NUM) < (7,20,50,9,400)
limit 100

-- Query 4
select group_and_count(city_id) from cdr where mobile_id_type = 1 and city_id < 3 limit 400;

-- Query 5
SELECT  group_and_count(MONTH_DAY) from cdr where mobile_id_type = 2 AND (CITY_ID, MONTH_DAY, MSC_CODE, SERVICE_NODE_ID, SEQ_NUM) >= (1,1,30,7,100) AND (CITY_ID, MONTH_DAY, MSC_CODE, SERVICE_NODE_ID, SEQ_NUM) <= (1,31,50,9,200);
