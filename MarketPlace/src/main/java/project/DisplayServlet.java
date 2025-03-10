import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DisplayServlet")
public class DisplayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public DisplayServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("In do post method of Display Image servlet.");
		String imageId=request.getParameter("imageId");
		int id=Integer.parseInt(imageId);
		
		//getting database connection (jdbc code)
				Connection connection=null;
				int imgId=0;
				String imgFileName=null;
				try 
				{
					Class.forName("com.mysql.cj.jdbc.Driver");
					connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/imageTutorial","root","your password");
					Statement stmt;
					String query="select * from image";
					stmt=connection.createStatement();
					ResultSet rs=stmt.executeQuery(query);
					
					while(rs.next())
					{
						if(rs.getInt("imageId")==id)
						{
							imgId=rs.getInt("imageId");
							imgFileName=rs.getString("imageFileName");
						}
					}
						
				}
				catch (Exception e)
				{
					System.out.println(e);
				}
				
				RequestDispatcher rd;
				request.setAttribute("id",String.valueOf(imgId));  //valueOf
				request.setAttribute("img",imgFileName);
				rd=request.getRequestDispatcher("displayImage.jsp");
				rd.forward(request, response);

	}

}