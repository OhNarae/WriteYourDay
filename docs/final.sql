http://blog.daum.net/mindus/15564655

CREATE TABLE MEMBER_TB (    
	seq 		NUMBER(5) NOT NULL,
	id 			VARCHAR2(16) NOT NULL, 			--ID
	password 	VARCHAR2(16) NOT NULL,			--�н�����
	name		VARCHAR2(30) NOT NULL,			--�̸� 
	pnumber 	VARCHAR2(16),					--�ڵ�����ȣ
	birth 		DATE,							--�¾����
	email 		VARCHAR2(64) NOT NULL,			--�̸���
	regdate  	DATE DEFAULT SYSDATE, 			--��ϳ�¥
	CONSTRAINT PK_MEMBER PRIMARY KEY(seq)
);
CREATE SEQUENCE SEQ_MEMBER INCREMENT BY 1 START WITH 1;
-- INSERT INTO MEMBER_TB ( seq, id, password, pnumber, birth, email ) VALUES ( SEQ_MEMBER.NEXTVAL , ?, ?, ?, ?, ?);

CREATE TABLE EVENT_TB (
	member_seq NUMBER(5),		--�ش� �̺�Ʈ�� �����ϴ� ����
	event_seq NUMBER(5),
	title VARCHAR2(60),			--�޸�� �̸�
	start_date DATE,				--event���۽ð�
	end_date DATE,				--event����ð�	
	color VARCHAR2(8),
	CONSTRAINT PK_EVENT PRIMARY KEY(member_seq, event_seq),
	CONSTRAINT FK_EVENT_MEMBER FOREIGN KEY(member_seq) REFERENCES MEMBER_TB(seq)
);


CREATE TABLE EVENT_MEMO_TB (
	member_seq NUMBER(5),		--�ش� �̺�Ʈ�� �����ϴ� ����
	event_seq NUMBER(5),
	memo_set_seq NUMBER(3),		--�ش� �޸� ���Ե� �޸��
	memo_seq NUMBER(3),
	CONSTRAINT PK_EVENT_MEMO PRIMARY KEY(member_seq, event_seq),
	CONSTRAINT FK_EVENT_MEMO_EVENT FOREIGN KEY(member_seq, event_seq) REFERENCES EVENT_TB(member_seq, event_seq)
);

CREATE TABLE MEMO_SET_TB(
	member_seq NUMBER(5),		--�ش� �޸�¸� �����ϴ� ����
	seq NUMBER(3),	
	name VARCHAR2(60),			--�޸�� �̸�
	CONSTRAINT PK_MEMO_SET PRIMARY KEY(seq),
	CONSTRAINT FK_MEMO_SET_MEMBER FOREIGN KEY(member_seq) REFERENCES MEMBER_TB(seq)
);
CREATE SEQUENCE SEQ_MEMO_SET INCREMENT BY 1 START WITH 3;
-- seq=1(�����޸�), seq=2(�̺�Ʈ�޸�) 
-- INSERT INTO MEMO_SET_TB ( seq ) VALUES ( ?, SEQ_MEMO_SET.NEXTVAL , ?);
INSERT INTO MEMO_SET_TB ( seq ) VALUES (1, 1, 'Diary');

CREATE TABLE MEMO_TB(
	set_seq NUMBER(3),		--�ش� �޸� ���Ե� �޸��
	seq NUMBER(3),	
	name VARCHAR2(60),			--�޸� ����
	contents VARCHAR2(256),		--�޸� ����
	CONSTRAINT PK_MEMO PRIMARY KEY(set_seq, seq),
	CONSTRAINT FK_MEMO_MEMO_SET FOREIGN KEY(set_seq) REFERENCES MEMO_SET_TB(seq)
);
-- INSERT INTO MEMO_TB ( sSeq, seq,  ) VALUES ( ?, SEQ_MEMO.NEXTVAL, ?);
INSERT INTO MEMO_TB VALUES ( 1, (select nvl(max(seq), 0)+1 from MEMO_TB where set_seq = 1), 'test��������', '��¼��');

CREATE TABLE CASHBOOK_TB(
	member_seq NUMBER(5),		--�ش� ����θ� �����ϴ� ����
	seq NUMBER(5),
	pay_date DATE,			--���ų�¥
	pay_place VARCHAR2(32),		--������� 
	pay_things VARCHAR2(64),		--���Ż�ǰ
	price NUMBER(10),		--���Ű���
	CONSTRAINT PK_HOUSE_KEEPING_BOOK PRIMARY KEY(member_seq, seq),
	CONSTRAINT FK_MEMO FOREIGN KEY(member_seq) REFERENCES MEMBER_TB(seq)
)
-- CREATE SEQUENCE SEQ_HOUSE_KEEPING_BOOK INCREMENT BY 1 START WITH 1;
-- INSERT INTO HOUSE_KEEPING_BOOK_TB ( sSeq, seq,  ) VALUES ( ?, SEQ_MEMO.NEXTVAL, ?);

CREATE TABLE FRIEND_TB(
	friend_seq NUMBER(5),
	me_member_seq NUMBER(5),		--�ش� ����θ� �����ϴ� ����
	you_member_seq NUMBER(5),	
	create_date DATE,				--���ų�¥
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



