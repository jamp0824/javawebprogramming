--6월 2일 insert
--insert실습을 위한 emp26 테이블 생성
create table emp26(  
empno number(38) primary key --사원번호
 ,ename varchar2(100) --사원명
 ,LOC varchar2(50) --사는 지역
);
--컬럼명 역순으로 레코드 저장
insert into emp26 (LOC,ename,empno) values ('서울','홍길동',11);
select * from emp26;

--컬럼명 목록을 생략하는 경우는 테이블 생성시 생성된 컬럼개수와 순번이 일치해야 한다
--전체 컬럼에 자료 저장시에는 컬럼목록을 생략한다.
insert into emp26 values(12,'이순신','부산');

--서브 쿼리로 자료 저장하기
--테이블 구조만 복제한 emp27테이블 생성
create table emp27 as select * from emp26 where 10=0;
--조건을 거짓으로 하면 테이블 구조만 복제되고 레코드는 복제한다;
select * from emp27;

insert into emp27 select * from emp26; --서브쿼리로 emp27테이블에 자료만 저장

--insert all문을 위한 원본테이블 emp28생성
create table emp28(   
empno number(20) primary key --사원번호
,ename varchar(30)
,sal number(38)
,LOC varchar2(50)
,depno int --부서번호
);
desc emp28; --emp28 테이블 구조 파악
describe emp28;

select * from emp28;

insert into emp28 values(101,'강감찬',1000,'서울시 마포구',10);
insert into emp28 values(102,'이순신',1500,'서울시 서대문구',20);
insert into emp28 values(103,'세종대왕',2000,'서울시 양천구',20);

select * from emp28 order by empno asc;

--empno,ename,sal 컬럼만 복제한 emp29테이블 생성. 레코드는 복제안함
create table emp29 as select empno,ename,sal from emp28 where 7=0;
select * from emp29;

/* 문제) emp28원본테이블의 empno, ename, LOC컬럼만 복제한 EMP30테이블을 생성하자
 *	레코드는 복제하지 않는다. emp30테이블 생성하고 사원번호 기준으로 내림차순 정렬한다.
 */
create table emp30 as select empno,ename,LOC from emp28 where 7=0;
select * from emp30 order by empno desc;

--다중 테이블에 다중 레코드 저장실습
insert all 
into emp29 values(empno,ename,sal)
into emp30 values(empno,ename,LOC)
select empno,ename,sal,LOC from emp28
where depno=20;
/* 	emp28원본테이블의 부서번호가 20번인 사원번호,사원명,급여,사는지역을 검색해서 emp29테이블에서 사원번호,
 *  사원명,급여만 저장하고,emp30테이블에는 사원번호,사원명,사는 지역을 동시 저장한다.
 */

--empno,ename,deptno컬럼만 복제한 emp31생성
create table emp31 as select empno,ename,depno from emp28 where 1=0;

select * from emp31 order by empno asc;

--empno,ename,sal필드(컬럼) 만 복제한 emp32 생성한다
create table emp32 as select empno,ename,sal from emp28 where 1=0;

select * from emp32 order by empno asc; --asc문 생략가능 ->오름차순정렬

--조건에 맞는 레코드만 복수개의 테이블에 다중행 저장 실습)
insert all
when sal >=1000 then --급여가 1000이상인 경우만 다중행 저장
into emp32 values(empno,ename,sal)

when depno=20 then --부서번호가 20번인 경우만 다중레코드 저장
into emp31 values(empno,ename,depno)
select empno,ename,sal,depno from emp28;
