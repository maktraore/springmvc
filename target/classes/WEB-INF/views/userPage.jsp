<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>User Page</h2>
	<c:if test="${not empty newLogin }">
		<h3>Hi <c:out value="${newLogin.username}" />, you are logged in.</h3>
	</c:if>
	<h3>Hi ${retrievedUser.firstName}, you are logged in</h3>
	<c:choose>
		<c:when test="${not empty retrievedUser}" >
			<form action="logout" method="post">
				<input type="submit" value="Logout" />
			</form>
		</c:when>
	    <c:otherwise>
			<p><a href="toRegister">Register</a></p>
			<p><a href="toLogin">login</a></p>
		</c:otherwise>
	</c:choose>
	<a href="home"> To home</a>  
</body>

</html>