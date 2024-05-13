package project;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;

import com.mysql.cj.Session;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@MultipartConfig
@WebServlet("/AddImage")
public class ImageHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ImageHandler() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("In do post method of Add Image servlet.");
		Part file=request.getPart("image");
		
		String imageFileName=file.getSubmittedFileName();  // get selected image file name
		System.out.println("Selected Image File Name : "+imageFileName);
		
		String uploadPath="C:/Users/Hafizi/eclipse-workspace/MarketPlace/src/main/assets/"+imageFileName;  // upload path where we have to upload our actual image
		System.out.println("Upload Path : "+uploadPath);
		
		// Uploading our selected image into the images folder
		HttpSession session = request.getSession();
		String email = session.getAttribute("email").toString();
		try
		{
		
		FileOutputStream fos=new FileOutputStream(uploadPath);
		InputStream is=file.getInputStream();
		
		byte[] data=new byte[is.available()];
		is.read(data);
		fos.write(data);
		fos.close();
		
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		//**********************
		
		//getting database connection (jdbc code)
		Connection connection=null;
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/ospjsp","root","Hafizi@123");
			PreparedStatement stmt;
			String query = "INSERT INTO images (imageFileName, image_email) VALUES (?,?)";
			stmt=connection.prepareStatement(query);
			stmt.setString(1,imageFileName);
			stmt.setString(2, email);
			int row=stmt.executeUpdate(); // it returns no of rows affected.
			
			if(row>0)
			{
				System.out.println("Image added into database successfully.");
				
				response.sendRedirect("addNewProduct.jsp?msg=doneImage");
			}
			
			else
			{
				System.out.println("Failed to upload image.");
				response.sendRedirect("addNewProduct.jsp?msg=wrong1");
			}
			
			
		}
		catch (Exception e)
		{
			System.out.println(e);
			response.sendRedirect("addNewProduct.jsp?msg=wrong");
		}
		
	}

}