<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:400,500,600&display=swap">
    <style>
        body {
            background-color: #2979ff;
            font-family: 'Poppins', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        #container {
            background: #fff;
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 400px;
        }

        .signup h2 {
            color: #333;
            margin-bottom: 20px;
        }

        .input-style,
        .select-style {
            width: calc(100% - 40px);
            margin: 10px 0;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            outline: none;
            font-size: 16px;
        }

        .select-style {
            appearance: none;
            -moz-appearance: none;
            -webkit-appearance: none;
            background-image: url('data:image/svg+xml;utf8,<svg fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg>');
            background-repeat: no-repeat;
            background-position: right 10px center;
            padding-right: 40px;
        }

        .signup input[type="submit"] {
            background-color: #2979ff;
            color: white;
            border: none;
            padding: 15px 20px;
            border-radius: 5px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .signup input[type="submit"]:hover {
            background-color: #2962ff;
        }

        .signup a {
            color: #333;
            text-decoration: none;
            font-weight: 500;
            margin-top: 15px;
            display: inline-block;
            transition: color 0.3s;
        }

        .signup a:hover {
            color: #2962ff;
        }

        .message {
            margin-top: 20px;
            padding: 10px;
            border-radius: 5px;
        }

        .success {
            background-color: #4caf50;
            color: white;
        }

        .error {
            background-color: #f44336;
            color: white;
        }
    </style>
</head>
<body>
    <div id="container">
        <div class="signup">
            <h2>Signup</h2>
            <form action="signupAction.jsp" method="post">
                <input class="input-style" type="text" name="name" placeholder="Enter Name" required>
                <input class="input-style" type="email" name="email" placeholder="Enter Email" required>
                <input class="input-style" type="number" name="mobilenumber" placeholder="Enter Mobile Number" required>
                <select class="select-style" name="role">
                    <option value="customer">Customer</option>
                    <option value="seller">Seller</option>
                </select>
                <select class="select-style" name="securityQuestion">
                    <option value="What is your parent's name?">What is your parent's name?</option>
                    <option value="what is your first car?">what is your first car?</option>
                    <option value="what is your first pet?">what is your first pet?</option>
                    <option value="what is your first name?">what is your first name</option>
                </select>
                <input class="input-style" type="text" name="answer" placeholder="Enter answer" required>
                <input class="input-style" type="password" name="password" placeholder="Enter Password" required>
                <input type="submit" value="Signup">
            </form>
            <a href="login.jsp">Login</a>
        </div>
        <% 
        String msg = request.getParameter("msg");
        if (msg != null && !msg.isEmpty()) {
            String messageClass = msg.equals("valid") ? "success" : "error";
            %>
            <div class="message <%= messageClass %>">
                <% if (msg.equals("valid")) { %>
                    Registration successful!
                <% } else { %>
                    Registration unsuccessful!
                <% } %>
            </div>
        <% } %>
    </div>
</body>
</html>
