package com.spring.common;

public class Util {

	//integer 반환 메서드
		public static int nvl(String text){
			return nvl(text,0);
		}
		
		public static int nvl(String text, int def){
			int ret=def;
			
			try {
				ret=Integer.parseInt(text);
				System.out.println("유틸값"+ret);
			} catch (Exception e) {
				// TODO: handle exception
				ret=def;
			}
			
			return ret;
		}
}
