--6월 4일 트랜잭션.sql
--트랜잭션 실습을 위한 테이블 생성
create table dept51(  
 deptno number(20) primary key --부서번호
 ,dname varchar(50) --부서명
);
insert into dept51 values(101,'영업부');
insert into dept51 values(102,'인사부');

select * from dept51 order by deptno asc; --부서번호를 기준으로 오름차순 정렬

--복제본 테이블 dept52를 생성
create table dept52 as select * from dept51;

select * from dept52;

drop table dept52; --dept 52테이블 삭제
delete from dept52;

insert into dept52 values(10,'ACCOUNTING');
insert into dept52 values(20,'RESEARCH');
insert into dept52 values(30,'SALES');
insert into dept52 values(40,'MANAGER');
select * from dept52 order by deptno;

































