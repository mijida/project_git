package model;

import java.sql.Date;

/*
 * DTO(Data Tranfer Object):데이타를 전송하는 객체로
 *                          테이블의 레코드 하나를 저장할 수 
 *                          있는 자료구조
 * 
 * 
 */
public class BbsDTO {
	private String no;
	private String id;
	private String title;
	private String content;
	private String visitCount;
	private java.sql.Date postDate;
	private String name;
	
	
	public BbsDTO() {}

	public BbsDTO(String no, String id, String title, String content, String visitCount, Date postDate) {
		super();
		this.no = no;
		this.id = id;
		this.title = title;
		this.content = content;
		this.visitCount = visitCount;
		this.postDate = postDate;
	}
	//게터/세터

	public String getNo() {
		return no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getVisitCount() {
		return visitCount;
	}

	public void setVisitCount(String visitCount) {
		this.visitCount = visitCount;
	}

	public java.sql.Date getPostDate() {
		return postDate;
	}

	public void setPostDate(java.sql.Date postDate) {
		this.postDate = postDate;
	}
	
	
	
}
