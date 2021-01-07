create table board(
	bno number primary key,
	title varchar2(150),
	bdate date default sysdate,
	bcount number default 0,
	writer varchar2(25),
	content varchar2(500),
	blike number default 0,
	bhate number default 0,
	constraint board_fk_member foreign key (writer) references member(id)
);

insert into board (bno,title, writer,content) values(bno_seq.nextval,'제목1','test01','내용1');
insert into board (bno,title, writer,content) values(bno_seq.nextval,'제목2','test01','내용2');
insert into board (bno,title, writer,content) values(bno_seq.nextval,'제목3','test01','내용3');

select * from board;

create table board_comment(
	cno number primary key,
	bno number,
	content varchar2(150),
	cdate date default sysdate,
	writer varchar2(25),
	blike number default 0,
	bhate number default 0,
	constraint board_comment_fk_board foreign key (bno) references board(bno),
	constraint board_comment_fk_member foreign key (writer) references member(id)
);

insert into board_comment (cno, bno, content, writer) values(cno_seq.nextval, 1, '댓글1','test01');
insert into board_comment (cno, bno, content, writer) values(cno_seq.nextval, 1, '댓글2','test01');
insert into board_comment (cno, bno, content, writer) values(cno_seq.nextval, 1, '댓글3','test02');
insert into board_comment (cno, bno, content, writer) values(cno_seq.nextval, 1, '댓글4','test02');


create SEQUENCE bno_seq
increment by 1
start with 1
nomaxvalue;

create SEQUENCE cno_seq
increment by 1
start with 1
nomaxvalue;


update board set bcount = bcount +1 where bno = 22;
commit;