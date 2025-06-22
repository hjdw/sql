use 한빛무역;
SHOW TABLES;

SELECT 주소 from 고객;
SELECT 고객.주소 from 고객;

SELECT * from 부서; 
SELECT * FROM 사원;
SELECT * from 부서 join 사원;

SELECT * from 부서 CROSS join 사원 where 이름 = '배재용';

SELECT 부서.부서번호,부서명,이름,사원.부서번호
from 부서 cross join 사원 where 이름 = '배재용';

SELECT 부서.부서번호,부서명,이름,사원.부서번호 from 부서 cross join 사원 where 이름 = '배재용';

SELECT 사원.사원번호,직위,사원.부서번호,부서.부서명 from 사원 inner join 부서 on 사원.부서번호 = 부서.부서번호
 where 이름 = '이소미';/*여기서 select 부서번호 앞에 테이블 명이 들어가는 이유는 두 테이블에 동시에 들어가 있는 컬럼이라서 구분하기 위해서인가?
 아니면 사원을 통한 조인이라서 사원.부서번호인가? - 이퀴조인(두 테이블에서 공통으로 존재하는 컬럼의 값이 일치하는 행을 찾기 위한 조인) 
 이퀴조인인 경우 사원.부서번호 또는 부서.부서번호 중 어느 것을 넣어도 결과가 동일하다.*/
 
 select 사원번호,직위,사원.부서번호,부서명 from 사원,부서 where 사원.부서번호 = 부서.부서번호 and 이름 = '이소미';
 
 select 고객.고객번호,담당자명,고객회사명, count(*) as 주문건수 from 고객 inner join 주문 
 on 고객.고객번호 = 주문.고객번호 GROUP BY 고객.고객번호,담당자명,고객회사명 ORDER BY count(*) DESC;
 
 SELECT 고객.고객번호,
 담당자명,
 고객회사명,
 count(*) as 주문건수 from 고객,주문 where 고객.고객번호 = 주문.고객번호 
 GROUP BY 고객번호,담당자명,고객회사명 ORDER BY count(*) DESC;
 
 select * from 주문세부;
 
 SELECT 고객.고객번호,담당자명,고객회사명, sum(주문수량 * 단가 ) as 주문금액합
from 고객 INNER JOIN 주문 on 고객.고객번호 = 주문.고객번호
 inner join 주문세부 on 주문.주문번호 = 주문세부.주문번호 
 GROUP BY 고객.고객번호,담당자명,고객회사명 order by 4 desc;
 
 select 고객번호,담당자명,마일리지,등급.* from 고객 cross join 마일리지등급 as 등급 where 담당자명 = '이은광';
 
select 고객번호,고객회사명,담당자명,마일리지,등급명 from 고객 INNER join 마일리지등급 on 마일리지>= 하한마일리지
and 마일리지 <= 상한마일리지 where 담당자명 = '이은광';

select * from 사원;

select 사원번호,이름,부서명 from 사원 left OUTER join 부서 on 사원.부서번호 = 부서.부서번호
where 성별 = '여';

select 사원번호,이름,부서명 from 부서 right OUTER join 사원 on 사원.부서번호 = 부서.부서번호
where 성별 = '여';

SELECT * from 사원;
SELECT * from 부서;

SELECT 부서명,사원.* from 사원 RIGHT OUTER join 부서 on 사원.부서번호 = 부서.부서번호;

SELECT 부서명,사원.* from 사원 RIGHT outer JOIN 부서 on 사원.부서번호 = 부서.부서번호 where 사원.부서번호 is null;

SELECT 사원.사원번호,사원.이름,상사.사원번호 as '상사의 사원번호' ,상사.이름 as '상사의 이름' from 사원
inner join 사원 as 상사 on 사원.상사번호= 상사.사원번호;

SELECT 사원.이름 as 이름, 사원.직위, 상사.이름 as 상사이름 from 사원 as 상사
right outer join 사원 on 사원.상사번호 = 상사.상사번호 ORDER BY 상사이름;

SELECT 고객번호,고객회사명,담당자명,마일리지 from 고객 where 마일리지 =(SELECT max(마일리지) from 고객);

SELECT * from 주문;

SELECT 고객회사명,담당자명 from 고객 where 고객번호 = (select 고객번호 from 주문 where 주문번호 = 'H0250');

SELECT 고객회사명,담당자명 from 고객 INNER join 주문 on 고객.고객번호 = 주문.고객번호 where 주문번호 = 'H0250';
/*중간고사는 서브쿼리까지*/