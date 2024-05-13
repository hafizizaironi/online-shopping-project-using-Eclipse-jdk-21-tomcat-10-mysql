<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>My Cart</title>
    <style>
        body {
            background-color: #2979ff; /* Light Grey Background */
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff; /* White Container Background */
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1); /* Shadow for Depth */
            padding: 20px;
        }

        h1 {
            color: #333; /* Dark Grey Heading Text */
            text-align: center;
            font-size: 30px;
            margin-bottom: 20px;
        }

        .alert {
            color: #dc3545; /* Red Alert Text */
            text-align: center;
            font-size: 18px;
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

        .total-row {
            background-color: yellow; /* Yellow Background for Total Row */
            color: #333; /* Dark Grey Text */
            font-weight: bold;
            text-align: center;
        }

        .total-row i {
            margin-right: 5px;
        }

        .total-row a {
            text-decoration: none;
            color: #333; /* Dark Grey Text */
        }

        .total-row a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>My Cart <i class='fas fa-cart-arrow-down'></i></h1>
    <% 
    String msg = request.getParameter("msg");
    if("notPossible".equals(msg))
    {
    %>  
    <h3 class="alert">There is only one Quantity! So click on remove!</h3>
    <% }%>
    <% 
    if("inc".equals(msg))
    {
        %>
        <h3 class="alert">Quantity Increased Successfully!</h3>
    <% }%>   
    <% 
    if("dec".equals(msg))
    {%>
        <h3 class="alert">Quantity Decreased Successfully!</h3>
    <%}%>
    <% 
    if("removed".equals(msg))
    {%>
    <h3 class="alert">Product Successfully Removed!</h3>
    <%}%>
    <table>
        <thead>
        <%
        int total = 0;
        try{
        	Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select sum(total) from cart where email = '"+email+"'and address is NULL");
            while(rs.next()){
            	total = rs.getInt(1);
            }
        }
        catch(Exception e){
        	System.out.println(e);   
        	}
        
        %>
        <tr>
            <th class="total-row" colspan="7">Total: <i class="fas fa-money-bill-wave"></i> <%out.println(total); %> MYR 
                <%if(total>0){ %><a href="addressPaymentForOrder.jsp">Proceed to order</a><%} %>
            </th>
        </tr>
        <tr>
            <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
        </tr>
        </thead>
        <tbody>
        <%
        int sno = 0;
        try{
            Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from product inner join cart on product.id=cart.product_id and cart.email='"+email+"'and cart.address is NULL");
            while(rs.next())
            {
                sno=sno+1;
        %>
        <tr>
            <td><%= sno %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i> <%= rs.getString(4) %></td>
            <td>
                <a href="incDecQuantityAction.jsp?id=<%= rs.getString(1) %>&quantity=inc"><i class='fas fa-plus-circle'></i></a>
                <%= rs.getString(9) %>
                <a href="incDecQuantityAction.jsp?id=<%= rs.getString(1) %>&quantity=dec"><i class='fas fa-minus-circle'></i></a>
            </td>
            <td><i class="fa fa-inr"></i><%= rs.getString(11) %></td>
            <td><a href="removeFromCart.jsp?id=<%= rs.getString(1) %>">Remove <i class='fas fa-trash-alt'></i></a></td>
        </tr>
        <%
            }
        }
        catch(Exception e){
            System.out.print(e);
        }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
