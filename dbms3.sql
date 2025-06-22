use 한빛무역;
show databases;
show TABLES;

SELECT * from 고객;
SELECT * from 고객 where 도시 ='서울특별시' ORDER BY 담당자명;
SELECT * from 고객 where 도시 <>'서울특별시' ORDER BY 담당자명;

SELECT * from 고객 where 도시 in('광명시','구리시');

SELECT count(DISTINCT 도시) FROM 고객;
SELECT count(DISTINCT 담당자직위) FROM 고객;

SELECT * from 고객 WHERE 도시 = '서울특별시' and	담당자직위 = '영업 과장';

SELECT * FROM 고객 where 도시 = '서울특별시' and 담당자명 like '김%' ORDER BY 담당자명;

SELECT char_length('HELLO'),length('HELLO'),char_length('안녕'),length('안녕');

SELECT concat('DREAMS','COME', 'TRUE'),concat_ws('-','2023','01','29');

SELECT concat(도시,주소) FROM 고객;
SELECT concat_ws(' ',도시,주소,담당자명) AS 이름 FROM 고객;

SELECT left('SQL 완전정복',3)
			,right('SQL 완전정복',4),substr('SQL 완전정복',2,5),substr('SQL 완전정복',2);
          
SELECT  count( DISTINCT LEFT( 담당자명, 1)) FROM 고객;
SELECT count(DISTINCT LEFT( 담당자명, 1)) FROM 고객;

SELECT substring_index(전화번호,'-',-1) FROM 고객;  /*오른쪽부터 첫 번째 - 이후 제거*/
SELECT substring_index(담당자직위,' ',-1) FROM 고객; /*오른쪽부터 첫 번째 - 이후 제거    양수면 왼쪽부터*/
SELECT DISTINCT substring_index(담당자직위,' ',-1) FROM 고객;

SELECT lpad('SQL',10,'#'), rpad('SQL',5,'*');

SELECT length(LTRIM(' SQL ')),length(RTRIM(' SQL ')),length(TRIM('  SQL  '));

SELECT trim(BOTH 'abc' from 'abcSQLabcabc'),trim(leading 'abc' from 'abcSQLabcabc'),
trim(trailing 'abc' from 'abcSQLabcabc');

SELECT field('JAVA', 'SQL', 'JAVA', 'C'),find_in_set('JAVA','SQL,JAVA,C'),instr(' 네 인생을 살아라','인생'),locate('인생','네 인생을 살아라');

SELECT elt(2,'SQL','JAVA','C');

SELECT repeat('상지대 만세 ',10) AS 상지대;
SELECT repeat('상지대 만세 ',10)  상지대;

SELECT reverse(담당자명) FROM 고객;

SELECT ceiling(123.56),floor(123.56),round(123.56),round(123.56,1),truncate(123.56, 1); /* 바닥 과 천장 => CEILING FLOOR 셀링은 무조건 올림, FLOOR은 무조건 내림*/

SELECT abs(-120),abs(120),sign(-120),sign(120);

SELECT mod(203,4),203 % 4, 203 MOD 4;

SELECT power(2,3), sqrt(16), rand(), rand(100), round(RAND() * 100);

SELECT now(),sysdate(),curdate(),curtime();

SELECT now(),year(now()),quarter(now()),month(now()),day(now()),hour(now()),minute(now()), second(now());

SELECT now(), datediff('2025-12-20', NOW()),datediff(NOW(),'2025-12-20'), timestampdiff(YEAR,NOW(), '2025-12-20'),timestampdiff(MONTH,NOW(),'2025-12-20'),
					timestampdiff(DAY,NOW(),'2025-12-20');
                    
SELECT datediff('2001-08-30',NOW()) * -1;

SELECT now(), adddate(NOW(), 50), adddate(NOW(), interval 50 DAY), adddate(now(), interval 50 month),subdate(now(),interval 50 HOUR);

SELECT adddate(now(), 1000);

SELECT now(), last_day(now()), dayofyear(now()), monthname(now()),weekday(now());

SELECT cast('1' as unsigned), cast(2 as char(1)), convert('1', unsigned), convert(2,char(1));

select if(12500 * 450 > 5000000, '초과달성','미달성');

SELECT if(마일리지 >= 1000, '합격','불합격') from 고객;

SELECT ifnull(1,0), ifnull(null, 0), ifnull( 1/0, 'ok');

SELECT nullif(12 * 10, 120), nullif(12*10,1200);

SELECT case when 12500 * 450 > 5000000 then '초과달성'
			when 2500 * 450 > 4000000 then '달성'
			else '미달성'
		end;
        
SELECT case when 마일리지 >= 10000 then '초과달성'
			 when 마일리지 >= 1000 then '달성'
			else '미달성'            
		end as 달성여부 
        from 고객;
        
SELECT count(*) from 고객;
SELECT  sum(마일리지), avg(마일리지), min(마일리지), max(마일리지) from 고객  where 도시 <> '서울특별시'; 

SELECT 도시,count(*) as 고객수, avg(마일리지) as 평균망일리지 FROM 고객 GROUP BY 도시;
SELECT 도시,count(*) as 고객수, avg(마일리지) as 평균망일리지 FROM 고객 GROUP BY 1;

SELECT 담당자직위,도시,count(*) as 고객수, avg(마일리지) as 평균망일리지 FROM 고객 GROUP BY 담당자직위,도시 ORDER BY 담당자직위,도시;

SELECT 도시,count(*) as 고객수, avg(마일리지) as 평균망일리지 FROM 고객 GROUP BY 도시 HAVING count(*) >= 10;

SELECT 도시,sum(마일리지) FROM 고객 where 고객번호 like 'T%' GROUP BY 도시 HAVING sum(마일리지) >= 1000;

SELECT 도시, count(*) AS 고객수,avg(마일리지) AS 평균마일리지 FROM 고객 WHERE 지역 IS NULL GROUP BY 도시 WITH ROLLUP;

SELECT 도시, count(*) AS 고객수,avg(마일리지) AS 평균마일리지 FROM 고객 GROUP BY 도시 WITH ROLLUP;

SELECT 담당자직위,도시,count(*) 고객수 FROM 고객 WHERE 담당자직위 LIKE '%마케팅%' GROUP BY 담당자직위,도시 WITH ROLLUP;

SELECT 지역,count(*) AS 고객수 FROM 고객 WHERE 담당자직위 = '대표 이사' GROUP BY 지역 WITH ROLLUP;

SELECT 부서.부서번호,부서명,이름,사원.부서번호 from 부서 CROSS join 사원 where 이름 = '배재용';
select 부서.부서번호,부서명,이름,사원.부서번호 from 부서,사원 where 이름 = '배재용';

SELECT 사원번호,직위,사원.부서번호,부서명 from 부서 inner join 사원 on 사원.부서번호 = 부서.부서번호 where 이름 = '이소미';
/* inner join 은 from 테이블1 inner join 테이블2 테이블 순서가 바뀌어도 결과는 같다*/
select 사원번호,직위,사원.부서번호,부서명 from 부서,사원 where 사원.부서번호 = 부서.부서번호 and 이름 = '이소미';

SELECT * from 고객;
SELECT 고객.고객번호,고객.담당자명,고객.고객회사명,count(*) as 주문건수 from 고객 inner join 주문 on 고객.고객번호 = 주문.고객번호
GROUP BY 고객.고객번호,담당자명,고객회사명 ORDER BY 주문건수 desc;

SELECT 고객.고객번호,담당자명,고객회사명,count(*) as 주문건수 from 고객,주문 where 고객.고객번호 = 주문.고객번호 
GROUP BY 고객.고객번호,담당자명,고객회사명 order by 주문건수 desc;
SELECT * from 제품;
SELECT 고객.고객번호,담당자명,고객회사명,sum(주문세부.주문수량 * 주문세부.단가) as 주문금액합
from 고객 INNER JOIN 주문 on 고객.고객번호 = 주문.고객번호 INNER join 주문세부 on 주문.주문번호 = 주문세부.주문번호
GROUP BY 고객번호,담당자명,고객회사명 order by 주문금액합 desc;

SELECT 고객.고객번호,담당자명,고객회사명,sum(주문세부.주문수량 * 주문세부.단가) as 주문금액합 FROM 고객,주문,주문세부
where 고객.고객번호 = 주문.고객번호 and 주문.주문번호 = 주문세부.주문번호 GROUP BY 고객번호,담당자명,고객회사명 ORDER BY 주문금액합 desc;

SELECT * from 마일리지등급;
SELECT 고객번호,담당자명,마일리지,마일리지등급.* from 고객 cross join 마일리지등급  where 담당자명 = '이은광';
SELECT 고객번호,담당자명,마일리지,등급.* from 고객 cross join 마일리지등급 as 등급  where 담당자명 = '이은광';
SELECT 고객번호,담당자명,마일리지,마일리지등급.* from 고객,마일리지등급 where 담당자명='이은광';

SELECT 고객번호,고객회사명,담당자명,마일리지,등급명 from 고객 INNER join 마일리지등급 
on 마일리지 BETWEEN 하한마일리지 and 상한마일리지 where 담당자명 = '이은광';

SELECT 고객번호,고객회사명,담당자명,마일리지,등급명 from 고객 INNER join 마일리지등급
on 마일리지 >= 하한마일리지 and 마일리지 <= 상한마일리지 where 담당자명 = '이은광';

SELECT 고객번호,고객회사명,담당자명,마일리지,등급명 from 고객,마일리지등급 where 마일리지 >= 하한마일리지 and 마일리지 <= 상한마일리지 and 담당자명 = '이은광';

SELECT 사원번호,이름,부서명 from 사원 LEFT OUTER join 부서 on 사원.부서번호 = 부서.부서번호 where 성별 = '여';
