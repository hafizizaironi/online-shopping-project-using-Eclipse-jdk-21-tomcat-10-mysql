<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>


<%
String email = request.getParameter("email");
String password = request.getParameter("password");

try (Connection con = ConnectionProvider.getCon();
     PreparedStatement pstmt = con.prepareStatement("SELECT password, role FROM users WHERE email =?")) { 
    pstmt.setString(1, email);
    try (ResultSet rs = pstmt.executeQuery()) {
        if (rs.next()) {
            String storedPassword = rs.getString("password"); // Stored hash 
            String role = rs.getString("role");
            
            if (password.equals(storedPassword)) { // Compare password with hash
                session.setAttribute("email", email);
                if ("customer".equals(role)) {
                    response.sendRedirect("home.jsp");
                } else if ("seller".equals(role)) {
                    response.sendRedirect("adminHome.jsp");
                }
            } else {
                response.sendRedirect("login.jsp?msg=notexist"); 
            }
        } else {
            response.sendRedirect("login.jsp?msg=notexist");
        }
    } 
} catch (SQLException e) {
    System.out.println(e);
    response.sendRedirect("login.jsp?msg=invalid");
}
%>
