<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags"  prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
<title><spring:message code="kirj.view.title"/></title>
<link rel="stylesheet" type="text/css" href="resources/styles/common.css">
<link rel="stylesheet" type="text/css" href="resources/styles/form.css">
</head>	
<body>
	
	<div id="langsel">
		<a href="?lang=en">en</a> | <a href="?lang=fi">fi</a>
	</div>
	<div id="header">
		<sec:authorize access="isAuthenticated()"><p>Käyttäjä: <sec:authentication
				property="principal.username" />  | <a
				href="../../j_spring_security_logout">Kirjaudu ulos</a></p>
		</sec:authorize>
	</div>
	<fieldset>
	<h1>
		<spring:message code="kirj.view.heading"/>
	</h1>	
	<p><c:out value="${kirja.nimi}" default="-----"/></p>
	<p><c:out value="${kirja.tekija}" default="-----"/></p>
	<p><c:out value="${kirja.isbn}" default="-----"/></p>
	<p><c:out value="${kirja.julkaisuvuosi}" default="-----"/></p>
	<p><c:out value="${kirja.painos}" default="-----"/></p>
	<p><a href="../../booklist"><spring:message code="kirj.view.booklist"/></a>
	<p><a href="../kirjat"><spring:message code="back"/></a>
	</fieldset>
</body>
</html>