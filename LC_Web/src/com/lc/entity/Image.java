package com.lc.entity;

public class Image {
	private Integer id;
	private String name;
	private String route;
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
	public String getRoute() {
		return route;
	}
	public void setRoute(String route) {
		this.route = route;
	}
	public String getJspname() {
		return jspname;
	}
	public void setJspname(String jspname) {
		this.jspname = jspname;
	}
	@Override
	public String toString() {
		return "Image [id=" + id + ", name=" + name + ", route=" + route + ", jspname=" + jspname + "]";
	}
	public Image(Integer id, String name, String route, String jspname) {
		super();
		this.id = id;
		this.name = name;
		this.route = route;
		this.jspname = jspname;
	}
	public Image() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
