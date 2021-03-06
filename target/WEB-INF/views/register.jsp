<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Registration</title>
<link rel="stylesheet" href="assets/mystyle.css" />
</head>
<body>
<h2>Registration Page</h2>

<c:if test="${not empty givenException }">
	<h3><span>Error: <c:out value="${givenException.message}" /></span></h3>
</c:if>

<sf:form action="register" method="post" modelAttribute="newRegister">
	<sf:input path="firstName" type="text" name="firstName" placeholder="First name..." /><br>
	<sf:input path="lastName" type="text" name="lastName" placeholder="Last name..." /><br>
	<sf:input path="emailAddress" type="email" name="emailAddress" placeholder="Email address..." /><br>
	<sf:input path="username" type="text" name="username" placeholder="username..." /><br>
	<sf:input path="password" type="password" name="password" placeholder="Enter password..." /><br>
	<input type="password" name="confirmPassword" placeholder="Confirm password..." /><br>
	<input type="submit" value="Register" /><br>
</sf:form>
<p> <a href="home"> To home</a> </p> 

Already registered? <a href="toLogin">Login</a>
</body>
</html>
