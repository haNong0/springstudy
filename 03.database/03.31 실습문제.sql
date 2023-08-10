/* 연습문제 */
-- view문제를 기초로 자유롭게 procedure를 작성하세요!
-- 매개변수를 받아서 만드는 것을 기본으로 하고
--    dbms_output.put_line('========================================================');
--    dbms_output.put_line('교수명' || chr(9) || '교수번호' || chr(9) || '학과명');
--    dbms_output.put_line('========================================================');
-- 출력하는 프로시저를 작성해 보세요!!
-- 프로시저명 ex01~ex06

 -- ex01) student, department에서 학생이름, 학과번호, 1전공학과명출력
  select * from professor;
	select * from department;
	
	create or replace procedure e_std_dpt(e_profno1 in number) is
	e_profno number;
	e_pname varchar2(20);
	e_dname  varchar2(20);
	begin
	 select a.profno, a.name, b.dname
	into		e_profno, e_pname, e_dname
	 from  professor a, department b
	 where  a.deptno = b.deptno and a.profno = e_profno1;
	dbms_output.put_line('========================================================');
  dbms_output.put_line('교수번호='||e_profno || chr(9) || ',교수이름='||e_pname|| chr(9) || ',학과명='||e_dname);
  dbms_output.put_line('========================================================');
	end;
	
	call e_std_dpt(1001);
	
	
	create or replace procedure ex01 is
   type tab_v_pro_01 is table of v_pro_01%rowtype /*view테이블에 한줄을로우로 가져오겠다.*/index by binary_integer; 
   v_v_pro_01       tab_v_pro_01;
   i                     binary_integer := 0;
   
begin
   for my_list in (select * from v_pro_01) loop
      i := i+1;
      v_v_pro_01(i) := my_list;
      dbms_output.put_line(v_v_pro_01(i).교수이름 ||chr(9)|| v_v_pro_01(i).교수번호 || chr(9) || v_v_pro_01(i).소속학과);
   end loop;

exception when others then
      dbms_output.put_line('에러입니다');
end ex01;
	
	