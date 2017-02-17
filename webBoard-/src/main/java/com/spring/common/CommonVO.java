package com.spring.common;

public class CommonVO {
	private String page;
	private String pagesize;
	private String start_row;
	private String end_row;
	
	
	
	private String option="";
	private String keyword="";
	
	private String order_by;
	private String order_sc;
	
	private String start="";
	private String end="";
	
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getPagesize() {
		return pagesize;
	}
	public void setPagesize(String pagesize) {
		this.pagesize = pagesize;
	}
	public String getStart_row() {
		return start_row;
	}
	public void setStart_row(String start_row) {
		this.start_row = start_row;
	}
	public String getEnd_row() {
		return end_row;
	}
	public void setEnd_row(String end_row) {
		this.end_row = end_row;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getOrder_by() {
		return order_by;
	}
	public void setOrder_by(String order_by) {
		this.order_by = order_by;
	}
	public String getOrder_sc() {
		return order_sc;
	}
	public void setOrder_sc(String order_sc) {
		this.order_sc = order_sc;
	}
	
	
}
