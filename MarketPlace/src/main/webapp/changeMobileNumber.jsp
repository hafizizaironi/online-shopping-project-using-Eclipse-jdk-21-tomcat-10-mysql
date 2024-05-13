<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>

<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Mobile Number</title>
</head>
<body>
<%String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">Your Mobile Number successfully changed!</h3>
<%} %>
<% 
if("wrong".equals(msg))
{ %>
<h3 class="alert">Your Password is wrong!</h3>
<%} %>
<form action ="changeMobileNumberAction.jsp" method ="post">

 <h3>Enter Your New Mobile Number</h3>
 <input class = "input-style" type ="text" name ="mobileNumber"placeholder="Enter Your new Mobile Number" placeholder = "Please enter your mobile number">
 <hr>
<h3>Enter Password (For Security)</h3>
<input class = "input-style" type ="password" name ="password"placeholder="Enter Your Password" placeholder = "Please enter your mobile number">
 
<hr>
 <button class = "button" type ="submit">save<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>