SELECT * from 고객;
SELECT 고객번호,고객회사명,담당자명,마일리지 from 고객 where 마일리지 = (SELECT max(마일리지) from 고객) ;
SELECT 고객회사명,담당자명 from 고객 where 고객번호 = (SELECT 고객번호 from 주문 where 주문번호 = 'H0250');
SELECT 고객회사명,담당자명 from 고객 inner join 주문 on 고객.고객번호 = 주문.고객번호 where 주문번호 = 'H0250';
SELECT 담당자명,고객회사명,마일리지 from 고객 where 마일리지 > ( SELECT min(마일리지) from 고객 where 도시 = '부산광역시');
SELECT count(*) as 주문건수 from 주문 where 고객번호 in (SELECT 고객번호 from 고객 where 도시 = '부산광역시' ) ;
SELECT 담당자명,고객회사명,마일리지 from 고객 where 마일리지 > any (SELECT 마일리지 from 고객 where 도시 = '부산광역시');
SELECT 담당자명,고객회사명,마일리지 from 고객 where 마일리지 > all(SELECT avg(마일리지) from 고객 GROUP BY 지역);
SELECT 고객번호,고객회사명 from 고객 where EXISTS (SELECT * from 주문 where 고객번호 = 고객.고객번호);
SELECT 고객번호,고객회사명 from 고객 where 고객번호 in (SELECT DISTINCT 고객번호 from 주문);

SELECT 고객회사명,담당자명 from 고객 inner join 주문 on 고객.고객번호 = 주문.고객번호 where 주문번호 = 'H0250';

SELECT 담당자명,고객회사명,마일리지 from 고객 where 마일리지 > all (SELECT avg(마일리지) from 고객 GROUP BY 도시);

select 담당자명,고객회사명,마일리지 from 고객 where 마일리지 > min(마일리지) and 도시 = '부산광역시' ;
SELECT count(*) as 주문건수 from 주문 inner join 고객 on 주문.고객번호 = 고객.고객번호 where 도시 ='부산광역시';

SELECT 담당자명,고객회사명,마일리지 as 등급 from 고객 inner join 고객 on 고객.마일리지 = 고객.등급 where 도시 = '부산광역시';
SELECT * from 사원;
SELECT * from 부서;
SELECT 부서명 from 부서 where 부서번호 = (select 부서번호 from 사원 where 이름 = '배재용');
SELECT * from 고객;
SELECT * from 주문;
SELECT 고객번호,고객회사명 from 고객 where EXISTS (SELECT 주문번호 from 주문 where 주문.고객번호 = 고객.고객번호);

select * , 단가 * 재고 as 재고금액 from 제품 where not EXISTS (SELECT * from 주문세부 where 주문세부.제품번호 = 제품.제품번호);
SELECT 제품.*, 제품.단가 * 제품.재고 as 재고금액 from 제품 LEFT OUTER join 주문세부 on 제품.제품번호 = 주문세부.제품번호 where 주문세부.제품번호 is null;
SELECT * from 주문; /*count(*) as 주문건수 , 고객번호 별로 - 최초주문일,최종주문일*/
SELECT * from 고객; /*담당자명,고객회사명*/
SELECT 담당자명,고객회사명,주문건수,최초주문일,최종주문일 from 고객 ;
SELECT 제품.*, 제품.단가 * 제품.재고 as 재고금액 from 제품 where * not in (select * from 주문세부 where 주문세부.제품번호 = 제품.제품번호);
SELECT * from 주문 where 고객번호 not in (SELECT 고객번호 from 고객 where 마일리지 <= 1000);

select * from 제품;
SELECT 제품명 from 제품 where 단가 = all (SELECT max(단가) from 제품) ;
SELECT 고객.고객번호,고객.담당자명, count(주문.고객번호) as 주문건수 from 고객 inner join 주문 on 주문.고객번호 = 고객.고객번호 group by 고객.고객번호,고객.담당자명;
SELECT * from 주문;
SELECT * from 주문세부;
SELECT * from 고객;
SELECT * from 주문 inner join 사원 on 주문.사원번호 = 사원.사원번호 where 이름 = '이소미';

SELECT * from 주문 where 고객번호 = (SELECT 고객번호,고객회사명 from 고객 where 담당자명 = '한희수');
SELECT * from 주문 where 고객번호 = (SELECT 고객번호 from 고객);
SELECT * from 주문 where 고객번호 not in (SELECT 고객번호 from 고객 where 마일리지 <= 1000);

SELECT sum(주문수량) as 주문수량합 from 주문세부 where 단가 =  all (SELECT max(단가) from 주문세부);
select sum(주문수량) as 주문수량합 from 주문세부 where 제품명 = all (select 제품.제품명 from 제품 where 제품명 like '%아이스크림%');
SELECT sum(주문수량) as 주문수량합 from 주문세부 inner join 제품 on 주문세부.제품번호 = 제품.제품번호 where 제품명 like '%아이스크림%';
SELECT year(주문.주문일) as 주문년도, count(주문.주문일) as 주문건수 from 주문 inner join 주문세부 on 주문.주문번호 = 주문세부.주문번호
inner join 고객 on  고객.고객번호 = 주문.고객번호 where 도시 ='서울특별시' GROUP BY 주문년도;

SELECT year(주문.주문일) as 주문년도, count(주문.주문일) as 주문건수 from 주문,주문세부,고객 where 주문.주문번호 = 주문세부.주문번호 and
 고객.고객번호 = 주문.고객번호 and 도시 ='서울특별시' GROUP BY 주문년도;
 
 /*여기부터 총 정리*/
 
 SELECT 고객번호,담당자명,고객회사명,마일리지 as 포인트 ,1.1*마일리지 as '10%인상된 마일리지' from 고객;
select 고객번호,담당자명,마일리지 from 고객 where 마일리지 >=100000;
select 고객번호,담당자명,도시,마일리지 from 고객 where 도시 = '서울특별시' ORDER BY 마일리지 desc;
SELECT * from 고객 LIMIT 3;
SELECT * from 고객 ORDER BY 마일리지 desc LIMIT 3;
SELECT DISTINCT 도시 from 고객;
SELECT 23 + 5;
SELECT 23 - 5;
SELECT * from 고객 where 담당자직위 <> '대표이사'; 
SELECT * from 고객 where 도시 = '부산광역시' and 마일리지 < 1000;
SELECT 고객번호,담당자명,마일리지,도시 from 고객 where 도시 ='부산광역시' OR 마일리지 < 1000 ORDER BY 고객번호;
SELECT * from 고객 where 지역 is null;
SELECT 고객번호,담당자명,담당자직위 from 고객 where 담당자직위 in ('영업 과장','마케팅 과장');
SELECT 담당자명,마일리지 from 고객 where 마일리지 >= 100000 and 마일리지 <= 200000;
SELECT * from 고객 where 도시 like '%광역시%' and (고객번호 like '_C%' OR 고객번호 LIKE '__C%');
SELECT * from 고객 where 도시 = '서울특별시' and 마일리지 BETWEEN 15000 and 20000;
SELECT DISTINCT 지역,도시 from 고객 ORDER BY 1,2;
SELECT * from 고객 where 도시 in('춘천시','과천시','광명시') and (담당자직위 like '%이사%' or 담당자직위 like '%사원%');
SELECT * from 고객 where not (도시 like '%광역시%' or 도시 like '%특별시%') ORDER BY 마일리지 desc LIMIT 3;
SELECT * from 고객 where 지역 is not null and 담당자직위 <> '대표 이사'; 
SELECT * from 제품 where 제품명 like '%주스%';
SELECT * from 제품 where 제품명 like '%주스%' and 단가 between 5000 and 10000;
SELECT * from 제품 where 제품번호 in (1,2,4,7,11,20);
SELECT 제품번호,제품명,단가,재고,단가*재고 as 재고금액 from 제품 where 단가*재고 ORDER BY 재고금액 desc LIMIT 10;