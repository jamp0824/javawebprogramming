create table tbl_guest1(
g_no number(38) primary key
, g_name varchar2(50) not null
, g_title varchar2(200) not null
, g_pwd varchar2(20) not null
, g_cont varchar2(4000) not null
, g_date date
);

alter table tbl_guest1 add g_pwd varchar(20) not null
select * from tbl_guest order by g_no desc;

create sequence g_no_seq
start with 1
increment by 1
nocache;
select g_no from tbl_guest1 where g_no= 5;

select g_no_seq1.nextval from dual;

select sysdate from dual;
