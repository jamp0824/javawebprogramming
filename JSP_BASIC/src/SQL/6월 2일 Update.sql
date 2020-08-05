--emp35 복제본 테이블 생성
create table emp35 as select * from emp28;

select * from emp35;

--모든 사원의 부서번호를 30번으로 수정
update emp35 set depno=30;
--101번 사원만 부서번호를 20으로 변경
update emp35 set depno=20 where empno=101;

/* 서브쿼리를 사용한 데이터 수정을 위한 원본테이블 dept31 을 생성)
 */
create table dept31(      
 deptno number(38) primary key --부서번호
 ,dname varchar2(100) --부서명 
 ,LOC varchar(100) --지역명
);
insert into dept31 values(10,'경리부','서울');
insert into dept31 values(20,'영업부','부산');
insert into dept31 values(30,'관리부','인천');
insert into dept31 values(40,'연구부','판교');
select * from dept31 order by deptno;

--dept32 복제본테이블 만들기
create table dept32 as select * from dept31;

select * from dept32 order by deptno;

update dept32 set (dname,LOC)=(select dname,LOC from dept31 where deptno=40)
where deptno=20;
--dept31 테이블의 40번 부서번호의 부서명과 지역명을 검색해서 dept32테이블 20번 부서번호의 부서명과 지역명을 수정한다

--40번 부서번호 레코드 삭제
delete from dept32 where deptno=40; 

select * from emp28; 
select deptno from dept32 where dname='경리부';

/* 문제) select deptno from dept32 where dname='경리부'; 이문을 서브 쿼리로 사용해서 경리부에 해당하는 
 *  	부서번호를 구해서 emp28테이블의 부서번호 10을 삭제해 본다.
 */

delete from emp28 where depno=(select deptno from dept32 where dname='경리부'); 




















