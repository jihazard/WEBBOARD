package com.spring.board.vo;

import org.springframework.web.multipart.MultipartFile;

import com.spring.common.CommonVO;


public class BoardVO extends CommonVO {
		private int b_num =0;
		private String b_name ="";
		private String b_title ="";
		private String b_content ="";
		private String b_date ="";
		private String b_pwd ="";
		private String b_file= "";
		private MultipartFile file;
		private int hit =0;
		private int step =0;
		private int bgroup =0;
		private int bindent =0;
		private int total=0;
		
		private String option ="";
		private String keyword="";
		
		
		
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
		public int getB_num() {
			return b_num;
		}
		public void setB_num(int b_num) {
			this.b_num = b_num;
		}
		public String getB_name() {
			return b_name;
		}
		public void setB_name(String b_name) {
			this.b_name = b_name;
		}
		public String getB_title() {
			return b_title;
		}
		public void setB_title(String b_title) {
			this.b_title = b_title;
		}
		public String getB_content() {
			return b_content;
		}
		public void setB_content(String b_content) {
			this.b_content = b_content;
		}
		public String getB_date() {
			return b_date;
		}
		public void setB_date(String b_date) {
			this.b_date = b_date;
		}
		public String getB_pwd() {
			return b_pwd;
		}
		public void setB_pwd(String b_pwd) {
			this.b_pwd = b_pwd;
		}
		public String getB_file() {
			return b_file;
		}
		public void setB_file(String b_file) {
			this.b_file = b_file;
		}
		public MultipartFile getFile() {
			return file;
		}
		public void setFile(MultipartFile file) {
			this.file = file;
		}
		public int getHit() {
			return hit;
		}
		public void setHit(int hit) {
			this.hit = hit;
		}
		public int getStep() {
			return step;
		}
		public void setStep(int step) {
			this.step = step;
		}
		public int getBgroup() {
			return bgroup;
		}
		public void setBgroup(int bgroup) {
			this.bgroup = bgroup;
		}
		public int getBindent() {
			return bindent;
		}
		public void setBindent(int bindent) {
			this.bindent = bindent;
		}
		
		
		
		
}
