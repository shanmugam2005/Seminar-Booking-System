<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }

        h2 {
            text-align: center;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .register-link {
            text-align: center;
            margin-top: 10px;
        }

        .register-link a {
            color: #007bff;
            text-decoration: none;
        }

        .register-link a:hover {
            text-decoration: underline;
        }
        .error-message {
            color: red;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>

    <div class="login-container">
        <h2>Login Form</h2>

        <form action="index.jsp" method="post">
            <!-- User ID Field -->
            <div class="form-group">
                <label for="userId">Enter LMS ID:</label>
                <input type="text" id="userId" name="userId" required>
            </div>

            <!-- Username Field -->
            <div class="form-group">
                <label for="username">Staff name:</label>
                <input type="text" id="username" name="username" required>
            </div>

            <!-- Password Field -->
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>

            <input type="submit" value="Login">
        </form>

        <div class="register-link">
            <p>Don't have an account? <a href="register.jsp">Register here</a></p>
        </div>

        <%
            // Database connection settings
            String dbURL = "jdbc:mysql://localhost:3306/booking";  // Replace 'yourdatabase' with your actual database name
            String dbUser = "root";  // Replace with your MySQL username
            String dbPassword = "";  // Replace with your MySQL password

            // Handle the form submission
            if (request.getMethod().equalsIgnoreCase("POST")) {
                String userId = request.getParameter("userId");
                String username = request.getParameter("username");
                String password = request.getParameter("password");

                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                try {
                    // Load the JDBC driver (ensure MySQL JDBC driver is added to the classpath)
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Establish connection to the database
                    conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                    // Prepare SQL query to check the login credentials
                    String sql = "SELECT * FROM users WHERE userId = ? AND username = ? AND password = ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, userId);
                    pstmt.setString(2, username);
                    pstmt.setString(3, password);

                    // Execute the query
                    rs = pstmt.executeQuery();

                    if (rs.next()) {
                        // User found in the database, login successful
                        response.sendRedirect("index1.html");  // Redirect to another page on success
                    } else {
                        // Invalid login credentials
                        out.println("<p class='error-message'>Invalid credentials. Please try again.</p>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<p class='error-message'>Error occurred: " + e.getMessage() + "</p>");
                } finally {
                    // Close the database resources
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                }
            }
        %>
    </div>

</body>
</html>
