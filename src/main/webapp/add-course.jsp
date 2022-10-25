<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<htm>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center><form action="">
<h1>Add Course's</h1>
Enter The Course Duration : 
<input type="number" name="duration"/><br/><br/>	
Start The Course: 
<input type="Date" name="startDate"/><br/><br/>
End The Course: 
<input type="Date" name="endDate"/><br/><br/>
Enter The HOD Name : 
<input type="txt" name="hod"/><br/><br/>	
<input type="Submit" value="Save"/><br/><br/>
</form></center>
<c:if test="${param.duration != null }">
	<jsp:useBean id="beanDao" class="infinite.college_complaint_project.DAO"/>
	<jsp:useBean id="beancourse" class="infinite.college_complaint_project.Course"/>
	
	<jsp:setProperty property="duration" name="beancourse"/>
	<jsp:setProperty property="hod" name="beancourse"/>
	<fmt:parseDate value="${param.startDate}" pattern="yyyy-MM-dd" var="cd1"/>
	
	<c:set var="sqlDate1" value="${beanDao.convertDate(cd1)}" />
	<c:out value="${sqlDate1}"/>
	
	<fmt:parseDate value="${param.endDate}" pattern="yyyy-MM-dd" var="cd2"/>
	<c:set var="sqlDate2" value="${beanDao.convertDate(cd2)}"  />
	<c:out value="${sqlDate2}"/>
	
	<jsp:setProperty property="startDate" name="beancourse" value="${sqlDate1}"/>
	<jsp:setProperty property="endDate" name="beancourse" value="${sqlDate2}"/>
	<c:out value="${beanDao.Addcourse(beancourse)}"></c:out>
	
	</c:if>

</body>
</html>