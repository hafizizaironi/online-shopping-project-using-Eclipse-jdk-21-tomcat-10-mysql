<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
String email = request.getParameter("email");
String mobileNumber = request.getParameter("mobileNumber");
String securityQuestion = request.getParameter("securityQuestion");
String answer = request.getParameter("answer");
String newPassword = request.getParameter("newPassword");

int check = 0;
try (Connection con = ConnectionProvider.getCon();
     PreparedStatement pstmt = con.prepareStatement("SELECT * FROM users WHERE email =? AND mobileNumber =? AND securityQuestion =? AND answer =?")) {
    pstmt.setString(1, email);
    pstmt.setString(2, mobileNumber);
    pstmt.setString(3, securityQuestion);
    pstmt.setString(4, answer);
    try (ResultSet rs = pstmt.executeQuery()) {
        if (rs.next()) {
            check = 1;
            try (PreparedStatement updateStmt = con.prepareStatement("UPDATE users SET password =? WHERE email =?")) {
                updateStmt.setString(1, newPassword);
                updateStmt.setString(2, email);
                updateStmt.executeUpdate();
                response.sendRedirect("forgotPassword.jsp?msg=done");
            }
        } else {
            response.sendRedirect("forgotPassword.jsp?msg=invalid");
        }
    }
} catch (SQLException e) {
    System.out.println(e);
    response.sendRedirect("forgotPassword.jsp?msg=error");
}
%>