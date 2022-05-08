<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>ForgotPassword</title>
</head>
<body>
<div id='container'>
      <div class='signup'>
     
           
  
  <form action="forgotPasswordAction.jsp" method="post">
      <input type="email" name="email" placeholder="Enter Email" required>
      <input type="number" name="mobileNumber" placeholder="Enter Mobile Number" required>
       <select name="securityQuestions" required>
          <option value="what is your first car?">WHAT IS YOUR FIRST CAR?</option>
          <option value="what is your first pet?">WHAT IS YOUR FIRST PET?</option>
          <option value="what is your high school name?">WHAT IS YOUR HIGH SCHOOL NAME?</option>
          <option value="what is your town name where you born?">WHAT IS YOUR TOWN NAME WHERE YOU BORN?</option>
       </select>
      <input type="text" name="answer" placeholder="Enter Answer" required>
      <input type="password" name="newPassword" placeholder="Enter New Password" required>
      <input type="submit" name="SAVE">
  
  </form>
  
  <h2><a href="login.jsp">Login</a></h2>
  
  
  </div>
  
  <div class='whyforgotPassword'>
   
   
<% 
String msg=request.getParameter("msg");
  if("Done".equals(msg))
  {
  	 %>
  	 <h1>Password changed successfully!</h1>
  	<%
  } 
  %>
  
  <%
if("invalid".equals(msg))
{
	 %>
	<h1>Some thing Went Wrong! Try Again !</h1>
	<%
} 
%>

    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
    </div>
</div>
  
</body>
</html>