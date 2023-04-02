package com.techgate.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;  
public class StringToDateExample1 {  
public static void main(String[] args)throws Exception {  
    String sDate1="09/09/1998";  
    
    DateFormat inputFormat = new SimpleDateFormat("MM/dd/yyyy");
    Date date = null;
    //System.out.println(amc_start);
    
    
   
    	date = inputFormat.parse(sDate1);
    	sDate1 = new SimpleDateFormat("yyyy-MM-dd").format(date);
    	
    	sDate1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(Calendar.getInstance().getTime());
    	
    	
       System.out.println(sDate1);
       
       
}  
} 
