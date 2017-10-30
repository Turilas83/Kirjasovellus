<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags"  prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
<title><spring:message code="kirj.view.booklist"/></title>
<link rel="stylesheet" type="text/css" href="resources/styles/common.css">
 <link rel="stylesheet" type="text/css" href="resources/styles/form.css">  
</head>	
<body>
	
	<div id="langsel">
		<a href="?lang=en">en</a> | <a href="?lang=fi">fi</a>
	</div>
		
		<h1><spring:message code="kirj.view.booklist"/></h1>
		<div id="kirjalista">
		<table>
			<tr>
				<th><spring:message code="kirj.view.name"/></th>
				<th><spring:message code="kirj.view.author"/></th>
				<th><spring:message code="kirj.view.isbn"/></th>
				<th><spring:message code="kirj.view.published"/></th>
				<th><spring:message code="kirj.view.print"/></th>
			</tr>
			<c:forEach var="kirja" items="${kirjat}">
				<tr>
					<td><c:out value="${kirja.nimi}" default="-----" /></td>
					<td><c:out value="${kirja.tekija}" default="-----" /></td>
					<td><c:out value="${kirja.isbn}" default="-----" /></td>
					<td><c:out value="${kirja.julkaisuvuosi}" default="-----" /></td>
					<td><c:out value="${kirja.painos}" default="-----" /></td>
				</tr>
			</c:forEach>
		</table>	
	</div>
	<p><a href="../kirjat"><spring:message code="welcome"/></a>
</body>
</html>