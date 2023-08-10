/*
단일행함수(single function)

A. 문자함수
 1.upper/ lower : 대소문자변환함수 upper)('abcde')- > ABCDE, lower('ABCDE') -> abcde
 2.inticap : 첫 글자를 대문자로 나머지는 소문자 initcap('aBcDe') -> Abcde
 3.length : 문자열의 길이를 리턴 length('abcde') -> 5, length('한글') utf-8일 경우 2, euc-kr 4,
 4.lengthb : 문자열의 byte단위 리턴(영문 1byte, 한글은 문자셋에 따라 2byte or 3byte를 리턴)
						length('abced') -> 5 length('한글') utf-8일 경우 6byte, euc-kr 4byte
 5.concat : 문자열을 연결(||와 동일) concat: ('a', 'b') -> ab
 6.substr : 주어진 문자열에서 특정 위치의 문자를 추출 substr('aBcDe', 2,2) ->Bc
 7.substrb: 주어진 문자열에서 특정 위치의 byte만 추출 
						substr('한글', 1, 2)-> euc-kr 한
						substr('한글', 1, 2)-> utf-8 깨진문자
	8. instr : 주어진 문자열에서 특정문자의 위치를 리턴 instr('A*B#C#D', '#')->4
	9. instrb: 주어진 문자열에서 특정문자의 byte 위치를 리턴 instr('한글로', '로') ->7
	10.ipad: 주어진 문자열에서 특정문자르 앞에서부터 채움 ipad('love', 6, '*')-> **love
	11.rpad: 주어진 문자열에서 특정문자를 뒤애서부터 채움 ipad('love', 6, '*')-> love**
	12.ltrim: 주어진 문자열에서 앞의 특정문자를 삭제 itrim('*love', '*') -> love
	13.rtrim : 주어진 문자열에서 앞의 특정문자를 삭제 rtrim('*love', '*') -> love
	14.replace:주어진 문자열에서 A를 B로 치환 replace('AB', 'A', 'C') -> CB
B. 숫자함수
1.
*/

--lower/upper
select ename from emp;
select lower(ename) from emp;
select upper(lower(ename)) from emp;


--initcap
select inticap(ename) from emp;

--length byte
select ename, length(ename) from emp;
select '소향' from dual; --dual은 오라클에서만 제공해주는 dummy태그
select * from dual;
select '소향', dummy from dual;

select '소향', length('소향'), lengthb('소향') from dual;

--concat(), or ||
select name, id
	,concat(name, id) 
	,concat(name, '-') "name -"
	,concat(concat(name, '-'),id) "name - id"
	,concat(concat('홍길동의 직업은', '의적입니다'), '주소는 조선한양입니다') as 홍길동
	,'홍길동의 직업은'|| '의적입니다' || '주소는 조선 한양입니다' as "홍길동(2)"
	from professor;
	
--substr(값, from, length) sub(값, from, length)
--from이 음수 값이면 음수처리
select 'abcde'
		,substr('abcdef', 3) cdef
		,substr('abcdef', 3, 2) cd
		,substr('abcdef', -3) def
		,substr('abcdef', -3, 2) de
		from dual;
		
select '홍길동'
	,substr('홍길동', 1, 1)홍
	,substrb('홍길동', 1, 1)홍xxx
	,substrb('홍길동', 1, 2)홍
	,substrb('홍길동', 1, 3)홍
	from dual;
	
--실습. ssn 991118-234567에서 성별구분만 추출해 보기
select '991118-1234567'
	, substr('991118-1234567' , 8, 1) as 성별
	from dual;
	
--instr(문자열, 검색글자, from(기본값 1), 몇 번째(기본값 1)
--검색글자의 위치를 리턴해 준다.
--시작위치가 음수이면 뒤에서부터 
select 'A*B*C*D'
	, instr ('A*B*C*D', '*')
	, instr ('A*B*C*D', '*', 3)
	, instr ('A*B*C*D', '*', 1, 2)+ 처음부터 시작해서 2번째의 * 의 위치
	, instr ('A*B*C*D', '*', -5, 1) 
	, instr ('A*B*C*D', '*', -1, 2) 
	from dual;
	select 'Hello WORLD;
		,instr('heelp Word,:)
		inst
		from dual;
		
--7 ipad
-- select naem, id, iength(id)
from studnent (14, 10)
up.dupdown
from student;
where depino1 = 101

-- ltrime/ rtrim
select ename
, ltrim(ename, 'C')
, rtrim(ename, 'C')
	from emp;
whhere deptno =10;

select ('xxx') from dual union all
select ltrim('xxx') from dual union all
select rtrim('xxx') from dual ;

--replace(문자열, 변경전문자, 변경후 문자)
select ename
	, replace(ename, 'KI', '**')
	, replace(ename, 'I', '--------')
	--'**ARK, **NG, **LLER substr(), replace()
	, substr(ename, 1, 2)
	, replace(ename, substr(ename, 1, 2), '**')
	from emp
	where deptno = 10;
	
-- 연습문제
-- student 테이블의 주민등록번호 에서 성별만 추출
-- student 테이블의 주민등록번호 에서 월일만 추출
-- 70년대에 태어난 사람만 추출
-- student 테이블에서 jumin컬럼을 사용 1전공이 101번인 학생들의 이름과 태어난 월일, 새일 하루 전 날짜를 출력
select * from STUDENT;

	select substr(JUMIN, 7, 1) 
	from STUDENT;
	
	select substr(JUMIN, 3, 4) 
	from STUDENT;
	
	where substr(JUMIN, 1, 2) >= '70'and 
				substr(JUMIN, 1, 2) < '80';
	
select NAME, JUMIN 
	 ,substr(JUMIN, 3, 2) 월
	 ,substr(JUMIN, 5, 2) 일
	 ,substr(JUMIN, 5, 2) -1 전일 --자동형변환 문자가 숫자로 형변환됨
FROM STUDENT;


/*
B. 숫자함수 

1.round : 주어진 실수를 반올림
2.trunc : 주어진 실수를 버림
3.mod : 나누기 연산후 나머지값을 리턴
4.ceil : 주어진 실수값에서 가장 큰 정수값을 리턴
5.floor : 주어진 실수값에서 가장 작은 정수값을 리턴
6.power : 주어진 값을 주어진 승수를 리턴 poer(3.3)-> 3*3*3=27
7.rowum : 오라클에서만 사용되는 속서로 모든 객체에 제공된다.
	...rowum은 전체열 즉 *와 같이 사용할 수 없다.
	...rowum은 행번호를 의미
*/

--round(실수, 반올림위치
select 976.635
	,round(976.235)
	,round(976.235, 0)
	,round(976.235, 1)
	,round(976.235, 2)
	,round(976.235, 3)
	,round(976.235, -1)
	,round(976.235, -3)
	from dual;

--trunc(실수 버림위치)
select 976.635
,round(976.235)
	,round(976.235, 0)
	,round(976.235, 1)
	,round(976.235, 2)
	,round(976.235, 3)
	,round(976.235, -1)
	from dual;


--mod,ceil,floor
select 121
	, mod(121.10)
	, ceil(121.1)
	, floor(121.9)
	from dual;
	
--power
select('2의3승 =', power(2, 3) form dual union all
select('3의3승 =', power(3, 3) form dual;


--rowum
SELECT rownum, * from student; --*과 같이 사용불가
SELECT rownum, name from student;
select rownum, name, id from student where deptnol = 101;


/*
널짜 함수 

1.sysdate : 시스템의 현재일자
2.months_date : 두 날짜 사이에 개월수를 리턴
3.add_months : 주어진 일자에 개월수를 더한 결과를 리턴: 날짜형
4.next_day : 주어진 일자를 기준으로 다음 날짜를 리턴 : 날짜형
5.last_day : 주어진 일자에 해당하는 월의 마지막일자를 리턴
6.round : 주어진 날짜를 반올림
7.trunc : 주어진 날짜를 버림
*/
--sysdate
select SYSDATE from dual;
--months_between
select months_between(sysdate, '20190101') from dual;

--근속 월수는?
select MONTHS_BETWEEN(SYSDATE, hiredate) from emp;

--add_months
select sysdate
	, add_months(sysdate, 2)
	, add_months(sysdate, -3)
	from dual;
	
--next_day
--현재일에서 다음의 요일
	select sysdate
		, next_day(sysdate, 1) --1~7 : 일요일~토요일
		, next_day(sysdate, 2)
		, next_day(sysdate, 3)
		, next_day(sysdate, 4)
		, next_day(sysdate, 5)
		, next_day(sysdate, 6)
		, next_day(sysdate, 7)
		from dual;
		
		
		--last_day
		select sysdate
			,last_day(sysdate)
			,last_day('20230301')
			,last_day('2023-03-01')
			,last_day('2023.03.01')
			,last_day('2023/03/01')
			--,last_day('2023-MAR-01') 오류
			--,last_day('03/01.2023') 오류
		from dual;
		
		-- round/trunc
		select sysdate
			, round(sysdate)
			, trunc(sysdate)
			, round('20230301')
			, trunc('20230331')
			from dual;
			
			/*
			형변환 함수
			
			1.to_cher () : 날짜 or 숫자를 문자로 변환
			2.to_number() : 문자형숫자를 숫자로 변환(단, 숫자형식에 맞아야함)
			3.to_date() : 문자형을 날짜로 변환(단, 날짜형식에 맞아야함)
			*/
			
			--자동형변환/수동형변환
			select '2' + 2 from dual; --'22'가 아니라 숫자 '2'로 변화되고 연산
			union all
			select 2 + '2' from dual --즉, 문자와 숫자의 연산의 우선순위는 숫자에 있다.
			
			--수동(명시적)형변환
			select to_number('2') + 2 from dual
			union all
			select 2 + to_number('2') form dual;
			
			select'2a' + 2 form dual; --안됨
			select 'A' + 2 from dual; --안됨

-- 2. to_char()
-- 1) 날짜를 문자로 변환
-- 2) 숫자를 문자로 변환
sysdate
	,to_char(sysdate)
	,to_char(sysdate, 'YYYY') 년도
	,to_char(sysdate, 'RRRR') 년도
	,to_char(sysdate, 'YY') 년도
	,to_char(sysdate, 'RR') 년도
	,to_char(sysdate, 'yy') 년도
	,to_char(sysdate, 'rr') 년도
	from dual;
	
	
	select sysdate
		,to_char(sysdate, 'MM') 월
		,to_char(sysdate, 'MON') 월
		,to_char(sysdate, 'MONTH') 월
		,to_char(sysdate, 'mm') 월
		,to_char(sysdate, 'mon') 월
		from dual;
		
		
		select sysdate
		,to_char(sysdate, 'DD') 일
		,to_char(sysdate, 'DAY') 일
		,to_char(sysdate, 'DDT') 일
		,to_char(sysdate, 'dd') 일
		,to_char(sysdate, 'ddth') 일
		,to_char(sysdate, 'day') 일
		from dual;
		
		select sysdate
			,to_char(sysdate)
			,to_char(sysdate, 'YYYY.MM.DD')
			,to_char(sysdate, 'yyyy.mm.dd')
			,to_char(sysdate, 'yyyy.mm.dd hh:mi:ss')
			,to_char(sysdate, 'yyyy.mm.dd hh24:mi:ss')
			,to_char(sysdate, 'MON.DD.YY hh:mi:ss')
			form dual;
		
		
		--숫자를 문자로 변환
		--12345 -> 12,345 or 12345.00 형태로 변환
select 1234
			,to_char(1234,'9999')
			,to_char(1234,'999999999')
			,to_char(1234,'099999')
			,to_char(1234,'$9999.99')
			,to_char(1234,'9,999')
			,to_char(123456789,'9,999,999,999')
		from dual;