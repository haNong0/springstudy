/* 그룹함수
*/
--count : 조건에 맞는 행의 갯수를 리턴
select count(*) from emp;
slect count(ename) from emp;
select connt(hum) form emp;
select connt(nvl.comm,0(hum)) form emp;
select count(8)from emp where deptno=0)
select count(sal),count(comm).count(nvl(comm, 0) from emp;
select count(sal), count(comm), count(nvl(comm, 0) from emp where comm is not null


--2. sum
select sum(sal) from emp;
select sum(comm) from emp;
select sum(ename) from emp;--문자열이라서 에러
select count(ename) 총사원수, sum(sal), round(sum(sal)총급여/count(ename)평균급여, 0) from emp;

--evg()
select count(ename) 총사원수 , sum(sal), round(sum(sal)총급여/count(ename) 평균급여, 0)from emp
union all
select count(ename) 총사원수 , sum(sal) 총급여 , round(avg(sal), 0) 평균급여 from emp;


 -- min/max
 select min(sal + nvl(comm, 0)) 최저급여
        , max(sal + nvl(comm, 0)) 최대급여
				from emp;
				
--최초입사일, 최후입사일
select min(hiredate) 최초입사일
      ,max(hiredate) 최후입사일
			from emp;
			
--이름
select min(ename) 알파벳빠른사원이름
			, max(ename) 알파벳늦은사원이름
	 from emp;

--최초입사자는> 최후 입사자는?
--최저급여자는? 최대 급여자는?

select ename from emp where hiredate = '1980.12.17';
select ename from emp where hiredate =(select min(hiredate) from emp);

select ename from emp where sal = 800
union all
select ename from emp where sal = 5000;

/*
그룹화 하기

select절에 그룸함수 이외의 컬럼이나 표현식을 사용할 경우에는 반드시
group by절에 선언이 되어야 한다.

group by절에 선언된 컬럼은 select절에 선언되지 않아도 된다.

group by절에는 반드시 컬럼명이나 표현식이 사용되어야 한다.
즉 컬럼의 별칭은 사용할 수 없다.

group by절에 사용한 열기준으로 정렬하기 위해서는 order by 절을 사용하는 경우에는
반드시 group by절 뒤에 선언되어야한다.

order by절에는 컬럼의 순서, 별칭으로도 선언할 수 있다.

*/
select 10, sum(sal) from emp  where deptno = 10
union all
select 20, sum(sal) from emp where deptno = 20
union all
select 30, sum(sal) from emp where deptno = 30;

select sum(sal)
	from emp
	where deptno = 10
	group by deptno;
	
select deptno 부서명, sum(sal)
	from emp
	group by deptno;
	


select deptno 부서번호, sum(sal)
	from emp
	group by deptno
	order by 부서번호;
	
select deptno 부서번호, sum(sal)
	from emp
	group by deptno
	order by 부서번호 desc;
       
--실습
--1)부서별로 사원수와 급여평균, 급여합계를 구하기, 정렬은 부서(deptno)
--2)직급별로 인원수, 평균급여,최고급여,최소급여,급여합계 정려은 직급(job)

select deptno, COUNT(*), ROUND(AVG(sal)) 급여평균, ROUND(SUM(sal)) 총급여
from emp
group by deptno
order by deptno;
		 
select job, COUNT(*) 인원수, ROUND(AVG(sal), 0) 급여평균, max(sal) 최대급여, min(sal) 최소급여
from emp
group by job
order by 1;	

/*
having 조건절 - 그룹결과를 조건별로 조회하기

단일행에서의 조건은 where을 사용하지만 그룹함수에서의 조건절은 having절을 사용한다.

having절에는 집게함수를 가지고 조건을 비교할 경우에 따라 사용되며
haiving group by 절은 함께 사용 할 수 있다. having 절은 group by절에 상관없다.
*/

--직급별 평균급여, 직급별 평균급여 3000보다 큰 직급만 조회
직급별 평균급여
select job 직급별
				 ,count(deptno)최신화
				,round(avg(sal), 0)익급별 평균의숲
				,max(sal)
			  ,min(sal)

select deptno, COUNT(*), ROUND(AVG(sal), 0) 급여평균, ROUND(SUM(sal)) 총급여
from emp
group by deptno
order by deptno;


--실습
--1. 부서별 직업별 평균급여 , 사원수
--2. 부서별 평균급여, 사원수
--3. 총계 평균급여, 사원수
select 부서, 직급, 평균, 사원수
			from(select deptno 부서, job 직급, round(avg(sal),0) 평균, count(*) 사원수 from emp group by deptno, job
				union all
				select deptno 부서, null, round(avg(sal),0), count(*) from emp group by deptno, job
				union all
				select null ,null , round(avg(sal),0), count(*) from emp) t1
order by 부서, 직급;

--rollup : 자동으로 소계와 합계를 구해주는 함수
-- group by rollup(deptno, job) -> n+1개의 그룹 생성
-- 순서의 주의 
select deptno
		,nvl(job, '부서합계')
		,count(*) 사원수
		,round(avg(sal+nvl(comm,0))) 평균급여
from emp
group by rollup(job, deptno);


select deptno, position
			,count(*) 교수인원수
			,SUM(pay)  부서합계
from professor
group by rollup(deptno, position);


--cube
-- 부서별 직급별 사원수 평균급여
-- 부서별 사원수 평균급여
-- 직급별 사원수 평균급여
-- 전체 사원수 평균급여

select deptno, position
			,count(*) 교수인원수
			,SUM(pay)  부서합계
from professor
group by cube(deptno, position);

select deptno
			,job
			,count(*) 사원수
			,round(avg(sal + nvl(comm, 0)), 2) 평균급여
			from emp
group by cube(deptno, job);

--순위 함수
--rank : 순위부여함수, 동일처리 1 2 2 4
--dense_rank() :순위부여함수, 동일처리 1 2 2 3
--row_number() :행번호를 제공해 주는 함수 동일처리는 불가 

-- [주의할 점]
-- 순위함수는 반드시 order by와 같이 사용해야한다.
--rank
--특정자료별로 순위:rank(조건값) within group(order by 조건값, 컬럼[ascc:desc]
--전체자료기준 순위:rank() over(order by 조건값, 컬럼[ascc:desc]

--특정 조건의 순위
--SMITH사원이 알파벳순으로 몇번째 인지?
select ename from emp order by ename;
select rownum, ename from emp order by ename;
select rownum, t1.rn, t1.rownum t1.ename from (select ename from emp order by ename) t1;

select rank('SMITH') within group(order by ename) from emp;
select rank('SMITH') within group(order by ename asc) from emp;
select rank('SMITH') within group(order by ename desc)as 사원명 from emp;

--전체자료에서의 손위
-- emp에서 각 사원들의 급여순위는?
-- 급여가 작은순(asc), 급여가 많은순(desc)
select * from emp order by sal;

select ename, sal
			,rank() over(order by sal) --급여가 적은순
			,rank() over(order by sal desc) --급여가 많은순
	from emp;
	
	--dense_rank
	
	select ename, sal
			,rank() over(order by sal) --급여가 적은순
			,dense_rank() over(order by sal) --급여가 많은순
	from emp;
	
	-- row_num : 행번호
	
	select ename, sal
			,rank() over(order by sal) rank --급여가 적은순
			,dense_rank() over(order by sal) dense_rank --급여가 많은순
			, row_number() over(order by sal) row_number
	from emp;
	
	/*
	누적함수
	
	sum(컬럼) overpartition by(order by 컬럼 [asc:desc]) : 누계(누적)을 구하는 함수
	ratio _to_report() : 비율을 구하는 함수
	*/
	
	--sum() over()
	select * from panmae;
	select * from panmae where p_store=1000 order by 1;
	
	-- 대리점의 판매일자별 누계액 구하기
	

	select p_date 
				,p_code
				,p_qty
				,p_total
				,sum(p_total) over (order by p_date, p-code) 일자별판매누계액
			from panmae 
			where p_store=1000 
			order by 1;

-- 판매일자별 제품별 판매누계액

select p_date 
				,p_code
				,p_qty
				,p_total
				,sum(p_total) over (order by p_date, p_code) 판매누계액
			from panmae 
			where p_store=1000 
			order by 1;
			
--제품별/ 대리점별기준으로 누계구하기(순서는 판매일자)
select p_date 
				,p_code
				,p_store
				,p_total 
		    ,sum(p_total) over(partition by p_code, p_store order by p_date) 판매누계액
			from panmae;
			
-- ratio_to_report()
--판매비율
select p_code 
			 ,sum(p_total) over() 총판매수량
			 ,p_store
			 ,p_total
			-- ,(p_qty / sum(p_qty) over()) * 100
			 , round(ratio_to_report(sum(p_qty))  over() *100, 2) "수량(%)"
			 , round(ratio_to_report(sum(p_total)) over() *100, 2) "금액(%)"
	 from panmae
	 group by p_code, p_qty, p_store, p_total;
			
/* 연습문제 */
-- 1. emp 테이블을 사용하여 사원 중에서 급여(sal)와 보너스(comm)를 합친 금액이 가장 많은 경우와 
--    가장 적은 경우 , 평균 금액을 구하세요. 단 보너스가 없을 경우는 보너스를 0 으로 계산하고 
--    출력 금액은 모두 소수점 첫째 자리까지만 나오게 하세요
-- MAX, MIN, AVG
select --sal, comm
			 min(sal + nvl(comm, 1)) 최저급여
     , max(sal + nvl(comm, 1)) 최대급여
		 ,ROUND(AVG(sal+nvl(comm, 0)), 1) 급여평균
from emp;
-- 2. student 테이블의 birthday 컬럼을 참조해서 월별로 생일자수를 출력하세요
-- TOTAL, JAN, ...,  5 DEC
--  20EA   3EA ....
select COUNT(BIRTHDAY)||'EA' "TOTAL",
    COUNT(DECODE(SUBSTR(BIRTHDAY,4,2),01,01))||'EA' "JAN" ,
    COUNT(DECODE(SUBSTR(BIRTHDAY,4,2),02,02))||'EA' "FEB" ,
    COUNT(DECODE(SUBSTR(BIRTHDAY,4,2),03,03))||'EA' "MAR" ,
    COUNT(DECODE(SUBSTR(BIRTHDAY,4,2),04,04))||'EA' "APR" ,
    COUNT(DECODE(SUBSTR(BIRTHDAY,4,2),05,05))||'EA' "MAY" ,
    COUNT(DECODE(SUBSTR(BIRTHDAY,4,2),06,06))||'EA' "JUN" ,
    COUNT(DECODE(SUBSTR(BIRTHDAY,4,2),07,07))||'EA' "JUL" ,
    COUNT(DECODE(SUBSTR(BIRTHDAY,4,2),08,08))||'EA' "AUG" ,
    COUNT(DECODE(SUBSTR(BIRTHDAY,4,2),09,09))||'EA' "SEP" ,
    COUNT(DECODE(SUBSTR(BIRTHDAY,4,2),10,10))||'EA' "OCP" ,
    COUNT(DECODE(SUBSTR(BIRTHDAY,4,2),11,11))||'EA' "NOV" ,
    COUNT(DECODE(SUBSTR(BIRTHDAY,4,2),12,12))||'EA' "DEC" 
from student;
-- 3. Student 테이블의 tel 컬럼을 참고하여 아래와 같이 지역별 인원수를 출력하세요.
--    단, 02-SEOUL, 031-GYEONGGI, 051-BUSAN, 052-ULSAN, 053-DAEGU, 055-GYEONGNAM
--    으로 출력하세요
select COUNT(TEL)"TOTAL",
    COUNT(DECODE(SUBSTR(TEL,1, INSTR(TEL,')')-1),'02','02')) "SEOUL" ,
    COUNT(DECODE(SUBSTR(TEL,1, INSTR(TEL,')')-1),'031','02'))"GYEONGGI" ,
    COUNT(DECODE(SUBSTR(TEL,1, INSTR(TEL,')')-1),'051','02'))"BUSAN" ,
    COUNT(DECODE(SUBSTR(TEL,1, INSTR(TEL,')')-1),'052','02'))"ULSAN" ,
    COUNT(DECODE(SUBSTR(TEL,1, INSTR(TEL,')')-1),'053','02'))"DAEGU" ,
    COUNT(DECODE(SUBSTR(TEL,1, INSTR(TEL,')')-1),'055','02')) "GYEONGNAM"
from student;

-- 4. emp 테이블을 사용하여 직원들의 급여와 전체 급여의 누적 급여금액을 출력,
-- 단 급여를 오름차순으로 정렬해서 출력하세요.
-- sum() over()
SELECT
    DEPTNO,
    ENAME,
    SAL,
    SUM(SAL) OVER (ORDER BY SAL ASC) "TOTAL"
FROM
    EMP;


-- 6. student 테이블의 Tel 컬럼을 사용하여 아래와 같이 지역별 인원수와 전체대비 차지하는 비율을 
--    출력하세요.(단, 02-SEOUL, 031-GYEONGGI, 051-BUSAN, 052-ULSAN, 053-DAEGU,055-GYEONGNAM)
	 select  
    COUNT(tel)
    || 'EA ('
       || COUNT(tel) / COUNT(tel) * 100
                                    || '%)' "TOTAL",
    COUNT(decode(substr(tel, 1, instr(tel, ')') - 1), '02', '02'))
    || 'EA ('
       || COUNT(decode(substr(tel, 1, instr(tel, ')') - 1), '02', '02')) / COUNT(tel) * 100
                                                                                        || '%)' "SEOUL",
    COUNT(decode(substr(tel, 1, instr(tel, ')') - 1), '031', '02'))
    || 'EA ('
       || COUNT(decode(substr(tel, 1, instr(tel, ')') - 1), '031', '02')) / COUNT(tel) * 100
                                                                                         || '%)' "GYEONGGI",
    COUNT(decode(substr(tel, 1, instr(tel, ')') - 1), '051', '02'))
    || 'EA ('
       || COUNT(decode(substr(tel, 1, instr(tel, ')') - 1), '051', '02')) / COUNT(tel) * 100
                                                                                         || '%)' "BUSAN",
    COUNT(decode(substr(tel, 1, instr(tel, ')') - 1), '052', '02'))
    || 'EA ('
       || COUNT(decode(substr(tel, 1, instr(tel, ')') - 1), '052', '02')) / COUNT(tel) * 100
                                                                                         || '%)' "ULSAN",
    COUNT(decode(substr(tel, 1, instr(tel, ')') - 1), '053', '02'))
    || 'EA ('
       || COUNT(decode(substr(tel, 1, instr(tel, ')') - 1), '053', '02')) / COUNT(tel) * 100
                                                                                         || '%)' "DAEGU",
    COUNT(decode(substr(tel, 1, instr(tel, ')') - 1), '055', '02'))
    || 'EA ('
       || COUNT(decode(substr(tel, 1, instr(tel, ')') - 1), '055', '02')) / COUNT(tel) * 100
                                                                                         || '%)' "GYEONGNAM" 
FROM 
    STUDENT;
				-- ,ROUND(ratio _to_report(TEL) OVER(), 2)*100 || '%'
from student;

select * from student;
-- 7. emp 테이블을 사용하여 부서별로 급여 누적 합계가 나오도록 출력하세요. 
-- ( 단 부서번호로 오름차순 출력하세요. )
select deptno
			,sal
			,SUM(SAL) OVER (PARTITION BY deptno ORDER BY SAL) "TOTAL"
from emp
GROUP BY job, deptno ,SAL;


-- 8. emp 테이블을 사용하여 각 사원의 급여액이 전체 직원 급여총액에서 몇 %의 비율을 
--    차지하는지 출력하세요. 단 급여 비중이 높은 사람이 먼저 출력되도록 하세요
   select deptno
				, ename
				, SUM(SAL) OVER () "전체급여총액" --전체 직원 급여총액
				,ROUND(SAL/(SUM(SAL) OVER ())*100,2) "직원별 비율()%"
	 from emp
	 order by ROUND(SAL/(SUM(SAL) OVER ())*100,2) desc;

-- 9. emp 테이블을 조회하여 각 직원들의 급여가 해당 부서 합계금액에서 몇 %의 비중을
--     차지하는지를 출력하세요. 단 부서번호를 기준으로 오름차순으로 출력하세요.

select deptno
		 ,ename
		 ,sal
		 ,SUM(SAL) OVER (PARTITION BY DEPTNO) "부서별총액"
     ,ROUND(SAL / SUM(SAL) OVER (PARTITION BY DEPTNO) *100,2) "전체비율()%"
 from emp
 order by deptno;
