<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Main</title>
</head>
<body>
<h2>Main Page</h2>
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
</body>

</html>
