<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="com.techgate.util.GeneralFunction"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String prdtName = request.getParameter("vNumberId").replaceAll("\\<[^>]*>","");
ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext) application.getAttribute("context");
GeneralFunction generfunc = (GeneralFunction) context.getBean("generalFunction");
int sum = generfunc.sumNumber(prdtName.replaceAll("\\s+","").trim());

int a = String.valueOf(sum).length();
int twoDigit = 0;

if (a > 2) {
    sum = generfunc.sumNumber(String.valueOf(sum));
    a = String.valueOf(sum).length();
} else if (a == 2) {
    //save 
    twoDigit = sum;
    sum = generfunc.sumNumber(String.valueOf(sum));
    a = String.valueOf(sum).length();
    if (a == 2) {
        //save 
        //twoDigit = sum;
        sum = generfunc.sumNumber(String.valueOf(sum));

    }
} 

%>
<center><p>Two Digit Result : <b><%=twoDigit%></b> &nbsp;&nbsp; Single Digit Result : <b><%=sum%></b> </p></center>