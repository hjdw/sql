use 한빛무역;
show databases;
SELECT count(*),count(고객번호),count(도시),count(지역) from 고객;

SELECT sum(마일리지),avg(마일리지),min(마일리지),max(마일리지) from 고객;

SELECT sum(마일리지),avg(마일리지),min(마일리지),max(마일리지) from 고객 where 도시 = '서울특별시';

select 도시, count(*) as 고객수, avg(마일리지) as 평균마일리지 from	고객 GROUP BY 도시;

SELECT 도시, count(*) as 고객수, avg(마일리지) as 평균마일리지 from 고객 GROUP BY 도시 HAVING count(*) >=10;

SELECT 도시, sum(마일리지) from 고객 where 고객번호 LIKE 'T%' GROUP BY 도시 HAVING sum(마일리지) >= 1000;

SELECT 도시, count(*) as 고객수, avg(마일리지) as 평균마일리지 from	고객 where 지역 is null GROUP BY 도시 WITH ROLLUP;

SELECT 담당자직위,도시,count(*) as 고객수 from 고객 WHERE 담당자직위 LIKE'%마케팅%' group BY 담당자직위,도시 WITH ROLLUP;

SELECT 지역,count(*) as 고객수 FROM 고객 where 담당자직위 ='대표 이사' GROUP BY 지역 WITH ROLLUP;

SELECT group_concat(이름) from 사원;

SELECT group_concat(DISTINCT 지역) from 고객;

SELECT group_concat(고객회사명) as 고객회사명목록 from 고객 GROUP BY 도시;

SELECT count(도시),count(DISTINCT 도시) from 고객;

SELECT * from 주문;

SELECT year(주문일) as 주문년도, count(*) as 주문건수 from 주문 GROUP BY 주문일;

SELECT year(주문일) as 주문년도, quarter(주문일) as 분기, count(*) as 주문건수 from 주문
 GROUP BY year(주문일), quarter(주문일) with ROLLUP;
 
 SELECT month(주문일) as 주문월,count(*) as 주문건수 from 주문 where 발송일 > 요청일 GROUP BY month(주문일) ORDER BY month(주문일);
 
 SELECT * from 제품;
 
 SELECT 제품명, sum(재고) as 재고합 from 제품 where 제품명 LIKE '%아이스크림%' GROUP BY 제품명;
 
 SELECT if(마일리지 >= 50000, 'VIP고객','일반고객') AS 고객구분, count(*) as 고객수, avg(마일리지) AS 평균마일리지
 from 고객 GROUP BY if(마일리지 >= 50000,'VIP고객','일반고객');
 
 SELECT * FROM 주문세부;
 SELECT sum(주문수량) AS 주문수량합, (단가 * 주문수량) AS 주문금액합 FROM 주문세부 GROUP BY 제품번호;