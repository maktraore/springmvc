<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<link rel="stylesheet" href="assets/mystyle.css" />
</head>
<body>
	<h2>Login Page</h2>
	
	<c:if test="${not empty givenException }">
		<h3 ><span>Error: <c:out value="${givenException.message}" /></span></h3>
	</c:if>
	<c:if test="${not empty confirmedUser }">
		<h3 style="color: green;"><c:out value="${confirmedUser.firstName}" /> has been successfully registered</h3>
	</c:if>
	
	<c:if test="${not empty status }">
		<h3 style="color: red;">Username or Password is wrong</h3>
	</c:if>
	
	<c:choose>
		<c:when test="${not empty retrievedUser }">
			<h3>You are already logged in....</h3>
			<form action="logout" method="post">
				<input type="submit" value="Logout" />
			</form>
		</c:when>
		<c:otherwise>
		<sf:form action="userPage" method="post" modelAttribute="newLogin">
			<sf:input path="username" type="text" name="username" placeholder="username..." /><br>
			<sf:input path="password" type="password" name="password" placeholder="Enter password..." /><br>
			<input type="submit" value="Login" />
		</sf:form>
		<p>You don't have an account? <a href="toRegister">Register</a></p>
		</c:otherwise>
	</c:choose>
	<p> <a href="home"> To home</a> </p> 
</body>

</html>
