/* 그룹함수 종료)
 * 1.SUM(합계), AVG(평균), COUNT(레코드 개수), MAX(최대값), MIN(최소값), STDDEV(표준편차)
 *   ,VARIANCE(분산)
 */
--실습. emp02테이블 생성
create table emp02(
	dept_no number(38) --부서번호
	, ename varchar2(20) --사원명	
	, sal int --월급
	, comm number(38) --보너스
	, job varchar2(20) --업무부서
);
insert into emp02 values(10,'scott',1000,100,'salesman');
insert into emp02 values(10,'tiger',1500,150,'salesman');
insert into emp02 (dept_no,ename,sal,job) values(20,'james',2000,'manager');
insert into emp02 (dept_no,ename,sal,job) values(20,'king',2500,'manager');

select * from emp02 order by dept_no asc;

--전체 사원의 급여합
select sum(sal) from emp02;

select sum(comm) from emp02; 
--보너스 합. 그룹함수를 사용하면 comm필드에서 null을 제외하고 총 합을 구한다. 

select avg(sal) from emp02;
-- 급여 평균
select max(sal), min(sal) from emp02;
-- 최대 급여, 최소 급여

select count(comm) as "보너스를 받는 사원수" from emp02; --null을 제외하고 보너스 받는 사원 수를 헤아림
select count(*) as "전체사원수" from emp02;
select count(job) as "업무수" from emp02;
select count(distinct job) as "중복 업무수를 제외한 업무수" from emp02;
--distinct키워드는 중복 업무수를 제거 

--부서별로 그룹화 시켜서 부서별 급여 평균
 select dept_no,avg(sal) from EMP02 group by dept_no;
 
 select dept_no, sum(sal), avg(sal) from emp02 group by dept_no;--부서별 급여합과 평균
 select dept_no,max(sal), min(sal) from emp02 group by dept_no;--부서별 최대 급여와 최소급여
 select dept_no,count(*), count(comm) from emp02 group by dept_no; --부서별 사원수와 보너스를 받는 사원수
 
 select dept_no, avg(sal) from emp02 group by dept_no having avg(sal) >= 2000;
 --부서별 급여 평균이 2000이상인 경우 부서번호, 부서별 급여 평균을 구함
 
 select dept_no, max(sal), min(sal) from emp02 group by dept_no having max(sal) > 2000;
 --부서별 최대 급여가 2000을 초과한 경우에 맞는 부서번호, 부서별 최대값, 최소값을 구함
 
 




