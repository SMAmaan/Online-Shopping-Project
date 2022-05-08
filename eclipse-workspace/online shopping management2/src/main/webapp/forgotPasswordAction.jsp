 <%@page import="project.ConnectionProvider"%>
 <%@page import="java.sql.*"%>
 <%
 String email=request.getParameter("email");
 String mobileNumber=request.getParameter("mobileNumber");
 String securityQuestions=request.getParameter("securityQuestions");
 String answer=request.getParameter("answer");
 String newPassword=request.getParameter("newPassword");
 
 int check=0;
 
 try
 {
	 Connection con=ConnectionProvider.getCon();
	 Statement st=con.createStatement(); 
	 ResultSet rs=st.executeQuery("select*from users where email='"+email+"' and mobileNumber='"+mobileNumber+"' and securityQuestions='"+securityQuestions+"' and answer='"+answer+"'");
	 while(rs.next())
	 {
		 check=1;
		 st.executeUpdate("update users set password='"+newPassword+"'  where email='"+email+"'");
		 
		 
		  
		 response.sendRedirect("forgotPassword.jsp?msg=Done");
	 }
	 if(check==0)
	 {
		 response.sendRedirect("forgotPassword?msg=invalid");
	 }
 }
 catch(Exception e)
 {
	 System.out.println(e);
	  
 }
 
 
 
 
 
 
 
 
 
 %>