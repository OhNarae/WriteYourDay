package vo;

import org.springframework.web.multipart.MultipartFile;

public class TalkVO {

	private int member_seq;
	private int talk_seq;
	private int writer_seq;
	private String contents_talk;
	private String contents_uploadfile_path;
	private String create_date;
	private MultipartFile contents_uploadfile;
	private String writer_id;
	private String writer_name;

	public TalkVO() {
		contents_talk ="";
		contents_uploadfile_path ="";
	}
	
	@Override
	public String toString() {
		return "TalkVO [member_seq=" + member_seq + ", talk_seq=" + talk_seq + ", writer_seq=" + writer_seq
				+ ", contents_talk=" + contents_talk + ", contents_uploadfile_path=" + contents_uploadfile_path
				+ ", create_date=" + create_date + ", contents_uploadfile=" + contents_uploadfile + ", writer_id="
				+ writer_id + ", writer_name=" + writer_name + "]";
	}

	public int getMember_seq() {
		return member_seq;
	}

	public void setMember_seq(int member_seq) {
		this.member_seq = member_seq;
	}

	public int getTalk_seq() {
		return talk_seq;
	}

	public void setTalk_seq(int talk_seq) {
		this.talk_seq = talk_seq;
	}

	public int getWriter_seq() {
		return writer_seq;
	}

	public void setWriter_seq(int writer_seq) {
		this.writer_seq = writer_seq;
	}

	public String getContents_talk() {
		return contents_talk;
	}

	public void setContents_talk(String contents_talk) {
		this.contents_talk = contents_talk;
	}

	public String getContents_uploadfile_path() {
		return contents_uploadfile_path;
	}

	public void setContents_uploadfile_path(String contents_uploadfile_path) {
		this.contents_uploadfile_path = contents_uploadfile_path;
	}

	public String getCreate_date() {
		return create_date;
	}

	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}

	public MultipartFile getContents_uploadfile() {
		return contents_uploadfile;
	}

	public void setContents_uploadfile(MultipartFile contents_uploadfile) {
		this.contents_uploadfile = contents_uploadfile;
	}
	
	public String getWriter_id() {
		return writer_id;
	}

	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}

	public String getWriter_name() {
		return writer_name;
	}

	public void setWriter_name(String writer_name) {
		this.writer_name = writer_name;
	}
}
