SELECT 이름,부서.부서번호,사원.부서번호,부서명 from 부서 cross join 사원 where 이름 = '배재용';
SELECT 이름,부서.부서번호,사원.부서번호,부서명 from 부서,사원 where 이름 = '배재용';

select 사원번호,직위,사원.부서번호,부서명 from 사원 inner join 부서 on 사원.부서번호 = 부서.부서번호 where 이름 = '이소미';
select 사원번호,직위,사원.부서번호,부서명 from 사원,부서 where 사원.부서번호 = 부서.부서번호 and 이름 = '이소미';

SELECT 고객.고객번호,담당자명,고객회사명,count(*) as 주문건수 from 고객 inner join 주문 on 고객.고객번호 = 주문.고객번호 
GROUP BY 고객.고객번호,담당자명,고객회사명 ORDER BY count(*) DESC;

SELECT 고객.고객번호,담당자명,고객회사명, count(*) as 주문건수 from 고객,주문 where 고객.고객번호 = 주문.고객번호 GROUP BY 고객.고객번호,담당자명,고객회사명 ORDER BY count(*) DESC;
SELECT * from 주문세부;

SELECT 고객.고객번호,담당자명,고객회사명, sum(단가 *주문수량) as 주문금액 from 고객 
inner join 주문 on 고객.고객번호 = 주문.고객번호 inner join 주문세부 on 주문.주문번호 = 주문세부.주문번호
group by 고객.고객번호,담당자명,고객회사명 order by 4 desc; /*order by 4 => 4번째 컬럼 기준으로 정렬!*/

SELECT 고객.고객번호,담당자명,고객회사명, sum(단가*주문수량) as 주문금액 from 고객,주문,주문세부
where 고객.고객번호 = 주문.고객번호 and 주문.주문번호 = 주문세부.주문번호 GROUP BY 고객.고객번호,담당자명,고객회사명 ORDER BY 4 desc;

select * from 마일리지등급;

SELECT 고객.고객번호,담당자명,마일리지,등급.* from 고객 cross JOIN 마일리지등급 as 등급 where 담당자명 = '이은광';
SELECT 고객.고객번호,담당자명,마일리지,등급.* from 고객, 마일리지등급 as 등급 where 담당자명 = '이은광';

SELECT 고객.고객번호,고객회사명,담당자명,마일리지,등급명 from 고객 
inner join 마일리지등급 on 마일리지 >= 하한마일리지 and 마일리지 <= 상한마일리지 where 담당자명 = '이은광';

SELECT 고객.고객번호,고객회사명,담당자명,마일리지,등급명 from 고객,마일리지등급 where 마일리지 BETWEEN 하한마일리지 AND 상한마일리지 
and 담당자명 = '이은광';
SELECT * from 사원;
SELECT * from 부서;
SELECT 사원번호,이름,부서명 from 사원 LEFT OUTER join 부서 on 사원.부서번호 = 부서.부서번호 where 성별 = '여';

SELECT 부서명,사원.* from 사원 RIGHT outer join 부서 on 사원.부서번호 = 부서.부서번호;

SELECT 부서명,사원.* from 사원 right outer join 부서 on 사원.부서번호 = 부서.부서번호
where 사원.부서번호 is null;

select 이름,부서.* from 사원 LEFT outer join 부서 on 사원.부서번호 = 부서.부서번호
where 부서.부서번호 is null;

select 사원.사원번호,사원.이름, 상사.사원번호 as '상사의 사원번호',상사.이름 as '상사의 이름' from 사원
inner join 사원 as 상사 on 사원.상사번호 = 상사.사원번호;

SELECT 사원.사원번호,사원.이름,상사.사원번호 as '상사의 사원번호',상사.이름 as '상사의 이름' from 사원,사원 as 상사 where 사원.상사번호 = 상사.사원번호;
SELECT * from 사원;
SELECT 사원.이름 as 이름 ,사원.직위, 상사.이름 as '상사이름' from 사원
 as 상사 right outer join 사원 on 사원.상사번호 = 상사.사원번호 order by 상사이름;
 select * from 주문;
 select * from 마일리지등급;
 SELECT * from 고객;
 SELECT 등급명,count(*) as 고객수 from 고객 INNER join 마일리지등급 on 마일리지 >= 하한마일리지 and 마일리지 <= 상한마일리지 group by 등급명;
 
 select  * from 고객 inner join 주문 on 주문.고객번호 = 고객.고객번호 where 주문번호 = 'H0249';
 
 SELECT * from 고객 inner join 주문 on 주문.고객번호 = 고객.고객번호 where 주문일 = '2020-04-09';
 
 SELECT 도시,sum(단가*주문수량) as 주문금액합 from 고객 
 INNER join 주문 on 고객.고객번호 = 주문.고객번호 inner join 주문세부 on 주문.주문번호 = 주문세부.주문번호 GROUP BY 도시 ORDER BY 주문금액합 DESC LIMIT 5;