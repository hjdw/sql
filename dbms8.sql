use 한빛무역;
SELECT 고객회사명,마일리지 from 고객 where 도시 = '경주시' 
UNION 
SELECT 마일리지,고객회사명 from 고객 where 도시 = '오산시';
select 고객회사명,마일리지 from 고객 UNION SELECT 제품명,단가 from 제품;
SELECT 담당자명,고객회사명,마일리지 from 고객 where 도시 <> '경주시' UNION SELECT 담당자명,고객회사명 from 고객 where 마일리지 >= 10000;

SELECT DISTINCT 지역,도시 from 고객 ORDER BY 1,2;

SELECT * from 제품;
SELECT * from 제품 where 제품명 like '%주스%' ;
SELECT * FROm 제품 where 제품명 like '%주스%' and 단가 BETWEEN 5000 and 10000;
SELECT * from 제품 where 제품번호 in (1,2,4,7,11,20);
SELECT 제품번호,제품명,단가,재고, (단가*재고) as 재고금액 from 제품 order by 재고금액 DESC LIMIT 10;

SELECT char_length(ltrim(' sql')); /*왼쪽공백 삭제 후 문자 개수 반환*/
SELECT length(ltrim(' sql ')); /*왼쪽공백 삭제 후 길이 반환*/

select cast('-1' as unSIGNED);
SELECT cast('1' as UNSIGNED);

SELECT case when 12500 * 450 > 5000000 then '초과달성'
WHEN 2500 * 450 > 4000000 then '달성'
else '미달성'
end;
SELECT* from 고객;
SELECT 고객회사명, replace(고객회사명,left(고객.고객회사명,2),'**') as 고객회사명2,전화번호, 
replace(substr(전화번호,2), ')','-') as 전화번호2 from 고객;

SELECT 고객회사명,concat('**',substr(고객회사명,3)) as 고객회사명2, 전화번호, 
replace(substr(전화번호,2), ')','-') as 전화번호2 from 고객;

SELECT * from 주문세부;
SELECT *,(주문수량*단가) as 주문금액, truncate((주문수량*단가*할인율),-1) as 할인금액,
 truncate(((주문수량*단가)-(주문수량*단가*할인율)),-1) as 실주문금액 from 주문세부 ;
SELECT truncate(123.56,1);
SELECT truncate(123.123123,-1);

SELECT * from 사원;
SELECT 이름,생일,timestampdiff(year,생일,curdate()) as 만나이,입사일,
datediff(curdate(),입사일) as 입사일수, adddate(입사일,500) as '500일 후' 
from 사원;

select* from 고객;
SELECT 담당자명,고객회사명,도시,if(도시 like '%특별시' or 도시 like '%광역시', '대도시','도시') as 도시구분
,마일리지, case when 마일리지 >= 100000 then 'VVIP고객'
WHEN 마일리지 >= 10000 THEN 'VIP고객'
ELSE '일반고객'
END AS 마일리지구분 FROM 고객;

SELECT * FROM 주문;
SELECT 주문번호,고객번호,주문일, year(주문일) AS 주문년도, quarter(주문일) AS 분기, month(주문일) AS 월, day(주문일) AS 주문일, weekday(주문일) AS 요일,
CASE weekday(주문일) WHEN 0 THEN '월요일'
					WHEN 1 THEN '화요일'
                    WHEN 2 THEN '수요일'
                    WHEN 3 THEN '목요일'
                    WHEN 4 THEN '금요일'
                    WHEN 5 THEN '토요일'
                    ELSE '일요일'
                    END AS 한글요일 FROM 주문;
                    
SELECT *  FROM 주문;
SELECT * ,datediff(발송일,요청일) AS 지연일수 FROM 주문 WHERE datediff(발송일,요청일) >= 7;
SELECT * FROM 고객;
SELECT * FROM 사원;
SELECT 담당자명 FROM 고객 WHERE 담당자명 LIKE '%정%';
SELECT * FROM 주문;
SELECT * FROM 주문 WHERE year(주문일)='2020' AND quarter(주문일) = '2';
SELECT * FROM 사원;
SELECT 이름,부서번호,직위,입사일, datediff(now(),입사일) AS 입사일수, timestampdiff(month,입사일,now()) as 입사개월수
from 사원 where timestampdiff(month,입사일,now()) >= 40;
