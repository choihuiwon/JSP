create table member(
	id varchar2(25),
	passwd varchar2(50),
	name varchar2(10),
	age number
);

alter table member add primary key (id);

select * from member;
commit;

alter table member add grade number default 1;

create table grade_list(
    grade_no number primary key,
    grade_name varchar2(10 byte)
);

insert into grade_list values(1, 'BRONZE');
insert into grade_list values(2, 'SILVER');
insert into grade_list values(3, 'GOLD');
insert into grade_list values(4, 'VIP');
insert into grade_list values(5, 'VVIP');
insert into grade_list values(6, 'MASTER');