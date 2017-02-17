package com.spring.common.Page;

import com.spring.common.CommonVO;
import com.spring.common.Util;

public class Paging {
	
		public static void setPage(CommonVO cvo){
			
			int page=Util.nvl(cvo.getPage(),1);
			int pagesize=Util.nvl(cvo.getPagesize(),4);
			
			if( cvo.getPage()==null) cvo.setPage(page+"");
			if( cvo.getPagesize()==null) cvo.setPagesize(pagesize+"");
			
			int start_row=(page-1)*pagesize+1;
			int end_row=(page-1)*pagesize+pagesize;
			
			cvo.setStart_row(start_row+"");
			cvo.setEnd_row(end_row+"");
			
			System.out.println("페이징 스타트 엔드"+start_row+"//"+end_row);
			
		}

}
