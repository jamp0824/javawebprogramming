create table member(
mem_id varchar2(50) not null
,mem_pwd varchar2(20) not null
,mem_name varchar2(50) not null
,mem_phone varchar2(4000) not null
);

create table memberT1(  
id varchar2(50) not null
,pw varchar2(50) not null
,name varchar2(50) not null
,email varchar2(100) not null
);

select * from memberT1;

select * from MEMBER;

create table users(
name varchar(20) not null,
id varchar(20) primary key,
pw varchar(20) not null,
phone1 char(10),
phone2 char(10),
phone3 char(10),
gender char(10)

);

select * from users;

insert into member values('abc1234','1234567','이순신','010-777-7777');


update member set mem_name='홍길동';
\


select b_no_seq.nextval from dual;




select * from depart11 inner join student11 on depart11.dept_code=student11.dept_code;




select * from boardT where b_no =2 or b_no =3;


create table emp100(   
empno number(20) primary key --사원번호
,ename varchar(30)
,sal number(38)
,deptno int --부서번호
);

drop table emp100;
insert into emp100 values(21,'홍길동',1500,10);
insert into emp100 values(22,'홍길순',2000,10);
insert into emp100 values(23,'이순신',1200,20);
insert into emp100 values(24,'강감찬',1500,20);
insert into emp100 values(25,'신사임당',3000,30);
insert into emp100 values(26,'세종대왕',2500,30);

select deptno, avg(sal) from emp100 group by deptno having avg(sal)>2000;











































