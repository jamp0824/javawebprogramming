create table tbl_guest2(
g_no number(38) primary key
,g_name varchar2(50) not null
,g_title varchar2(200) not null
,g_pwd varchar2(20) not null
,g_cont varchar2(4000) not null
,g_date date
);

select * from tbl_guest2;

--g_no_seq2 시퀀스 생성
create sequence g_no_seq2 
start with 1
increment by 1
nocache;

--g_no_seq2 시퀀스 번호값 확인 해본다.
select g_no_seq2.nextval from dual;

select sysdate from dual;

