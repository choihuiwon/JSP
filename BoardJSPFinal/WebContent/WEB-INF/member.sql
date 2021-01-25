select passwd from member where id like 'test01' and name like '최희';

select * from (select ceil(rownum/7) as pagenum, bno, title, bdate, bcount, writer, content, blike, bhate, comment_count from (select b.*, nvl(c.comment_count, 0) as comment_count from board b, (select bno, count(*) as comment_count from BOARD_COMMENT group by bno) c where b.bno = c.bno(+) order by b.bno desc)) where pagenum = 1;

select * from board_file_list;

insert into board_file_list(bno, writer, filename) values(124,'admin','1.jpg');

select * from (select ceil(rownum / 5) as page, qno, title, content, wdate, writer, status, response from (select * from qna order by status asc, qno desc)) where page = 1;
	


