package com.lc.entity;

public class Word {
	
	private Integer id;
	
	private String name;
		
	private String content;
	
	private String jspname;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getJspname() {
		return jspname;
	}

	public void setJspname(String jspname) {
		this.jspname = jspname;
	}

	@Override
	public String toString() {
		return "Word [id=" + id + ", name=" + name + ", content=" + content + ", jspname=" + jspname + "]";
	}

	public Word() {
		super();
	}

	public Word(Integer id, String name, String content, String jspname) {
		super();
		this.id = id;
		this.name = name;
		this.content = content;
		this.jspname = jspname;
	}

	
}
