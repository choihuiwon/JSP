drop table member cascade constraint;

--아이디 - 25글자, 암호 - 50글자, 이름 - 10글자, 나이 - 숫자
create table member(
	id varchar2(25 byte) primary key,
	pass varchar2(50 byte) not null,
	name varchar2(30 byte),
	age number
);

alter table member add grade number default 1;

select * from nls_database_parameters where parameter like '%CHARACTERSET%';

select * from member;
delete from member;
insert into member values('A0001', '123456', '홍길동',33,1);