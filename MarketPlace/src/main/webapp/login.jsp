<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="css/login-style.css">
    <style>
        body {
            background-color: #2979ff; /* Deep Blue Background */
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        #container {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .signup {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2); /* Shadow for depth */
            width: 300px;
            text-align: center;
        }

        .signup input[type="email"],
        .signup input[type="password"],
        .signup input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .signup input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .signup input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .whysignLogin {
            margin-left: 20px;
            text-align: center;
            color: #fff; /* White text for contrast */
        }

        .whysignLogin h1,
        .whysignLogin h2,
        .whysignLogin p {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div id="container">
    <div class="signup">
        <form action="loginAction.jsp" method="post">
            <input type="email" name="email" placeholder="Enter email" required>
            <input type="password" name="password" placeholder="Enter Password" required>
            <input type="submit" value="Login">
        </form>
        <h2><a href="signup.jsp">SignUp</a></h2>
        <h2><a href="forgotPassword.jsp">Forgot Password?</a></h2>
    </div>
    <div class="whysignLogin">
    <% 
    String msg = request.getParameter("msg");
    if("notexist".equals(msg)){
    %>
    <p>Account does not exist!<p>
    <%} %>
 
        <h2>MarketPlace</h2>
        <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
    </div>
</div>
</body>
</html>
