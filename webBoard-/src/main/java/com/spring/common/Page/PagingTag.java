package com.spring.common.Page;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class PagingTag extends TagSupport {

	/**
	 *@param page 현재 페이지 번호
	 *@param total 전체 조회된 row 수
	 *@param list_size 페이지에서 보여주는 레코드수 
	 *@param page_size 페이지 네비게이터에 표히되는 페이지의 버튼 갯수 
	 * 
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private int page=1;
	private int total=1;
	private int list_size=10;
	private int page_size=5;
	
	@Override
	public int doStartTag() throws JspException {
		try {
			pageContext.getOut().println(getPaging());
			
			
		} catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return super.doStartTag();
	}
	
	
	public String getPaging(){
		
		String ret="";
		if(page<1)
			page=1;
		if(total<1)
			return "";
		
		//page가 1페이지고 page_size가 2이면 currentFirst는 1
		int currentFirst=((page-1)/page_size) * page_size+1;
		
		int currentLast=(((page-1)/page_size)+1) * page_size+page_size;
		
		int nextFirst=	(((page-1)/page_size)+1) * page_size+1;
		
		int prevLast=	(((page-1)/page_size)-1) * page_size+1;
			
		int lastPage=1;
		lastPage=total/list_size;
		/*//lastPage는 total이 11이고 list_size가 10이면 1을 가진다.
		그래서 총 페이지 수가 나누어 떨어지지 않으면 나머지 레코드를 출력할 페이지가 필요하다는 의미*/
		
		if(total%list_size !=0) lastPage=lastPage+1;
		currentLast=(currentLast>lastPage)?lastPage:currentLast;
		
		ret+= "<div class='paginate'>";
		
		if(page>1){
			ret+="<a href=\"javascript:goPage('1')\">"+"<span><img src='/resources/images/"+"common/btn_paginate_first.gif' alt='처음'/></span></a>";
			
		}else {
			ret+="<span><img src='/resources/images/common/btn_paginate_first.gif' alt='처음'/></span>";
			
			
		}
		if(page<lastPage){
			
			ret+="<a href=\"javascript:goPage('"+lastPage+"')\">"+"<span><img src='/resources/images/"+"common/btn_paginate_last.gif' alt='처음'/></span></a>";
			
		}else {
			ret+="<span><img src='/resources/images/common/btn_paginate_last.gif' alt='처음'/></span>";
			
		}
		if(prevLast>0){
			ret+="<a href=\"javascript:goPage('"+prevLast+"')\">"+"<span><img src='/resources/images/"+"common/btn_paginate_prev.gif' alt='처음'/></span></a>";
			
		}else{
			
			ret+="<span><img src='/resources/images/"+"common/btn_paginate_prev.gif' alt='처음'/></span>";
		}
		
				
		
		for(int j=currentFirst; j<currentFirst+page_size && j<=lastPage; j++){
			if(j<=currentLast){
				if(j==page){
					ret+="<a href='#' class='on textAn'>"+j+"</a>";
					
				}else {
					ret+="<a href=\"javascript:goPage('"+j+"');\""+"class='textAn'>"+j+"</a>";
				}
				
			}
			
		}
		
		
		if(nextFirst<=lastPage){
			ret+="<a href=\"javascript:goPage('"+nextFirst+"')\">"+"<span><img src='/resources/images/"+"common/btn_paginate_next.gif' alt='처음'/></span></a>";
			
			
		}else{
			ret+="<span><img src='/resources/images/"+"common/btn_paginate_next.gif' alt='처음'/></span>";
						
		}
		
		
		ret+="</div>";
		
		
		
		return ret;
		
	}
	
	
	public void setPage(int page) {
		this.page = page;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public void setList_size(int list_size) {
		this.list_size = list_size;
	}
	public void setPage_size(int page_size) {
		this.page_size = page_size;
	}
	
	
		
}
