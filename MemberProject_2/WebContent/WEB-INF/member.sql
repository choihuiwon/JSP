drop table member cascade constraint;

--아이디 - 25글자, 암호 - 50글자, 이름 - 10글자, 나이 - 숫자
create table member(
	id varchar2(25 byte) primary key,
	pass varchar2(50 byte) not null,
	name varchar2(30 byte),
	age number
);

select * from member;

