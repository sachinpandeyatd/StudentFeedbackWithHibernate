<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="dao" class="infinite.college_complaint_project.DAO"/>
	<form name="feedbackForm">
		<c:if test="${param.instructor == null }">
			<select id="instructor" name="instructor" onchange="submit()">
				<option selected disabled>SELECT</option>
				<c:forEach var="instructor" items="${dao.instructors() }">
					<option value="${instructor }">${instructor }</option>
				</c:forEach>
			</select>
		</c:if>
		
		<c:if test="${param.instructor != null and param.subject == null }">
			<select name="instructor">
				<option value="${param.instructor }">${param.instructor }</option>
			</select>
			
			<select id="subject" name="subject" onchange="submit()">
				<option selected disabled>SELECT</option>
				<c:forEach var="subject" items="${dao.subjects(param.instructor) }">
					<option value="${subject }">${subject }</option>
				</c:forEach>
			</select>
		</c:if>
		
		<c:if test="${param.instructor != null and param.subject != null }">
			<select name="instructor">
				<option value="${param.instructor }">${param.instructor }</option>
			</select>
			
			<select name="subject">
				<option value="${param.subject }">${param.subject }</option>
			</select>
		</c:if>
	</form>
	
	<br><hr><br>
	
	<c:if test="${param.instructor != null and param.subject != null }">
		<table border=3>
			<tr>
				<th>Feedback Value</th>
				<th>Total Count</th>
			</tr>
			<c:set var="instructor" value="${param.instructor }"/>
			<c:set var="subject" value="${param.subject }"/>
			<c:forEach var="feedback" items="${dao.feedbacks(instructor, subject) }">
				<tr>
					<td>${feedback[0] }</td>
					<td>${feedback[1] }</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	
	
	<script type="text/javascript">
		function submit(){
			document.feedbackForm.submit();
		}
	</script>
</body>
</html>