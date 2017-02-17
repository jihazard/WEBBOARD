package com.spring.board.admin.controller;

import java.awt.Color;
import java.awt.Dimension;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.parsing.Location;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kennycason.kumo.CollisionMode;
import com.kennycason.kumo.WordCloud;
import com.kennycason.kumo.WordFrequency;
import com.kennycason.kumo.bg.PixelBoundryBackground;
import com.kennycason.kumo.font.scale.LinearFontScalar;
import com.kennycason.kumo.nlp.FrequencyAnalyzer;
import com.kennycason.kumo.palette.ColorPalette;
import com.spring.board.admin.service.AdminService;
import com.spring.board.admin.vo.CityVO;
import com.spring.board.admin.vo.MemberVO;
import com.spring.board.service.BoardService;
import com.spring.board.vo.BoardVO;
import com.spring.common.Page.Paging;
import com.spring.common.excel.ListExcelView;
import com.spring.common.graph.ChartMake;


import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.*;
import  java.net.*;

import twitter4j.DirectMessage;
import twitter4j.GeoLocation;
import twitter4j.Query;
import twitter4j.QueryResult;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.auth.AccessToken;
import twitter4j.auth.RequestToken;
import twitter4j.conf.ConfigurationBuilder;

@Controller
@RequestMapping(value="/admin2")
public class Admincontroller {
	 Logger logger = Logger.getLogger(this.getClass());
	@Autowired
	public BoardService boardService;
	
	@Autowired
	public AdminService adminService;
	
	public String key="";
	public String value="";
	
	
	@RequestMapping(value="/admin2.do")
	public String adminindex(@ModelAttribute BoardVO bvo,   Model model , HttpServletRequest request){
			
		logger.info("start"+bvo.getStart()+"//"+bvo.getEnd());
				
		List<BoardVO> list=boardService.boardlist(bvo);
		
		model.addAttribute("data",list);
		logger.info("start"+list.toString());
		MemberVO mvo=new MemberVO();
		
		List<MemberVO>list1=adminService.memberlist(mvo);
		Map<String,Integer> memberAgelist=adminService.memberAgeList();
		ChartMake.pieChart(request, memberAgelist,"연령별 통계");
		 Map<String,Integer> list2=adminService.membersexlist();
		 
		ChartMake.barChart(request, list2, "bar"); 					
		logger.info("1.size()"+list1.size());
		model.addAttribute("list",list1);
		
		
			
		return "admin2/admin2";
				
	}
	
	
	
	
	
	
	@RequestMapping(value="/excel.do",method=RequestMethod.GET)
	public ModelAndView adminExcel(@ModelAttribute BoardVO bvo) {
		
		logger.info("excel 호출 성공");
		
		//
		Paging.setPage(bvo);
		List<BoardVO> list=boardService.boardlist(bvo);
		ModelAndView mv=new ModelAndView(new ListExcelView());
		mv.addObject("titles",list);
		mv.addObject("template","board.xlsx");
		mv.addObject("file_name","board");
		
		return mv;
	}
	
	
	@RequestMapping(value="/adminstatic.do")
	public String adminstatic(@ModelAttribute MemberVO mvo,Model model,HttpServletRequest request){
		logger.info("static 호출 성공");
		
		List<MemberVO>list1=adminService.memberlist(mvo);
		Map<String,Integer> memberAgelist=adminService.memberAgeList();
		ChartMake.pieChart(request, memberAgelist,"agestatic");
		
	     Map<String,Integer> list2=adminService.membersexlist();
	    // ChartMake.pieChart(request, list2, "sexstatic");
	     ChartMake.barChart(request, list2, "bar");
	     
	     
							
		logger.info("1.size()"+list1.size());
		model.addAttribute("list1",list1);
		
		
		  return "admin2/adminstatic";
	}
	
	@ResponseBody
	@RequestMapping(value="/adadmin.do")
	public Map<String, Integer> adadmin(Model model){
		Map<String, Integer> citylist=adminService.citylist();
		List<CityVO> list2=adminService.citylist2();
		model.addAttribute("list",list2);
		model.addAttribute("map",citylist);
		
		return citylist;
	}
	
	@RequestMapping(value="/adadmin2.do")
	public String adadmin2(Model model){
		Map<String, Integer> citylist=adminService.citylist();
		List<CityVO> list2=adminService.citylist2();
		model.addAttribute("list",list2);
		model.addAttribute("map",citylist);
		
		return "admin2/static";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/adadmin3.do", method= RequestMethod.GET)
	public String adadmin3(HttpServletRequest request,Model model,HttpSession session) throws TwitterException {
		logger.info("adadmin3데이터 호출성공");
		
		
				
		Twitter twitter = new TwitterFactory().getInstance();
		//twitter로 접근한다.
		twitter.setOAuthConsumer("1iH9zEVk88hxhhBK8yENr8p5i", "Dqavvun3kDkNj7LNauTavj4nKuio2GSwEqjJJxYlokjs0uAwpt");
		//성공시 requestToken에 해당정보를 담겨져온다.
		RequestToken requestToken =  twitter.getOAuthRequestToken();
		logger.info("여기됨?1");
		//requestToken 을 반드시 세션에 담아주어야 한다.
		request.getSession().setAttribute("requestToken", requestToken);

		String url="success";
		String uri=requestToken.getAuthorizationURL();  //접속할 url값이 넘어온다.
		key=requestToken.getToken(); //token값을 가져온다.
		value=requestToken.getTokenSecret(); //token Secret값을 가져온다.
		logger.info("여기됨?2");
		logger.info("url"+uri+"//"+key+"//"+value);
		logger.info("tokensession"+request.getRequestedSessionId()+session.getValue("requestToken"));
          

		
		
		return uri;
	}
	
	@ResponseBody
	@RequestMapping(value="/twitter.do", method= RequestMethod.GET)
	public String twitter(HttpServletRequest request,Model model,HttpSession session) throws TwitterException {
		logger.info("twitter 호출됨?");
		String msg="";
		
		 ConfigurationBuilder cb = new ConfigurationBuilder();
		    cb.setDebugEnabled(true)
		            .setOAuthConsumerKey("1iH9zEVk88hxhhBK8yENr8p5i")
		            .setOAuthConsumerSecret("Dqavvun3kDkNj7LNauTavj4nKuio2GSwEqjJJxYlokjs0uAwpt")
		            .setOAuthAccessToken("829895408281202689-UODSSQH8DpaWvuU9yfoP8NMsZyRyCBB")
		            .setOAuthAccessTokenSecret("dK4sDHy4dFi7caxMK0MSNCnXAS3KDMLhYLviK3jH0DWdu");

		    TwitterFactory tf = new TwitterFactory(cb.build());
		    Twitter twitter = tf.getInstance();
			
		

		
		
        try {
        	
			//트윗 불러오기
			/*List<Status> statuses = twitter.getHomeTimeline();
		    System.out.println("Showing home timeline.");
		    for (Status status : statuses) {
		        System.out.println(status.getUser().getName() + ":" +
		                           status.getText());*/
        	//메시지 보내기
       	  
        
        	/*try {
								
				 for(int i=1 ; i<200; i++){
		       		   Random r=new Random();
		       		   int x=r.nextInt(1);
		        	DirectMessage directMessage = twitter.sendDirectMessage("@JiYong_Bene", "자동 테스트메시지"+i+x);
		        	Thread.sleep(1000);
		        	logger.info("i: "+i);
				
				 }
				
        	} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	*/
       	   
       	  
       	   
       	   
            // 이 팩토리인스턴스는 재이용가능하고 thread safe 합니다.
          /*  String ss="@greatbookbookin";
            Status status = twitter.updateStatus(ss);
            System.out.println("Successfully updated the status to [" + status.getText() + "].");
        	*/
		   
        	 // 이 팩토리인스턴스는 재이용가능하고 thread safe합니다.
         
        	
        	//트위터 서치
        	List<Status> tweets = new ArrayList<Status>();
        	int wantedTweets = 200;
        	long lastSearchID = Long.MAX_VALUE;
        	int remainingTweets = wantedTweets;
        	
          /*  Query query = new Query("이재용");
            QueryResult result = twitter.search(query);
            for (Status status : result.getTweets()) {
                System.out.println("@" + status.getUser().getScreenName() + ":" + status.getText());
         */
        	 Query query = new Query("이재용");
                while(remainingTweets > 0)
                {
                  remainingTweets = wantedTweets - tweets.size();
                  if(remainingTweets > 100)
                  {
                    query.count(100);
                  }
                  else
                  {
                   query.count(remainingTweets); 
                  }
                  QueryResult result = twitter.search(query);
                  tweets.addAll(result.getTweets());
                  Status s = tweets.get(tweets.size()-1);
                  long firstQueryID = s.getId();
                  query.setMaxId(firstQueryID);
                  remainingTweets = wantedTweets - tweets.size();
                }
                
                for (Status status : tweets) {
                	 System.out.println(status.getText());
                }
                System.out.println("tweets.size() "+tweets.size() );   
                
                model.addAttribute("tweet",tweets);
       
        	
        	
				
				/*String key1 =request.getParameter("oauth_token");
				String value1=request.getParameter("oauth_verifier");
				
				logger.info(value1+"//"+key1);
				logger.info(key+"//"+value);
				 
				
				AccessToken accessToken =null;
				accessToken= new AccessToken(key, value);
				logger.info("여기됨?3");
				twitter.setOAuthAccessToken(accessToken);
				logger.info("여기됨?4");
				DirectMessage directMessage = twitter.sendDirectMessage("@JiYong_Bene", "자동 테스트메시지");
				
				logger.info("여기됨?5");*/
        	
        /*	
        	Query query = new Query("이재용");  
                
              query.setSince("2017-2-10");  
              //query.setUntil("2011-10-31");  
                
              QueryResult result;  
                
                
            try {  
              for(GeoLocation lo : new Location().locations) {  
                query.setGeoCode(lo, 500, Query.KILOMETERS);  
                int pagenum = 1;  
                int totaltwit = 0;  
                while(true) {  
                  query.setPage(pagenum);  
                  result = twitter2.search(query);  
                    
                   
                  for(Tweet tweet:result.getTweets()) { 
                    System.out.println(tweet.getText()); 
                  } 
                    
                  //System.out.println(result.getTweets().size());  
                  totaltwit = totaltwit + result.getTweets().size();  
                  if(result.getTweets().size() < 100) {  
                    break;  
                  }  
                  pagenum++;  
                }  
                System.out.println("Totaltwit: " + totaltwit);  
              }  
                
            } catch (Exception e) {  
              // TODO Auto-generated catch block  
              e.printStackTrace();  
            }  
            //System.out.println(count+"");  
              
              
          }  */
			
			
		
		} catch (TwitterException te) {
            te.printStackTrace();
            logger.info("Failed to send a direct message: " + te.getMessage());
            System.exit(-1);
		
		
	}
        return msg;
	
	
	}
	

	/* kumo

	@ResponseBody
	@RequestMapping(value="/wordcloud.do")
	public String wordcloud(Model model) throws IOException, NullPointerException{
		logger.info("여기 됨?");
		String file1 = "C:/TEMP/stop_words.txt";
		String file = "C:/TEMP/stop_words.txt";
		
		List<String> lines = IOUtils.readLines(getInputStream(file));
		FrequencyAnalyzer frequencyAnalyzer = new FrequencyAnalyzer();
		frequencyAnalyzer.setWordFrequenciesToReturn(300);
		logger.info("여기됨? 1");
		frequencyAnalyzer.setMinWordLength(4);
		loadStopWords();
		frequencyAnalyzer.setStopWords(lines);
		logger.info("여기됨? 2");
		
		final List<WordFrequency> wordFrequencies = frequencyAnalyzer.load(Thread.currentThread().getContextClassLoader().getResourceAsStream(file1));
		logger.info("여기됨? 3");
		final Dimension dimension = new Dimension(500, 312);
		final WordCloud wordCloud = new WordCloud(dimension, CollisionMode.PIXEL_PERFECT);
		wordCloud.setPadding(2);
		logger.info("여기됨? 4");
		wordCloud.setBackground(new PixelBoundryBackground("/graph/whale_small.png"));
		wordCloud.setColorPalette(new ColorPalette(new Color(0x4055F1), new Color(0x408DF1), new Color(0x40AAF1), new Color(0x40C5F1), new Color(0x40D3F1), new Color(0xFFFFFF)));
		wordCloud.setFontScalar(new LinearFontScalar(10, 40));
		logger.info("여기됨? 5");
		wordCloud.build(wordFrequencies);
		wordCloud.writeToFile("/graph/whale_wordcloud_small.png");
		
		
		
		return "success";
	}
	
	 private Set<String> loadStopWords() throws NullPointerException {
		 String file = "c:\\temp\\stop_words.txt";
		 try {
	        	logger.info("여기는 오나요?");
	        	
	        	
	        	
	            final List<String> lines = IOUtils.readLines(getInputStream(file));
	            if (lines.isEmpty()) {
	            	logger.info("여기는 오나요?11");
	                throw new NullPointerException("lines " + lines + " does not exist");
	            }
	           
	          
	            
	            
	            logger.info("여기는 오나요?1");
	            
	            return new HashSet<String>(lines);

	        } catch (IOException e) {
	            logger.info(e.getMessage(), e);
	        }
	        return Collections.emptySet();
	    }

	    private InputStream getInputStream(String path) {
	        return Thread.currentThread().getContextClassLoader().getResourceAsStream(path);
	    }
	*/
	
}	
	
	


