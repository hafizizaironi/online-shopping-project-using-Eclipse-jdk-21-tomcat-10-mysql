<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>

<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Home</title>
    <style>
        body {
            background-color: #2979ff; /* Deep Blue Background */
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        #header {
            background-color: #333; /* Dark Grey Header Background */
            color: #fff; /* White Header Text */
            padding: 10px 0;
            text-align: center;
        }

        #container {
            background-color: #fff; /* White Container Background */
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2); /* Shadow for Depth */
            padding: 20px;
            max-width: 800px;
            width: 100%;
            margin: 20px auto; /* Center Container with Margin */
            flex-grow: 1; /* Expand Container to Fill Remaining Space */
        }

        h1 {
            color: #007bff; /* Blue Heading */
            text-align: center;
            font-size: 30px;
            margin-bottom: 20px;
        }

        .alert {
            color: #dc3545; /* Red Alert Text */
            text-align: center;
            font-size: 20px;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd; /* Light Grey Border */
        }

        th {
            background-color: #f2f2f2; /* Light Grey Background for Table Header */
            font-weight: bold;
        }

        td a {
            color: #007bff; /* Blue Link Text */
            text-decoration: none;
            transition: color 0.3s ease;
        }

        td a:hover {
            color: #0056b3; /* Darker Blue on Hover */
        }
    </style>
</head>
<body>

<div id="container">
    <h1>Home <i class="fa fa-institution"></i></h1>
    <%
    String msg=request.getParameter("msg");
    if("added".equals(msg))
    {%>
        <h3 class="alert">Product added successfully!</h3>
    <%} %>
    <%
    if("exist".equals(msg))
    {%>
        <h3 class="alert">Product already exists in your cart! Quantity increased!</h3>
    <%} %>
    <%
    if("valid".equals(msg))
    {%>
        <h3 class="alert">Something went wrong! Try again!</h3>
    <%} %>
    <table>
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
        </tr>
        </thead>
        <tbody>
        <%
        try{
            Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from product where active = 'yes'");
            while(rs.next()){
        %>
                <tr>
                    <td><%=rs.getString(1) %></td>
                    <td><%=rs.getString(2) %></td>
                    <td><%=rs.getString(3) %></td>
                    <td><i class="fa fa-inr"> </i><%=rs.getString(4) %></td>
                    <td><a href="addToCartAction.jsp?id=<%=rs.getString(1) %>">Add to cart <i class="fas fa-cart-plus"></i></a></td>
                </tr>
        <%
            }
        }
        catch(Exception e){
            System.out.println(e);
        }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
