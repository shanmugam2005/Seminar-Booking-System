<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <style>
        /* Apply the same styling as in login.jsp */
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

        .register-container {
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

        .error-message {
            color: red;
            text-align: center;
            margin-top: 10px;
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
    </style>
</head>
<body>

    <div class="register-container">
        <h2>Register</h2>

        <form action="register.jsp" method="post">
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

            <input type="submit" value="Register">
        </form>
        <div class="register-link">
            <p>Already have an account? <a href="index.jsp">Login here</a></p>
        </div>


        <%
            if (request.getMethod().equalsIgnoreCase("POST")) {
                String userId = request.getParameter("userId");
                String username = request.getParameter("username");
                String password = request.getParameter("password");

                // Define valid department prefixes
                String[] validDepartments = {"CSE", "ECE", "MECH", "EEE", "CIVIL","IT","AIDS","cse","ece","mech","eee","civil","it","aids"};

                // Check if the userId starts with a valid department prefix
                boolean isValidUserId = false;
                for (String dept : validDepartments) {
                    if (userId.startsWith(dept)) {
                        isValidUserId = true;
                        break;
                    }
                }

                if (!isValidUserId) {
                    out.println("<p class='error-message'>Enter valid LMS ID </p>");
                } else {String dbURL = "jdbc:mysql://localhost:3306/booking";
                    String dbUser = "root";
                    String dbPassword = "";

                    Connection conn = null;
                    PreparedStatement checkStmt = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                        String checkSql = "SELECT * FROM users WHERE userId = ?";
                        checkStmt = conn.prepareStatement(checkSql);
                        checkStmt.setString(1, userId);
                        rs = checkStmt.executeQuery();

                        if (rs.next()) {
                            out.println("<p class='error-message'>User ID already exists.Go login page</p>");
                        } else {

                        String sql = "INSERT INTO users (userId, username, password) VALUES (?, ?, ?)";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, userId);
                        pstmt.setString(2, username);
                        pstmt.setString(3, password);

                        int result = pstmt.executeUpdate();
                        if (result > 0) {
                            response.sendRedirect("index.jsp");  // Redirect to another page on success
                        } else {
                            out.println("<p>Registration failed. Please try again.</p>");
                        }
                    }
                    } catch (Exception e) {
                        e.printStackTrace();
                        out.println("<p>Error occurred: " + e.getMessage() + "</p>");
                    } finally {
                        if (pstmt != null) pstmt.close();
                        if (conn != null) conn.close();
                    }
                }
            }
        %>
    </div>

</body>
</html>
