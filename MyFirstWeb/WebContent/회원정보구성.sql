create table izone_member(
	user_id varchar(20) primary key,
	user_pw varchar(20) not null,
	user_name varchar(12) not null,
	user_email varchar(50) not null,
	user_reg_date date default current_timestamp
);

insert into izone_member (user_id, user_pw, user_name, user_email)
values('abcd1234','aaa1234!','김말이','kim@naver.com');

select user_id from izone_member where user_id='abc1234';

select * from izone_member;