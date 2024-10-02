<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booked Dates</title>
    <style>
        /* Global Styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
            color: #333;
        }

        h1 {
            text-align: center;
            margin-top: 20px;
            color: #4CAF50;
        }

        #booked-dates {
            width: 90%;
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .booking-entry {
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
            margin: 10px 0;
            transition: background 0.3s;
        }

        .booking-entry:hover {
            background-color: #f1f1f1; /* Change background on hover */
        }

        /* Empty State Message */
        .empty-message {
            text-align: center;
            font-style: italic;
            color: #888;
        }
    </style>
</head>
<body>
    <h1>Booked Dates</h1>
    <div id="booked-dates">
        <%
            List<String[]> bookedDates = new ArrayList<>();
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            String hall = request.getParameter("type");
            try {
                // Load the JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish the database connection
                String url = "jdbc:mysql://localhost:3306/booking"; 
                String user = "root"; 
                String password = ""; 
                conn = DriverManager.getConnection(url, user, password);

                // Prepare SQL query using PreparedStatement to prevent SQL injection
                String sql = "SELECT name, booking_date, Time_Slots FROM civil WHERE hall_type = ? and booking_date>=CURDATE()"; 
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, hall);
                rs = pstmt.executeQuery();
                
                while (rs.next()) {
                    String name = rs.getString("name");
                    String date = rs.getString("booking_date");
                    String timeSlot = rs.getString("Time_Slots");
                    bookedDates.add(new String[] {name, date, timeSlot});
                }
            } catch (ClassNotFoundException e) {
                out.println("<p class='error'>JDBC Driver not found: " + e.getMessage() + "</p>");
            } catch (SQLException e) {
                out.println("<p class='error'>SQL Exception: " + e.getMessage() + "</p>");
            } finally {
                // Close resources in the reverse order of their creation
                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }

            // Output booked dates
            if (bookedDates.isEmpty()) {
                out.println("<p class='empty-message'>No booked dates available.</p>");
            } else {
                for (String[] bookedDate : bookedDates) {
        %>
                    <div class="booking-entry">
                        <strong>Name:</strong> <%= bookedDate[0] %>
                        <strong>Date:</strong> <%= bookedDate[1] %>
                        <strong>Time Slot:</strong> <%= bookedDate[2] %>
                    </div>
        <%
                }
            }
        %>
        <button type="button" onclick="history.back()" style="background-color: #007bff; margin-top: 10px;">
    Go Back
</button>

    </div>
</body>
</html>
