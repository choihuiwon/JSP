select * from member where id like 'admin' and passwd like '123456';

select * from member;

create table qna(
	qno number primary key,
	title varchar2(100),
	content varchar2(4000),
	wdate date default sysdate,
	writer varchar2(25),
	status number default 0,	-- 미확인 -0, 확인 -1, 답변완료 -2
	response varchar2(4000),
	constraint qna_member_fk foreign key (writer) references member(id)
);

select * from (select ceil(rownum / 5) as page, qno, title, content, wdate, writer, status, response from (select * from qna order by status asc, qno desc)) where page = 1;

drop table qna;
delete from qna;
create sequence qno_seq start with 1;

select * from qna;

select * from qna where writer = 'test01' order by qno desc;

select ceil(rownum / 5) as page, qno, title, content, wdate, writer, status, response
from (select * from qna where writer = 'test01' order by qno desc);

select * from (select ceil(rownum / 5) as page, qno, title, content, wdate, writer, status, response
from (select * from qna where writer = 'test01' order by qno desc)) where page = 1;

select * from (select ceil(rownum / 5) as page, qno, title, content, wdate, writer, status, response
from qna order by qno desc) where page = 1;

select * from QNA where status = 0 or status = 1;

select * from (select ceil(rownum / 5) as page, qno, title, content, wdate, writer, status, response from (select * from qna order by status asc, qno desc)) where page = 2;