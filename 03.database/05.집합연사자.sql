/*
A. 집한연산자
	
	1.union : 두 집합의 결과를 합쳐서 출력, 단 중복시 중복자료는 제외
	2.union all : 두 집합의 결과를 합쳐서 출력 중복과 상관없이 조회
	3.intersect : 두 집합의 교집합 출력(정렬)
	4.minus : 두 집합의 차집합을 출력(정렬), 선후(순서)가 중요
	
	[집합 연사자의 조건]
	1. 두 집합의 select절의 컬럼수가 동수이어야 한다.
	2. 두 집합의 select절의 같은 위치의 컬럼의 데이터타입은 동일 데이터이어야 함
	3. 두 집합의 컬럼명이 달라도 상관없다. 단, 먼저 정의된 컬럼명으로 정해진다.
*/


select * from student;
select * from professor;

select student 학생번호  from student;
select profno 교수번호 from professor;

--union : 학생번호와 교수번호 정보를 하나로 합치기
select studno xxx from student  
union
select profno 교수번호 from professor;

select name xxx from student  
union
select profno 교수번호 from professor; --(x) 데이터 타입이 달라서 에러난다.

select studno xxx from student, name 학생명 from student
union
select profno 교수번호 from professor; --(x) 컬럼갯수가 다르다.

--2.union /union all
select count(*) from student; -- 집계함수 count(*[컬럼명]*) 
select count(deptno1) from student;
select count(deptno2) from student; -- null은 값이 아니다 데이터타입이라는 말이 옳음.

select studno, name, deptno1, form student
union
select studno, name, deptno1, form student; --중복제외

select studno, name, deptno1, form student
union all
select studno, name, deptno1, form student; --중복상관없음

--3. union은 정렬하지만 union all 정렬하지 않는다.
select studno, name, deptno1, 1 from student where deptno1 = 101
union
select studno, name, deptno1, 2 from student where deptno1 = 101; --정렬함

select studno, name, deptno1, 1 from student where deptno1 = 101
union all
select studno, name, deptno1, 2 from student where deptno1 = 101; --정렬안함

--4. 교집합 intersect 
select studno, name, deptno1,  from student where deptno1 = 101;
intersect
select studno, name, deptno1,  from student where deptno1 = 102;

--4. 차집합 minus
select studno, name, deptno1, from student where deptno1 = 102;
minus
select studno, name, deptno1, from student where deptno1 = 101;
