<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String Name = request.getParameter("vParentCategoryId");
session.setAttribute("currentState", Name);
%>