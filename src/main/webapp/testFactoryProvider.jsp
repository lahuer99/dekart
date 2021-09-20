<%@page import="com.deloitte.mycart.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>creating SessionFactory object</h1>
	<%
		out.print(FactoryProvider.getFactory());
	%>
</body>
</html>