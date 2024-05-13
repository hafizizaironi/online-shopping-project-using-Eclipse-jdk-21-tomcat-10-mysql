<%@page import="java.io.InputStream"%>
<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.io.*"%> 



<%
String email = session.getAttribute("email").toString();
String id = request.getParameter("id");
String name = request.getParameter("name");
String category = request.getParameter("category");
String price = request.getParameter("price");
String active = request.getParameter("active");

// Get the image file



try {
    Connection con = ConnectionProvider.getCon();
    
    // Specify the columns you're inserting data into
    String query = "INSERT INTO product (id, name, category, price, active, product_email) VALUES (?, ?, ?, ?, ?, ?)";
    
    PreparedStatement ps = con.prepareStatement(query);
    ps.setString(1, id);
    ps.setString(2, name);
    ps.setString(3, category);
    ps.setString(4, price);
    ps.setString(5, active);
    ps.setString(6, email);
    
    ps.executeUpdate();
    
    response.sendRedirect("addNewProduct.jsp?msg=done");
} catch(Exception e) {
	System.out.println(e);
    response.sendRedirect("addNewProduct.jsp?msg=wrong1");
}
%>
