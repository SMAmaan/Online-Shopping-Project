 <%@page import="project.ConnectionProvider"%>
 <%@page import="java.sql.*"%>
 <%@include file="header.jsp" %>
 <%@include file="footer.jsp" %>
<html>
<head>
 
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>
<script>
if(window.history.forward(1)!=null)
	
	window.history.forward(1);
	
	</script>
</head>
<body>
<br>
<table>
<thead>
<%
String e_mail=session.getAttribute("email").toString();


int total=0;
int sno=0;
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs1=st.executeQuery("select sum(total) from cart where email='"+email+"' and address is NULL");
	while(rs1.next())
	{
		total=rs1.getInt(1);
	}



%>
          <tr>
          <th scope="col"><a href="myCart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><%out.println(total); %> </th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
          </tr>
        </thead>
        <tbody>
        <%
      ResultSet rs=st.executeQuery("select *from products inner join cart on products.id=cart.product_id and cart.email='"+email+"' and cart.address is NULL");
      while(rs.next())
      {
      %>
        
        
          <tr>
          <%sno=sno+1; %>
           <td><%out.println(sno); %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(4) %></td>
            <td><%=rs.getString(8) %> </td>
            <td><i class="fa fa-inr"></i><%=rs.getString(10) %> </td>
            </tr>
         <%} 
      ResultSet rs2=st.executeQuery("select *from users where email='"+email+"'");
      while(rs2.next())
      {
         
         %>
        </tbody>
      </table>
      
<hr style="width: 100%">
<form action="addressPaymentForOrderAction.jsp" method="post">


 <div class="left-div">
 <h3>Enter Address</h3>
 <input class="input-style" type="text" name="address" value="<%=rs2.getString(7) %>" placeholder="Enter Address" required>
 <hr>

 </div>

<div class="right-div">
<h3>Enter city</h3>
<input class="input-style" type="text" name="city" value="<%=rs2.getString(8) %>" placeholder="Enter City" required>
<hr>
</div> 

<div class="left-div">
<h3>Enter State</h3>
<input class="input-style" type="text" name="state" value="<%=rs2.getString(9) %>" placeholder="Enter State" required>
<hr>
</div>

<div class="right-div">
<h3>Enter country</h3>
<input class="input-style" type="text" name="country" value="<%=rs2.getString(10) %>" placeholder="Enter Country" required>
<hr>
</div>


<h3 style="color: black">*If there is no address its mean that you did not set you address!</h3>
<h3 style="color: black">*This address will also updated to your profile</h3>
<hr style="width: 100%">


<div class="left-div">
<h3>Select way of Payment</h3>
<select class="input-style" name="paymentMethod">
<option value="Cash On Delivery">Cash On Delivery</option>
<option value=" Online Payment">Online Payment</option>
</select>
 <hr>
</div>

<div class="right-div">
<h3>Pay online on this Amaan@pay.com</h3>
<input class="input-style" type="text" name="transactionId"   placeholder="Enter Transaction ID" >
<hr>
<h3 style="color: black">*If you select online Payment then enter you transaction ID here otherwise leave this blank</h3>
</div>
<hr style="width: 100%">

<div class="left-div">
<h3>Mobile Number</h3>
<input class="input-style" type="number" name="mobileNumber" value="<%=rs2.getString(3) %>" placeholder="Enter Mobile Number" required>
<hr>
<h3 style="color: black">*This mobile number will also updated to your profile</h3>
</div>
<div class="right-div">
<h3 style="color: black">*If you enter wrong transaction id then your order will be  cancel!</h3>
<button class="button" type="submit">Proceed To Generate Bill & Save <i class='far fa-arrow-alt-circle-right'></i></button>
<h3 style="color: black">*Fill form correctly</h3>
</div>

</form>
<%
      }  
}
catch(Exception e)
{
	System.out.println(e);
}

%>
      <br>
      <br>
      <br>

</body>
</html>