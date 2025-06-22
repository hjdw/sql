show TABLES;
SELECT * FROM 고객;

SELECT concat(도시,' ', 주소) AS 주소 FROM 고객;
SELECT concat_ws(' ',도시, 주소) AS 주소 FROM 고객;
SELECT concat_ws(' ',도시, 주소,담당자명) AS 주소 FROM 고객;
SELECT left(담당자명,1) AS 성 FROM 고객;

SELECT right(전화번호,4) FROM 고객;
SELECT replace(전화번호,'-','.') FROM 고객;

SELECT ceiling(123.56),floor(123.56),round(123.56),round(123.56,1),truncate(123.56,1);

SELECT abs(-120), abs(120),sign(-120),sign(120);

SELECT mod(203,4),203 % 4, 203 MOD 4;

SELECT now(),sysdate(),curdate(),curtime();

SELECT now(),
datediff('2025-12-20',NOW()),
datediff(NOW(),'2025-12-20'),
timestampdiff(YEAR,NOW(),'2025-12-20'),
TIMESTAMPDIFF(MONTH,NOW(),'2025-12-20'),
timestampdiff(DAY,NOW(),'2025-12-20');

SELECT now(),
adddate(now(),50),
adddate(now(),interval 50 DAY),
adddate(now(),interval 50 MONTH),
adddate(now(),interval 50 HOUR);

SELECT sum(마일리지) AS 마일리지합 FROM 고객;

SELECT 도시,count(*) AS 고객수, avg(마일리지) AS 평균마일리지 FROM 고객 GROUP BY 도시;

SELECT 도시,count(*) AS 고객수, avg(마일리지) AS 평균마일리지 FROM 고객 GROUP BY 1;

SELECT 도시,count(*) AS 고객수, avg(마일리지) AS 평균마일리지 FROM 고객 
GROUP BY 도시 HAVING count(*) >=10; /* HAVING 조건절은 무조건 GROUP BY 뒤*/

SELECT 도시,sum(마일리지) FROM 고객 WHERE 고객번호 LIKE 'T%' GROUP BY 도시 HAVING sum(마일리지) >= 1000;

SELECT 도시,count(*),avg(마일리지) 
FROM 고객 WHERE 지역 IS NULL GROUP BY 도시 WITH ROLLUP; /* ROLLUP에는 GROUP BY 필수!*/

SELECT ifnull(도시,'총계') AS 도시,count(*) AS 고객수, avg(마일리지) AS 평균마일리지 FROM 고객
WHERE 지역 IS NULL GROUP BY 도시 WITH ROLLUP; /* 시험 이런식으로 */

SELECT 담당자직위,도시,count(*) AS 고객수 FROM 고객 WHERE 담당자직위 LIKE '%마케팅%' GROUP BY 담당자직위,도시 WITH ROLLUP;

SELECT 지역,count(*) AS 고객수 FROM 고객 WHERE 담당자직위 = '대표 이사'
GROUP BY 지역 WITH ROLLUP;

SELECT 지역,count(*) AS 고객수, GROUPING(지역) AS 구분 FROM 고객 WHERE 담당자직위 = '대표 이사'
GROUP BY 지역 WITH ROLLUP;

SELECT GROUP_CONCAT(이름) FROM 사원;

SELECT 도시, GROUP_CONCAT(고객회사명) AS 고객회사명목록 FROM 고객 GROUP BY 도시; 


/* ANSI , NON-ANSI SQL 조인 방식 강조*/
