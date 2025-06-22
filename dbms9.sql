use 한빛무역;
SELECT 도시, count(*) as 고객수, avg(마일리지) as 평균마일리지 from 고객 where 지역 is null GROUP BY 도시 with ROLLUP;
SELECT ifnull(도시,'총계') as 도시, count(* ) as 고객수, avg(마일리지) as 평균마일리지 from 고객 where 지역 is null GROUP BY 도시 WITH ROLLUP;
SELECT 담당자직위,도시, count(*) as 고객수 from 고객 where 담당자직위 like '%마케팅%' GROUP BY 담당자직위,도시 WITH ROLLUP;
SELECT  count(* ) from 고객 GROUP BY 도시;
SELECT 도시,count(*) 고객수 from 고객 GROUP BY 도시 HAVING 고객수 > 2;
SELECT 담당자직위,도시, count(*) as 고객수 from 고객 GROUP BY 담당자직위,도시 WITH ROLLUP;
SELECT 도시,담당자직위, count(*) as 고객수 from 고객 GROUP BY 도시,담당자직위 WITH ROLLUP;
SELECT * FROM 고객;
SELECT 도시,GROUP_CONCAT(고객회사명) AS 고객회사명목록 FROM 고객 GROUP BY 도시;
SELECT * FROM 주문세부;
SELECT 제품번호,sum(주문수량) AS 주문수량합, sum(단가 * 주문수량) AS 주문금액합 FROM 주문세부 GROUP BY 제품번호;
SELECT 주문번호,GROUP_CONCAT(제품번호) AS 제품번호목록 ,sum(단가 * 주문수량) AS 주문금액합 FROM 주문세부 GROUP BY 주문번호;
SELECT * FROM 주문;
SELECT 고객번호,count(*) AS 주문건수 FROM 주문 WHERE year(주문일) = '2021' GROUP BY 고객번호 ORDER BY count(*) DESC LIMIT 3;
SELECT * FROM 사원;
SELECT 직위,count(*) AS 사원수, GROUP_CONCAT(이름) AS 사원이름목록 FROM 사원 GROUP BY 직위;

SELECT count(도시),count(DISTINCT 도시) from 고객;
SELECT * from 주문;
SELECT year(주문일) as 주문년도, count(*) as 주문건수 from 주문 group by year(주문일);
SELECT year(주문일) as 주문년도, quarter(주문일) as 분기, count(*) as 주문건수 from 주문 group by year(주문일),quarter(주문일) WITH ROLLUP;

SELECT month(주문일) as 주문월, count(*) as 주문건수 from 주문 where 요청일<발송일 GROUP BY month(주문일) ORDER BY month(주문일);

SELECT * from 제품;
SELECT 제품명,sum(재고) as 재고합 from 제품 where 제품명 like '%아이스크림%' GROUP BY 제품명;

SELECT * from 고객;
SELECT if(마일리지 >= 50000,'vip고객','일반고객') as 고객구분,count(*) as 고객수, avg(마일리지) as평균마일리지 from 고객 GROUP BY 고객구분;

