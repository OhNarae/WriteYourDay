sqlplus mysystem/myoracle@myoracledb.carphrhrboim.ap-northeast-2.rds.amazonaws.com:1521/ORCL

--유저정보
CREATE TABLE MEMBER_TB (    
	seq 		NUMBER(5) NOT NULL,
	id 			VARCHAR2(16) NOT NULL, 		--ID
	password 	VARCHAR2(16) NOT NULL,			--패스워드
	name		VARCHAR2(30) NOT NULL,			--이름 
	pnumber 	VARCHAR2(16),				--핸드폰번호
	birth 		DATE,					--태어난일자
	email 		VARCHAR2(64) NOT NULL,			--이메일
	regdate  	DATE DEFAULT SYSDATE, 			--등록날짜
	CONSTRAINT PK_MEMBER PRIMARY KEY(seq)
);
CREATE SEQUENCE SEQ_MEMBER INCREMENT BY 1 START WITH 1;

--이벤트정보
CREATE TABLE EVENT_TB (
	member_seq NUMBER(5),			--해당 이벤트를 소유하는 유저번호
	event_seq NUMBER(5),			--이벤트 번호
	title VARCHAR2(60),			--메모셋 이름
	start_date DATE,				--event시작시각
	end_date DATE,				--event종료시각	
	color VARCHAR2(8),			--event표현Color
	CONSTRAINT PK_EVENT PRIMARY KEY(member_seq, event_seq),
	CONSTRAINT FK_EVENT_MEMBER FOREIGN KEY(member_seq) REFERENCES MEMBER_TB(seq)
);

--이벤트공유정보
CREATE TABLE EVENT_SHARE_TB(
	member_seq NUMBER(5),		--해당 이벤트를 소유하는 유저번호
	event_seq NUMBER(5),		--이벤트 번호
	you_member_seq NUMBER(5),	--이벤트 공유 요청을 받는 유저번호
	status NUMBER(2),		--요청상태: 0:요청, 1:승낙, 2:거절, 3:취소
	req_date DATE,			--요청날짜
	resp_date DATE,			--응답날짜
	cancle_date DATE,			--취소날짜
	CONSTRAINT PK_EVENT_SHARE PRIMARY KEY(member_seq, event_seq, you_member_seq)
);

--이벤트, 메모 관계 정보
CREATE TABLE EVENT_MEMO_TB (
	member_seq NUMBER(5),		--해당 이벤트를 소유하는 유저
	event_seq NUMBER(5),		--이벤트 번호
	memo_set_seq NUMBER(3),		--해당 메모가 포함된 메모셋
	memo_seq NUMBER(3),		--메모번호
	CONSTRAINT PK_EVENT_MEMO PRIMARY KEY(member_seq, event_seq),
	CONSTRAINT FK_EVENT_MEMO_EVENT FOREIGN KEY(member_seq, event_seq) REFERENCES EVENT_TB(member_seq, event_seq)
);

--메모셋 정보
CREATE TABLE MEMO_SET_TB(
	member_seq NUMBER(5),		--해당 메모셋를 소유하는 유저
	seq NUMBER(3),			--메모셋 번호
	name VARCHAR2(60),		--메모셋 이름
	CONSTRAINT PK_MEMO_SET PRIMARY KEY(member_seq, seq),
	CONSTRAINT FK_MEMO_SET_MEMBER FOREIGN KEY(member_seq) REFERENCES MEMBER_TB(seq)
);
-- seq=1(월별메모), seq=2(이벤트메모) 

-- 메모 정보 
CREATE TABLE MEMO_TB(
	member_seq NUMBER(5),		--해당 메모셋를 소유하는 유저
	set_seq NUMBER(3),		--해당 메모가 포함된 메모셋
	seq NUMBER(3),			--메모 번호
	name VARCHAR2(60),		--메모 제목
	contents VARCHAR2(256),		--메모 내용
	CONSTRAINT PK_MEMO PRIMARY KEY(member_seq, set_seq, seq)
);

--가계부 정보
CREATE TABLE CASHBOOK_TB(
	member_seq NUMBER(5),		--해당 가계부를 소유하는 유저
	seq NUMBER(5),			--구매번호
	pay_date DATE,			--구매날짜
	pay_place VARCHAR2(32),		--구매장소 
	pay_things VARCHAR2(64),		--구매상품
	price NUMBER(10),		--구매가격
	CONSTRAINT PK_HOUSE_KEEPING_BOOK PRIMARY KEY(member_seq, seq),
	CONSTRAINT FK_MEMO FOREIGN KEY(member_seq) REFERENCES MEMBER_TB(seq)
)

-- 친구 정보
CREATE TABLE FRIEND_TB(
	me_member_seq NUMBER(5),		--해당 가계부를 소유하는 유저번호
	you_member_seq NUMBER(5),		--친구 유저번호
	create_date DATE,				--구매날짜
	CONSTRAINT PK_FRIEND PRIMARY KEY(me_member_seq, you_member_seq),
	CONSTRAINT FK_FRIEND_ME_MEMBER FOREIGN KEY(me_member_seq) REFERENCES MEMBER_TB(seq),
	CONSTRAINT FK_FRIEND_YOU_MEMBER FOREIGN KEY(you_member_seq) REFERENCES MEMBER_TB(seq)
);

-- 게시판 정보
CREATE TABLE TALK_TB(
	member_seq NUMBER(5),			--해당 게시판을 소유하는 유저번호	
	talk_seq NUMBER(5),			--게시판글 번호
	writer_seq NUMBER(5),			--게시판글의 글쓴이의 유저번호
	contents_talk VARCHAR2(300),		--게시판글 내용
	contents_uploadfile_path VARCHAR2(64),	--게시판글의 사진 업로드 주소
	create_date DATE,				--게시판글 등록일자
	CONSTRAINT PK_TALK PRIMARY KEY(member_seq, talk_seq),
	CONSTRAINT FK_TALK_ME_MEMBER FOREIGN KEY(member_seq) REFERENCES MEMBER_TB(seq),
	CONSTRAINT FK_TALK_WRITER_MEMBER FOREIGN KEY(writer_seq) REFERENCES MEMBER_TB(seq)
);



