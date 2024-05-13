<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>My Orders</title>
    <style>
        body {
            background-color: #2979ff; /* Light Grey Background */
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
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

        tbody tr:nth-child(even) {
            background-color: #f2f2f2; /* Alternate Row Color */
        }

        tbody tr:hover {
            background-color: #ddd; /* Hover Background Color */
        }

        td i {
            margin-right: 5px;
        }

        .center {
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>My Orders <i class='fab fa-elementor'></i></h1>
    <table>
        <thead>
        <tr>
            <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th scope="col">Order Date</th>
            <th scope="col">Expected Delivery Date</th>
            <th scope="col">Payment Method</th>
            <th scope="col">Status</th>
        </tr>
        </thead>
        <tbody>
        <%
        int sno = 0;
        try{
            Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs= st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.email ='"+email+"'and cart.orderDate is not NULL ");
            while(rs.next())
            {
                sno= sno+1;
        %>
        <tr>
            <td><%= sno %></td>
            <td><%= rs.getString(17) %></td>
            <td><%= rs.getString(18) %></td>
            <td><i class="fa fa-inr"></i><%= rs.getString(19) %></td>
            <td><%= rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i><%= rs.getString(5) %></td>
            <td><%= rs.getString(11) %></td>
            <td><%= rs.getString(12) %></td>
            <td><%= rs.getString(13) %></td>
            <td><%= rs.getString(15) %></td>
        </tr>
        <%
            }

        } catch(Exception e){

        }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
