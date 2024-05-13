<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>



<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String mobileNumber = request.getParameter("mobilenumber");
String securityQuestion = request.getParameter("securityQuestion");
String answer = request.getParameter("answer");

// **IMPORTANT: Replace with secure password hashing later**
String password = request.getParameter("password");  

String address = "";
String city = "";
String state = "";
String country = "";
String role = request.getParameter("role"); // Default role. Need UI change to get seller role



try {
    Connection con = ConnectionProvider.getCon();

    // 1. Prepare the SQL statement with role
    PreparedStatement ps = con.prepareStatement("INSERT INTO users VALUES(?,?,?,?,?,?,?,?,?,?,?)");

    // 2. Set values (including the new role)
    ps.setString(1, name);
    ps.setString(2, email);
    ps.setString(3, mobileNumber);
    ps.setString(4, securityQuestion);
    ps.setString(5, answer);
    ps.setString(6, password); 
    ps.setString(7, address);
    ps.setString(8, city);
    ps.setString(9, state);
    ps.setString(10, country);
    ps.setString(11, role);


    ps.executeUpdate();
    response.sendRedirect("signup.jsp?msg=valid");
} catch (Exception e) {
    System.out.println(e);
    response.sendRedirect("signup.jsp?msg=invalid");
}
%>
