<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="com.techgate.util.GeneralFunction"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String prdtName = request.getParameter("vNumberId").replaceAll("\\<[^>]*>","");


ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext) application.getAttribute("context");
GeneralFunction generfunc = (GeneralFunction) context.getBean("generalFunction");
long phoneword = generfunc.phoneWord(prdtName.toUpperCase().trim());

%>
<input type="hidden" name="phoneWordNo" value="<%=phoneword%>">
<h4 class="text-center margin-top-10 colorwhite">Phone number for <b><%=prdtName.toUpperCase()%></b> &nbsp; is : <b><%=phoneword%></b> </h4>