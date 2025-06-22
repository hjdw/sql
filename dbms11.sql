use 한빛무역;
Select * from 고객 where 지역 is not null and 담당자직위 <> '대표 이사';
SELECT * from 고객 where 지역 <> " " and 담당자직위 <> '대표이사';
Select 담당자명 from 고객 where 담당자명 like '이%';
Select 제품명, sum(재고) as 재고합 from 제품 where 제품명 like '%주스%' group by 제품명;
Select 고객번호,고객회사명,마일리지,마일리지등급.등급명 as 마일리지등급 from 고객 
inner join  마일리지등급 on 마일리지 >= 하한마일리지 and 마일리지 <= 상한마일리지 where 담당자명 ='이은광';
Select 사원번호,직위,사원.부서번호, 부서명 from 사원 inner join 부서 on 부서.부서번호 = 사원.부서번호 where 이름 = '이소미';
select * from 사원;
Select 고객회사명,담당자명 from 고객 inner join 주문 on 고객.고객번호 = 주문.고객번호 where 주문번호 = 'H0250';
select 담당자직위,도시,count(*) as 고객수 from 고객 where 담당자직위 like '%마케팅%' group by 담당자직위,도시 WITH ROLLUP;
SELECT * from 주문세부;
SELECT * from 고객;
SELECT * from 주문;
/*고객 회사들이 주문한 주문건수를 주문 건수가 많은 순서대로 보이시오. 이때 고객 회사의 정보로는 고객번호,담당자명,고객회사명을 보이시오.*/
SELECT 고객.고객번호,담당자명,고객회사명 from 고객 inner join 주문 on 고객.고객번호 = 주문.고객번호 GROUP BY 주문번호 order by count(*) desc;
select 고객.고객번호,담당자명,고객회사명,count(*) as 주문건수 from 고객 inner join 주문 on 고객.고객번호 = 주문.고객번호 
group by 고객번호 order by count(*) desc;
SELECT * from 제품;
SELECT 제품번호,제품명,재고, case when 재고 >= 100 then '과다재고'
when 재고 >= 10 then '적정' else '재고부족' end as 재고구분 from 제품;