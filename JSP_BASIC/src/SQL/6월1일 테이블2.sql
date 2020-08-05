--6월 1일 테이블.sql
--emp21 테이블 생성 
create table emp21(
empno number(38) primary key
 ,ename varchar2(100)
 ,sal int
);

--emp21테이블에 job컬럼을 추가
alter table emp21 add(job varchar2(50));

select * from emp21;

--job 컬럼 크기를 50에서 30으로 변경
alter table emp21 modify(job varchar2(30));

--job 컬럼을 삭제해 보세요
alter table emp21 drop column job;

insert into emp21 values(11,'을지문덕',1000);
insert into emp21 values(12,'김유신',2000);
select * from emp21;

--emp21테이블의 구조는 남기고 모든 행 레코드를 삭제
truncate table emp21;

--emp21 테이블명을 tbl_emp21 테이블명으로 변경
rename emp21 to tbl_emp21;

select * from tbl_emp21;

--현재 접속중인 week사용자로 사용할 수 있는 테이블명을 알고자 할 경우
select table_name from user_tables order by table_name desc;

--tbl_emp1 테이블 삭제하면 레코드 뿐만 아니라 테이블 구조까지 함께 삭제
drop table tbl_emp21;









