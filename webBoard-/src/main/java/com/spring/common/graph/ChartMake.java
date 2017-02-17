package com.spring.common.graph;

import java.awt.Color;
import java.awt.Font;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.swing.plaf.basic.DefaultMenuLayout;

import org.apache.log4j.Logger;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;

public class ChartMake {
		 static Logger logger=Logger.getLogger(ChartMake.class);
		 
		 
		 public static void pieChart(HttpServletRequest request, Map<String, Integer> resultMap,String name){
			 String docRoot=request.getSession().getServletContext().getRealPath("/graph");
			 File fileDir=new File(docRoot);
			 if(!fileDir.exists()){
				 fileDir.mkdir();
			 }
			 
			 logger.info("업로드할 경로 "+docRoot);
			 
			 File file = new File(docRoot+"/pieChart"+name+".jpg");
			 FileOutputStream fos=null;
			 try {
				
				 DefaultPieDataset dataset = new DefaultPieDataset();
				 
				 for(Map.Entry<String,Integer> result: resultMap.entrySet()){
					 logger.info(result.getKey()+"="+result.getValue());
					 dataset.setValue(result.getKey(),result.getValue());
					 
				 }
				 
				 
				 
				 JFreeChart chart=ChartFactory.createPieChart(name, dataset, true, true, false );
				 chart.setBackgroundPaint(Color.white);
				 chart.getTitle().setFont(new Font("sansserif",Font.BOLD,14));
				 chart.getLegend().setItemFont(new Font("sansserif",Font.BOLD,14));
				 
				 PiePlot plot=(PiePlot) chart.getPlot();
				 plot.setLabelFont(new Font("sansserif",Font.BOLD,14));
				 
				 fos=new FileOutputStream(file);
				 ChartUtilities.writeChartAsJPEG(fos, chart, 480, 280);
				 
				  
				 
				 
				 
				 
			} catch (Exception e) {
				// TODO: handle exception
			
				e.getMessage();
			
			} finally{
				if(fos !=null){
					try{
						fos.close();
					}catch(IOException e){e.getMessage();}
					
				}
				
			}
						 
		 }
		 
		 
		 
		 public static void barChart(HttpServletRequest request, Map<String, Integer> resultMap,String name){
			 String docRoot=request.getSession().getServletContext().getRealPath("/graph");
			 File fileDir=new File(docRoot);
			 if(!fileDir.exists()){
				 fileDir.mkdir();
			 }
			 
			 logger.info("업로드할 경로 "+docRoot);
			 logger.info("파일명"+name);
			 
			 File file = new File(docRoot+"/pieChart"+name+".jpg");
			 FileOutputStream fos=null;
			 try {
				
				 DefaultCategoryDataset dataset = new DefaultCategoryDataset();
				 
				 for(Map.Entry<String,Integer> result: resultMap.entrySet()){
					 logger.info(result.getKey()+"="+result.getValue());
					 dataset.addValue(result.getValue(),result.getKey(),result.getKey());
					 
				 }
				 
				 
				 
				 JFreeChart chart=ChartFactory.createBarChart(name, "성별(x축)","인원수(y축)" , dataset,PlotOrientation.VERTICAL,true,true,false);
				 chart.setBackgroundPaint(Color.white);
				 chart.getTitle().setFont(new Font("sansserif",Font.BOLD,14));
				 
				 
			     Font font=new Font("sanasserif",Font.BOLD,12);
			     chart.getLegend().setItemFont(font);
				 
			     
			     CategoryPlot plot=chart.getCategoryPlot();
			     
			     //x축
			     plot.getDomainAxis().setLabelFont(font);
			     plot.getDomainAxis().setTickLabelFont(font);
			     //y축 
			     plot.getRangeAxis().setLabelFont(font);
			     plot.getRangeAxis().setTickLabelFont(font);
			     
			     
				 fos=new FileOutputStream(file);
				 ChartUtilities.writeChartAsJPEG(fos, chart, 480, 280);
				 
				  
				 
				 
				 
				 
			} catch (Exception e) {
				// TODO: handle exception
			
				e.getMessage();
			
			} finally{
				if(fos !=null){
					try{
						fos.close();
					}catch(IOException e){e.getMessage();}
					
				}
				
			}
						 
		 } 
		 
		 
}
