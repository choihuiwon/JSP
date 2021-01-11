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
select * from board_comment;

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

select count(*) from board_comment where bno = 2 group by bno;

select * from BOARD_COMMENT where bno=1 order by cdate desc;

-- 페이징
--step1 정렬 : 정렬 기준 - 날짜 또는 글번호
select b.*, nvl(c.comment_count, 0) as comment_count
from board b, (select bno, count(*) as comment_count from BOARD_COMMENT group by bno) c
where b.bno = c.bno(+) order by b.bno desc;

-- step2 처음부터 게시글 7개만 조회
select rownum, bno, title, bdate, bcount, writer, content, blike, bhate 
from
	(select b.*, nvl(c.comment_count, 0) as comment_count 
	 from board b, (select bno, count(*) as comment_count
					from BOARD_COMMENT group by bno) c 
	 where b.bno = c.bno(+) order by b.bno desc)
where rownum <= 7;


-- setp3
select *
from
	(select rownum as rn, bno, title, bdate, bcount, writer, content, blike, bhate 
	from
		(select b.*, nvl(c.comment_count, 0) as comment_count 
		 from board b, (select bno, count(*) as comment_count
						from BOARD_COMMENT group by bno) c 
		 where b.bno = c.bno(+) order by b.bno desc))
where rn between 8 and 15;

-- 페이지 번호 구해서 where
select * 
from
(select ceil(rownum/7) as pagenum, bno, title, bdate, bcount, writer, content, blike, bhate, comment_count 
from
	(select b.*, nvl(c.comment_count, 0) as comment_count 
	 from board b, (select bno, count(*) as comment_count
					from BOARD_COMMENT group by bno) c 
	 where b.bno = c.bno(+) order by b.bno desc))
 where pagenum = 2;
