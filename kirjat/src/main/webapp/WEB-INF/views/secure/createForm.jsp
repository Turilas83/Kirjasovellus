<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
<title><spring:message code="kirj.create.title" /></title>
<link rel="stylesheet" type="text/css"
	href="../resources/styles/common.css">
<link rel="stylesheet" type="text/css"
	href="../resources/styles/form.css">
</head>
<body>

	<div id="langsel">
		<a href="?lang=en">en</a> | <a href="?lang=fi">fi</a>
	</div>
	<div id="header">
		<sec:authorize access="isAuthenticated()"><p>Käyttäjä: <sec:authentication
				property="principal.username" />  | <a
				href="../j_spring_security_logout">Kirjaudu ulos</a></p>
		</sec:authorize>
	</div>
	<h1>
		<spring:message code="kirj.create.heading" />
	</h1>



	<form:form modelAttribute="kirja" method="post">
		<fieldset>
			<legend>
				<spring:message code="kirj.create.legend" />
			</legend>

			<spring:hasBindErrors name="kirja">
				<p class="Virheotsikko">
					<spring:message code="kirj.create.errors" />
					:
				</p>
				<div class="Virheblokki">
					<form:errors path="*" />
				</div>
			</spring:hasBindErrors>

			<p>
				<form:label path="nimi">
					<spring:message code="kirj.create.name" />
				</form:label>
				<br />
				<form:input path="nimi" cssErrorClass="VirheellinenKentta" />
				<form:errors path="nimi" cssClass="Virheteksti" />
			</p>
			<p>
				<form:label path="tekija">
					<spring:message code="kirj.create.author" />
				</form:label>
				<br />
				<form:input path="tekija" cssErrorClass="VirheellinenKentta" />
				<form:errors path="tekija" cssClass="Virheteksti" />
			</p>
			<p>
				<form:label path="isbn">
					<spring:message code="kirj.create.isbn" />
				</form:label>
				<br />
				<form:input path="isbn" cssErrorClass="VirheellinenKentta" />
				<form:errors path="isbn" cssClass="Virheteksti" />
			</p>
			<p>
				<form:label path="julkaisuvuosi">
					<spring:message code="kirj.create.published" />
				</form:label>
				<br />
				<form:input path="julkaisuvuosi" cssErrorClass="VirheellinenKentta" />
				<form:errors path="julkaisuvuosi" cssClass="Virheteksti" />
			</p>
			<p>
				<form:label path="painos">
					<spring:message code="kirj.create.print" />
				</form:label>
				<br />
				<form:input path="painos" cssErrorClass="VirheellinenKentta" />
				<form:errors path="painos" cssClass="Virheteksti" />
			</p>
			<p>
				<button type="submit">
					<spring:message code="kirj.create.add" />
				</button>
			</p>

		</fieldset>
	</form:form>
	
</body>
</html>