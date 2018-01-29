http://blog.daum.net/mindus/15564655

CREATE TABLE MEMBER_TB (    
	seq 		NUMBER(5) NOT NULL,
	id 			VARCHAR2(16) NOT NULL, 			--ID
	password 	VARCHAR2(16) NOT NULL,			--패스워드
	name		VARCHAR2(30) NOT NULL,			--이름 
	pnumber 	VARCHAR2(16),					--핸드폰번호
	birth 		DATE,							--태어난일자
	email 		VARCHAR2(64) NOT NULL,			--이메일
	regdate  	DATE DEFAULT SYSDATE, 			--등록날짜
	CONSTRAINT PK_MEMBER PRIMARY KEY(seq)
);
CREATE SEQUENCE SEQ_MEMBER INCREMENT BY 1 START WITH 1;
-- INSERT INTO MEMBER_TB ( seq, id, password, pnumber, birth, email ) VALUES ( SEQ_MEMBER.NEXTVAL , ?, ?, ?, ?, ?);

CREATE TABLE EVENT_TB (
	member_seq NUMBER(5),		--해당 이벤트를 소유하는 유저
	event_seq NUMBER(5),
	title VARCHAR2(60),			--메모셋 이름
	start_date DATE,				--event시작시각
	end_date DATE,				--event종료시각	
	color VARCHAR2(8),
	CONSTRAINT PK_EVENT PRIMARY KEY(member_seq, event_seq),
	CONSTRAINT FK_EVENT_MEMBER FOREIGN KEY(member_seq) REFERENCES MEMBER_TB(seq)
);


CREATE TABLE EVENT_MEMO_TB (
	member_seq NUMBER(5),		--해당 이벤트를 소유하는 유저
	event_seq NUMBER(5),
	memo_set_seq NUMBER(3),		--해당 메모가 포함된 메모셋
	memo_seq NUMBER(3),
	CONSTRAINT PK_EVENT_MEMO PRIMARY KEY(member_seq, event_seq),
	CONSTRAINT FK_EVENT_MEMO_EVENT FOREIGN KEY(member_seq, event_seq) REFERENCES EVENT_TB(member_seq, event_seq)
);

CREATE TABLE MEMO_SET_TB(
	member_seq NUMBER(5),		--해당 메모셋를 소유하는 유저
	seq NUMBER(3),	
	name VARCHAR2(60),			--메모셋 이름
	CONSTRAINT PK_MEMO_SET PRIMARY KEY(seq),
	CONSTRAINT FK_MEMO_SET_MEMBER FOREIGN KEY(member_seq) REFERENCES MEMBER_TB(seq)
);
CREATE SEQUENCE SEQ_MEMO_SET INCREMENT BY 1 START WITH 3;
-- seq=1(월별메모), seq=2(이벤트메모) 
-- INSERT INTO MEMO_SET_TB ( seq ) VALUES ( ?, SEQ_MEMO_SET.NEXTVAL , ?);
INSERT INTO MEMO_SET_TB ( seq ) VALUES (1, 1, 'Diary');

CREATE TABLE MEMO_TB(
	set_seq NUMBER(3),		--해당 메모가 포함된 메모셋
	seq NUMBER(3),	
	name VARCHAR2(60),			--메모 제목
	contents VARCHAR2(256),		--메모 내용
	CONSTRAINT PK_MEMO PRIMARY KEY(set_seq, seq),
	CONSTRAINT FK_MEMO_MEMO_SET FOREIGN KEY(set_seq) REFERENCES MEMO_SET_TB(seq)
);
-- INSERT INTO MEMO_TB ( sSeq, seq,  ) VALUES ( ?, SEQ_MEMO.NEXTVAL, ?);
INSERT INTO MEMO_TB VALUES ( 1, (select nvl(max(seq), 0)+1 from MEMO_TB where set_seq = 1), 'test중이지욥', '어쩌고');

CREATE TABLE HOUSE_KEEPING_BOOK_TB(
	member_seq NUMBER(5),		--해당 가계부를 소유하는 유저
	seq NUMBER(5),
	pay_date DATE,				--구매날짜
	pay_place VARCHAR2(32),		--구매장소 
	pay_things VARCHAR2(64),	--구매상품
	price NUMBER(10),			--구매가격
	CONSTRAINT PK_HOUSE_KEEPING_BOOK PRIMARY KEY(member_seq, seq),
	CONSTRAINT FK_MEMO FOREIGN KEY(member_seq) REFERENCES MEMO_SET(seq)
)
-- CREATE SEQUENCE SEQ_HOUSE_KEEPING_BOOK INCREMENT BY 1 START WITH 1;
-- INSERT INTO HOUSE_KEEPING_BOOK_TB ( sSeq, seq,  ) VALUES ( ?, SEQ_MEMO.NEXTVAL, ?);

CREATE TABLE FRIEND_TB(
	friend_seq NUMBER(5),
	me_member_seq NUMBER(5),		--해당 가계부를 소유하는 유저
	you_member_seq NUMBER(5),	
	create_date DATE,				--구매날짜
	CONSTRAINT PK_FRIEND PRIMARY KEY(friend_seq),
	CONSTRAINT FK_FRIEND_ME_MEMBER FOREIGN KEY(me_member_seq) REFERENCES MEMBER_TB(seq),
	CONSTRAINT FK_FRIEND_YOU_MEMBER FOREIGN KEY(you_member_seq) REFERENCES MEMBER_TB(seq)
);
CREATE SEQUENCE SEQ_FRIEND INCREMENT BY 1 START WITH 1;
INSERT INTO FRIEND_TB( friend_seq, me_member_seq, you_member_seq, create_date) VALUES( SEQ_FRIEND.NEXTVAL, ?, ?, sysdate);

CREATE TABLE TALK_TB(
	member_seq NUMBER(5),
	talk_seq NUMBER(5),
	writer_seq NUMBER(5),
	contents_talk VARCHAR2(300),	
	contents_uploadfile_path VARCHAR2(64),	
	create_date DATE,				
	CONSTRAINT PK_TALK PRIMARY KEY(member_seq, talk_seq),
	CONSTRAINT FK_TALK_ME_MEMBER FOREIGN KEY(member_seq) REFERENCES MEMBER_TB(seq),
	CONSTRAINT FK_TALK_WRITER_MEMBER FOREIGN KEY(writer_seq) REFERENCES MEMBER_TB(seq)
);
SELECT m.seq, m.id, m.seq, m.name from FRIEND_TB f join MEMBER_TB m on f.you_member_seq = m.seq where f.me_member_seq = 1;


