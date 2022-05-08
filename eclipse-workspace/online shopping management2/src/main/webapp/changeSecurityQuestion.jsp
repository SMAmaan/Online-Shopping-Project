<%@page import="project.ConnectionProvider"%>
 <%@page import="java.sql.*"%>
 <%@include file="header.jsp" %>
 <%@include file="footer.jsp" %>



<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Security Question</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("Done".equals(msg))
{
%>
<h3 class="alert">Your security Question successfully changed !</h3>
<%} %>
<%
if("wrong".equals(msg))
{
%>
<h3 class="alert">Your Password is wrong!</h3>
<%} %>

 


 



<form action="changeSecurityQuestionAction.jsp" method="post">

<h3>Select Your New Security Question</h3>
  <select name="securityQuestions" class="input-style" required>
     <option value="what is your first car?">WHAT IS YOUR FIRST CAR?</option>
     <option value="what is your first pet?">WHAT IS YOUR FIRST PET?</option>
     <option value="what is your high school name?">WHAT IS YOUR HIGH SCHOOL NAME?</option>
     <option value="what is your town name where you born?">WHAT IS YOUR TOWN NAME WHERE YOU BORN?</option>
   </select>
 <hr>
 <h3>Enter Your New Answer</h3>
  <input class="input-style" type="text"  name="newAnswer" placeholder="Enter New Answer" required>
<hr>
<h3>Enter Password (For Security)</h3>
 <input class="input-style" type="password"   name="password" placeholder="Enter Password (For Security)" required>
<hr>
 <button class="button" type="submit">Save
 <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>