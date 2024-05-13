<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%

try
{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	String q1="create table users(name varchar(100),email varchar(100)primary key, mobileNumber bigint,securityQuestion varchar(200),answer varchar(200),password varchar(100),address varchar(500),city varchar (100), state varchar(100), country varchar(100))";
	String q2="create table product(id int, name varchar(500),category varchar(200),price int, active varchar(10), product_email varchar(100))";
	String q3="create table cart(email varchar(100),product_id int,quantity int,price float,total float,address varchar(500),city varchar(100),state varchar (100),country varchar(100),mobileNumber varchar(20),orderDate varchar(100),deliveryDate varchar(100),paymentMethod varchar(100),transactionId varchar(100),status varchar(10))";
	String q4="create table message(id int AUTO_INCREMENT,email varchar(100),subject varchar(200), body varchar(1000),PRIMARY KEY(id))";

    // New query to create the sellers table
	
    
	//System.out.println(q1);
	//System.out.println(q2);
	//System.out.println(q3);
	//System.out.println(q4);
	st.execute(q1);
	//st.execute(q2);
	//st.execute(q3);
	//st.execute(q4);
	System.out.print("tables created"); 
	con.close();
}
catch(Exception e)
{
	System.out.print(e);
}


%>