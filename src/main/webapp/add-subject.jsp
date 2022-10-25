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
	<form>
		Subject:
		<select name="subject" id="subject" onchange="onChange()">
		    <option value="dropdown" selected disabled>SELECT</option>
            <option value="PC Architecture">PC Architecture</option>
            <option value="PC Hardware 1">PC Hardware 1</option>
            <option value="PC Hardware 2">PC Hardware 2</option>
            <option value="Microprocessor Interfacing">Microprocessor Interfacing</option>
            <option value="C#">C#</option>
            <option value="Operating System">Operating System</option>
            <option value="SQL Server">SQL Server</option>
            <option value="Networking">Networking</option>
		</select><br><br>
		
		Theory:
		<input type="text" id="theory" name="theory"><br>
		Practical:
		<input type="text" id="practical" name="practical"><br>
		Year:
		<input type="text" name="year"><br>
		Instructor:
		<input type="text" name="instructor"><br>
		<input type=submit>
	</form>
	
	<c:if test="${param.subject != null}">
		<jsp:useBean id="beanSubject" class="infinite.college_complaint_project.Subject"/>
		<jsp:setProperty property="*" name="beanSubject"/>
		<jsp:useBean id="beanDAO" class="infinite.college_complaint_project.DAO"/>
		<c:out value="${beanDAO.addSubject(beanSubject) }"/>
	</c:if>
	
	<script>
        function onChange(){
	        var sub= document.getElementById("subject").value;
	        
	       
	        if(sub == "PC Architecture"){
	        	document.getElementById('theory').value = '42';
	        	document.getElementById('practical').value = '14';
	        }
	        if(sub =="PC Hardware 1"){
	        	document.getElementById('theory').value = '90';
	        	document.getElementById('practical').value = '50';
	        }
	        if(sub =="PC Hardware 2"){
	        	document.getElementById('theory').value = '69';
	        	document.getElementById('practical').value = '41';
	        }
	        
	        if(sub =="PC Hardware 2"){
	        	document.getElementById('theory').value = '107';
	        	document.getElementById('practical').value = '93';
	        }
	        
	        if(sub =="Microprocessor Interfacing"){
	        	document.getElementById('theory').value = '84';
	        	document.getElementById('practical').value = '56';
	        }
	        
	        if(sub =="C#"){
	        	document.getElementById('theory').value = '60';
	        	document.getElementById('practical').value = '-';
	        }
	        
	        if(sub =="Data Structures"){
	        	document.getElementById('theory').value = '80';
	        	document.getElementById('practical').value = '70';
	        }
	        
	        if(sub =="Operating System"){
	        	document.getElementById('theory').value = '66';
	        	document.getElementById('practical').value = '34';
	        }
	        
	        if(sub =="SQL Server"){
	        	document.getElementById('theory').value = '94';
	        	document.getElementById('practical').value = '156';
	        }
	        
	        if(sub =="Networking"){
	        	document.getElementById('theory').value = '27';
	        	document.getElementById('practical').value = '11';
	        }
        }
    </script>
</body>
</html>