--6월 1일 단일행과 다중행 서브쿼리.sql
--dept15 테이블 생성
create table dept15(   
 deptno number(10) primary key --부서번호   
 ,dname varchar2(100) --부서명   
);
insert into dept15 values(10, '관리부');
insert into dept15 values(20, '영업부');
insert into dept15 values(30, '연구부');

select * from dept15 order by deptno asc;

create table emp15( -- 사원테이블    
empno number(38) primary key --사원번호
,ename varchar2(100) --사원명
,job varchar2 (100) --직종
,sal number(38) --보너스
,comn number(38)
,deptno number(10) --부서번호
); 
drop table emp15;
insert into emp15 values(21,'홍길동','관리사원',1500,0,10);
insert into emp15 values(22,'이순신','영업사원',1200,100,20);
insert into emp15 values(23,'강감찬','영업사원',1500,200,20);
insert into emp15 values(24,'신사임당','연구사원',3000,300,30);
insert into emp15 values(25,'세종대왕','연구사원',2500,250,30);

select * from emp15 order by empno;

--단일행 서브쿼리문 실습
select dname from dept15 where deptno=(select deptno from emp15 where ename='홍길동');
--사원들의 평균월급
select avg(sal) from emp15;

select ename, sal from emp15 where sal > (select avg(sal)from emp15);
--사원평균 급여보다 더 많이 받는 사원검색하는 단일행 서브쿼리.

select distinct deptno from emp15 where sal >=1200; --distinct 키워드는 중복 부서번호 제거

select ename,sal,deptno from emp15 where deptno in (select distinct deptno from emp15 where sal >=1200);
/* 서브쿼리 검색 결과 레코드가 복수개인 경우는 다중행 서브쿼리 연산자를 사용해야 한다. in 다중행 서브쿼리 연산자는 
 * 서브쿼리문 결과 레코드 중 하나라도 일치하면 참이 된다.
 */

--20번 영업부서의 최대급여
select max(sal) from emp15 group by deptno having deptno =20;
--group by 조건문을 걸때는 having을 쓴다.
select ename,sal,deptno from emp15 where sal >(select max(sal)from emp15 group by deptno having deptno=20);
--20번 부서 최대급여보다 큰 사원을 검색하는 단일행 서브쿼리문

--20번 영업부서의 급여를 검색
select sal from emp15 where deptno=20;

select ename,sal,deptno from emp15 where sal > all (select sal from emp15 where deptno=20);
/*	> all은 다중행 서브쿼리 연산자로 20번 영업부서 사원급여중 최대 급여 보다 크면 참값을 반환한다. 즉 영업부 사원의 최대 급여보다 
 * 큰 사원명, 급여, 부서번호를 검색한다.
 */

--20번 영업부서의 최소급여
select min(sal) from emp15 group by deptno having deptno=20;

select ename,sal from emp15 where sal >(select min(sal) from emp15 group by deptno having deptno=20);
--20번 영업부서 최소 급여보다 큰 사원명, 급여를 검색하는 단일행 서브쿼리문

select ename,sal from emp15 where sal > any(select sal from emp15 where deptno=20); 
/*	>any는 다중형 서브쿼리 연산자로 20번 부서의 급여중 최소값보다 크면 참이된다. 결국 20번 부서의 최소급여보다 
 *	큰 사원명과 급여를 검색한다.
 */

select * from emp16;

--서브쿼리로 emp15의 테이블구조와 레코드까지 복제한 복제 테이블 emp16을 생성
create table emp16 as select * from emp15;

--emp15의 원하는 컬럼만 복제한 emp17테이블 생성. 선택된 컬럼과 레코드만 복제된다.
create table emp17 as select empno,ename,sal,deptno from emp15;

select * from emp15; select * from emp17;

--30번 부서만 복제
create table emp18 as select * from emp15 where deptno=30;

select * from emp18;

--emp15의 테이블 구조만 복제하고 레코드는 복제하지 않기 위해서는 where조건식을 거짓으로 만들면 된다.
create table emp19 as select * from emp15 where 10=0;

select * from emp19;