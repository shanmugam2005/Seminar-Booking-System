<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Booking Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .result-container {
            background: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            margin: auto;
            text-align: center;
        }
        .success {
            color: #28a745;
            font-weight: bold;
        }
        .error {
            color: #dc3545;
            font-weight: bold;
        }
        p {
            margin: 10px 0;
        }
        button {
            background-color: #007bff;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<%
    String customerName = request.getParameter("customerName");
    String bookingDate = request.getParameter("bookingDate");
   String hall_type=request.getParameter("hall_type");
    // Database connection variables
    Connection conn = null;
    PreparedStatement pstmt = null;
    String dbURL = "jdbc:mysql://localhost:3306/booking"; // Update with your DB URL
    String dbUser = "root"; // Update with your DB username
    String dbPassword = ""; // Update with your DB password

    String resultMessage = ""; // Variable to hold the result message
    String cssClass = ""; // Variable to hold the CSS class

    try {
        // Load the JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        // Establish a connection
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        // SQL query to delete the booking based on name and date
        String sql = "DELETE FROM bookings WHERE name = ? AND booking_date = ? and hall_type=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, customerName);
        pstmt.setString(2, bookingDate);
        pstmt.setString(3, hall_type);

        // Execute the deletion
        int rowsAffected = pstmt.executeUpdate();
        
        if (rowsAffected > 0) {
            resultMessage = "Successfully deleted the booking for " + customerName + " on " + bookingDate + ".";
            cssClass = "success"; // Set success class
        } else {
            resultMessage = "No booking found for " + customerName + " on " + bookingDate + ".";
            cssClass = "error"; // Set error class
        }
    } catch (ClassNotFoundException e) {
        resultMessage = "Error: JDBC Driver not found: " + e.getMessage();
        cssClass = "error"; // Set error class
    } catch (SQLException e) {
        resultMessage = "Error: SQL Exception: " + e.getMessage();
        cssClass = "error"; // Set error class
    } finally {
        // Close resources
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            resultMessage = "Error closing resources: " + e.getMessage();
            cssClass = "error"; // Set error class
        }
    }
%>

<div class="result-container">
    <p class="<%= cssClass %>"><%= resultMessage %></p>
    <button onclick="window.history.back()">Go Back</button>
</div>

</body>
</html>
