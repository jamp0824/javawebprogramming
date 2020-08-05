/*	1.조인(join) 이란? 하나 이상의 테이블을 서로 합쳐서 데이터를 조회하기 위해서 사용하는 것을 말한다.
 *  2. cross join이란? 2개 이상의 테이블을 조인할 때 where절에 의한 공통되는 컬럼(필드)에 의한 결합이 
 *	발생되지 않는 경우를 뜻한다. 이 조인을 하면 테이블의 전체 행에 대한 컬럼이 조인된다.
 */
--조인실습을 위한 테이블 생성
--dept05 부서테이블 생성
create table dept05(
deptno number(38) primary key --부서번호
,dname varchar2(100) --부서명
);
insert into dept05 values(10,'관리부');
insert into dept05 values(20,'영업부');
insert into dept05 values(30,'연구부');

select *from dept05 order by deptno asc; --부서번호 기준으로 오름차순 정렬

--사원테이블 emp05
create table emp05(
empno number(38) primary key --사원번호
,ename varchar2(100) --사원명
,job varchar2(100) --직종
,sal int --급여
,comm int --보너스
,deptno number(38) --부서번호
);
insert into emp05 values(7001, '홍길동','관리사원',1500,0,10);
insert into emp05 values(7002, '이순신','영업사원',1200,100,20);
insert into emp05 values(7003, '강감찬','영업사원',1300,130,20);
insert into emp05 values(7004, '신사임당','연구원',2000,20,30);
update emp05 set deptno=20 where ename='이순신';

select * from emp05 order by empno; --asc문이 생략된 
select * from dept05, emp05; --cross join=>3*4=12 개행 레코드가 검색

--강의실 테이블 room
create table room(
 roomno int primary key --강의실 호수
 ,roomname varchar2(100) --강의실 담당 샘
);
insert into room values(301,'홍길동 샘');
insert into room values(302,'이순신 샘');
select * from room order by roomno asc;

--학생 테이블 st03
create table st03(
 stno number(38) primary key --학번
 ,stname varchar2(100) --학생명
 ,roomno int --강의실 호수
);
insert into st03 values(1,'홍길순 학생',301);
insert into st03 values(2,'강감찬 학생',302);
insert into st03 values(3,'신사임당 학생',302);
select * from st03 order by stno asc;

select * from room,st03; --cross join

select * from room,st03 where room.roomno = st03.roomno; --Equi 조인
select stno,stname,room.roomno,roomname from room,st03 where room.roomno=st03.roomno and stname='신사임당 학생';

select stno,stname,room.roomno,roomname from room,st03 where room.roomno=st03.roomno and stname like '%길%';
/* 1.like 검색 연산자는 정확한 검색어를 모를 경우 사용한다.
 * 2.%는 와일드 카드는 하나이상의 임의의 모르는 문자와 매핑대응.
 */

select stno,stname,r.roomno,roomname from room r,st03 s where r.roomno=s.roomno and s.stname like '신%'; --테이블 별칭 r,s

/* Non Equi Join 특징)
 *	1.조인 조건의 특징 범위 내에 있는지를 조사하기 위해 where 조인 조건으로 =연산자 이외의 비교 연산자를 사용한다.
 *  2.where 절의 특정 범위를 급여 등급으로 하는 salgrade 테이블을 생성한다.
 *   grade필드(급여등급) LOSAL(최소급여) HISAL(최대급여) 
 *    1					700 		1200
 *    2					1201		1400
 *    3					1401 		2000
 */
--SALGRADE 테이블 생성
create table salgrade(  
 grade number(38) primary key --급여등급
  ,LOSAL number(38) --최소급여
  ,HISAL number(38) --최대급여
);
insert into salgrade values(1,700,1200);
insert into salgrade values(2,1201,1400);
insert into salgrade values(3,1401,2000);

select * from SALGRADE order by grade asc;

select ename,sal,grade from emp05,salgrade
where sal between LOSAL AND HISAL;
/* 1.where 조건절에서 특정범위내의 조인 조건으로 검색하는 기법을 NON EQUI JOIN이라고 한다.
 */

select e.ename,e.sal,s.grade from emp05 e,salgrade s
where e.sal >= s.LOSAL and e.sal <= s.HISAL;

/* 1.사원테이블 emp05와 부서테이블 dept05는 부서번호가 같다라는 공통 컬럼레코드값을 기준으로 하는 EQUI JOIN
 * 을 사용한다.
 * 2.급여 등급 테이블 SALGRADE는 non equi join
 * 결국 3개의 테이블이 조인된다. equi join+non equi join
 */
select e.ename,e.sal,s.grade,d.dname from emp05 e,salgrade s,dept05 d
where e.deptno=d.deptno --equi join기법의 조건
and e.sal between s.LOSAL AND S.HISAL; --NON EQUI JOIN

/* 미국 표준협회 ANSI에서 제시한 조인문)
 *  1.ANSI cross join문 실습 
 */
create table depart11(
 dept_code varchar2(10)  primary key--강의실 호수
 ,dept_name varchar2(100) not null --강의실 담당 샘
);
insert into depart11 values('301','신사임당샘');

select * from depart11 order by dept_code asc;

--학생테이블 student11생성
create table student11(
 st_no number(38) primary key --학생번호
 ,st_name varchar2(50) --학생명
 ,st_gender varchar2(10) --성별
 ,dept_code varchar2(10) --강의실 호수
);

insert into student11 values(11,'홍길동','남',301);
insert into student11 values(12,'홍길순','여',303);
insert into student11 values(13,'강감찬','남',303);

--미국 표준협회에서 제시한 cross join 
select * from depart11 cross join student11; --2**3=6개 행 레코드 검색

--on조건절을 사용한 미국 표준협회 즉 ANSI에서 제시한 inner join
select * from depart11 inner join student11 on depart11.dept_code=student11.dept_code;

--강감찬 학생을 inner join으로 검색
select st_no,st_name,st_gender,depart11.dept_code,dept_name
from depart11 inner join student11 on depart11.dept_code=student11.dept_code
and st_name='강감찬';

--using절문을 사용한 inner join
select st_no,st_name,st_gender,dept_code,dept_name from depart11 inner join student11
using (dept_code);

--natural join
select * from depart11 natural join student11;

--ANSI outer join 실습
create table dept21( 
 deptno number(20)		--부서번호
 ,dname varchar2(50)	--부서명
);
insert into dept21 values(10,'ACCOUNTING');
insert into dept21 values(20,'RESEARCH');

select * from dept21 order by deptno asc;

create table dept22(
 deptno number(20)
 ,dname varchar(20)
);
insert into dept22 values(10,'ACCOUNTING');
insert into dept22 values(30,'SALES');
select * from dept22 order by deptno;

select * from dept21 left outer join dept22 on dept21.deptno=dept22.deptno;
select * from dept21 right outer join dept22 using (deptno);
--left outer join+right outer join = full outer join
select * from dept21 full outer join dept22 using (deptno);


