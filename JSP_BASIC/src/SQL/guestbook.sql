create table guestbook(
g_no number(38) primary key 
,g_name varchar2(50) not null
,g_title varchar2(200) not null
,g_pwd	varchar2(20) not null
,g_cont varchar2(4000) not null
,g_date date
);

select * from GUESTBOOK order by g_no desc;