/*  1.SQL문은 다른 프로그래밍 언어와 마찬가지로 산술연산자를 사용할 수 있다.
 *  2. 산술연산자 종류
 *     +(덧셈), -(뺄셈), *(곱셈),/(나눗셈) 
 */
--emp01 테이블생성
create table emp01(
 empnon int primary key --사원번호, int는 정수숫자타입
 ,ename varchar(50) --사원명
 ,sal int --월급
 ,comm int --보너스
);
insert into emp01 values(101,'홍길동',250,25);
insert into emp01 values(102,'이순신',280,28);
insert into emp01 (empno,ename,sal) values(103,'강감찬',200);

--사원번호를 기준으로 내림차순정렬
select * from emp01 order by empnon desc;

--연봉 계산
select ename,sal,sal*12 from emp01;

--출력 결과 컬럼명에 별칭을 주고자 하는 경우는  as문을 사용
select ename,sal,sal*12 as 연봉 from emp01;
select ename,sal as "월급",sal*12 as "연봉" from emp01;

/* NULL 특징) 
 * 1.NULL도 자료의 일종이며 정해지지 않는 값이란 의미이다.미확정,알수 없는 값을 의미한다.
 * 2.어떤값인지 알수 없지만 값은 존재한다.
 */
select ename,sal,sal*12,sal*12+comm from emp01;--강감찬 사원의 보너스는 null이기 때문에 
--sal*12+comm=null이된다. 이 문제를 해결하기 위해서 오라클에서는 NULL을 0또는 다른값으로 변환하기 위한 함수
--nvl함수를 제공한다.
select ename,sal,sal*12+comm,nvl(comm,0),sal*12+nvl(comm,0) from emp01;
--nvl(comm,0)함수는 보너스에서 NULL을 0으로 변경

/* distinct 키워드 특징)
 *  동일한 레코드값이 중복되어 있으면 한번만 출력되게 한다.
*/
create table test01(
	no number(38)
	,name varchar2(20)
);
insert into test01 values(10,'홍길동');
insert into test01 values(10,'세종대왕');
insert into test01 values(10,'신사임당님');

select no,name from test01;
select distinct no,name from test01;

/* 오라클 비교연산자 종류)
 *  =(같다),>(~보다 크다),<(~보다 작다),>=(~보다 크거나 같다),<=(~보다 작거나 같다),
 *  <>,!=,^=(같지 않다)
 */
select ename,sal from emp01;
select ename,sal from emp01 where sal <>200;
--월급이 200이 아닌 사원명과 급여가 검색

select *from test01;
insert into test01 values(20,'FORD');

select no,name from test01 where name='ford';
--쿼리문은 대소문자를 구분하지 않지만 컬럼 레코드값 영문자는 대소문자를 구분한다.

select name from test01 where name='FORD';
/* 오라클 논리 연산자 종류)
 * 	1.and: 두가지 조건 모두 만족해야 레코드가 검색된다.
 * 	2.or: 두가지 조건중에서 한가지만 만족해도 레코드가 검색된다.
 *  3.not : 조건에 만족하지 못하는 것만 검색된다.
 */
select * from TEST01 where no=10 and name='홍길동';
select * from test01 where no=10 or name='FORD';
select * from test01 where not no=10;

select * from emp01;

select ename,sal from emp01 where sal between 200 and 250;
--between 200 and 250연산자는 급여가 200이상이고 250이하인 레코드를 검색한다. 즉 sal>=200 and sal
-- <= 250이하 조건과 같다.

/* 컬럼명 in(A,B,C) 연산자 특징)
 * 1.컬럼 레코드가 A,B,C중 어느 하나만 만족하더라도 검색한다.
 */
select ename,sal from emp01 where sal in(100,200,300);
select ename,sal from emp01 where sal not in(100,200,300);
--급여가 100,200,300이 아닌 자료를 검색

select name from test01 where name like 'F%';
--%는 하나이상의 임의의 모르는 문자와 매핑대응.

select * from emp01;
select empnon,ename from emp01 where ename like '%길%';

select ename from EMP01 where ename like '__동';
--like는 검색연산자, _는 임의의 모르는 한문자와 매핑대응._

select ename from emp01 where ename not like '%길%';
--이름중에 길이 포함안된 이름을 검색

select * from emp01 where comm is null; --보너스 중에 null인 경우만 검색

select sal from emp01 order by sal asc;--order by는 정렬문이다. asc는 오름차순정렬
--생략 가능하다.
select  sal from EMP01 order by sal desc;--desc는 내림차순 정렬. desc는 생략 불가능

select 100*120 from dual; --dual테이블은 오라클 연산결과값, 함수값,시퀀스 값 등 출력용도로 활용됨.
/* 문제) dual테이블의 컬럼하나를 cmd에서 확인해 본다.
 */

/* 오라클 숫자함수)
 * ABS(절대값), FLOOR(소수점 아래를 버림)
 */
select -10, abs(-10) from dual;
select 34.5678, FLOOR(34.5678)from dual;

select 34.5678, round(34.5678,2) from dual; --round(34.5678,2)함수는 주어진 2의 뜻은 소수점
--셋째 자리에서 반올림하여 소수점 이하 둘째자리까지 표시

select mod(26,5) from dual; --mod함수는 나머지를 구함
select upper('seoul')from dual; --upper()함수는 영문대문자로 변경
select lower('BUSAN')from dual; --lower()함수는 영문 소문자로 변경
select initcap('welcome to oracle')from dual; --initcap()함수는 단어별 첫글자만 영문대문자로
--하고 나머지는 영문소문자로 한다.

select length('oracle')from dual; --length()함수는 길이를 구함.
select substr('oracle',4,3) from dual; --4번째 문자부터 세문자까지만 추출
select instr('oracle','a')from dual;

select LTRIM('Oracle')from dual; --Ltrim()함수는 왼쪽 공백을 제거
select rtrim('oracle')from dual; --rtrim()함수는 오른쪽 공백을 제거
select trim('oracle')from dual; --trim()함수는 양쪽 공백을 제거

select sysdate from dual; --sysdate는 오라클 날짜함수

/* to_char() : 날짜형 또는 숫자형을 문자형으로 변환하는 함수이다. 
*  to_date() : 문자형을 날짜형으로 변환
*  to_number() : 문자형을 숫자형으로 변환
*/

--emp01테이블 삭제
drop table emp01;

--decode 함수 실습
create table emp01(
	deptno number(10) --부서번호
   ,ename varchar2(30) --사원명	
);
insert into emp01 values(10,'MILLER');
insert into emp01 values(20,'smith');
insert into emp01 values(20,'jones');
insert into emp01 values(30,'allen');

select * from emp01;

select ename,deptno,decode(deptno,10,'ACCOUNTING',
						          20,'RESEARCH',
						          30,'SALE')
						          AS DNAME
FROM EMP01;

--CASE 함수
select ename,deptno,
	   case when deptno=10 then 'ACCOUNTING'
	   	    when deptno=20 then 'RESEARCH'
	   	    when deptno=30 then 'SALES'
	   END as DNAME
from emp01;
