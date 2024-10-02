<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Confirmation</title>
    <style>
        /* Global Styling */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }

        /* Main Container */
        .container {
            width: 100%;
            max-width: 600px;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
        }

        h1 {
            font-size: 28px;
            color: #4CAF50;
            text-align: center;
            margin-bottom: 20px;
        }

        p {
            font-size: 16px;
            margin-bottom: 10px;
            color: #555;
        }

        .form-group {
            margin: 15px 0;
        }

        .form-group label {
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
        }

        .form-group p {
            padding: 10px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        /* Button Styling */
        button {
            width: 100%;
            padding: 12px;
            font-size: 18px;
            color: white;
            background-color: #28a745;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #218838;
        }

        /* Success and Error Message Styling */
        .message {
            text-align: center;
            margin-top: 20px;
        }

        .success {
            color: #28a745;
            font-weight: bold;
        }

        .error {
            color: #dc3545;
            font-weight: bold;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }

            h1 {
                font-size: 24px;
            }

            button {
                font-size: 16px;
                padding: 10px;
            }
        }
    </style>

    <script type="text/javascript">
        function getUserName() {
            var name = prompt("Please enter Lms ID:");
            if (name != null && name != "") {
                document.getElementById("userNameField").value = name;

                // Submit the form after setting the user name
                document.getElementById("bookingForm").submit();
            } else {
                alert("Name is required for booking.");
            }
        }
    </script>
</head>
<body>
    <%
        
      String timeSlots=request.getParameter("selectedSlot");
       if(timeSlots==null|| timeSlots.isEmpty()){                         
       response.sendRedirect("cse.jsp");  
}
        %>
<div class="container">
    <!-- Form for Booking -->
    <form id="bookingForm" method="post" action="">
        <!-- Hidden field to store name after popup -->
        <input type="hidden" id="userNameField" name="userName" value="">
        
        <!-- Hidden fields for other parameters -->
        <input type="hidden" name="hallType" value="<%= request.getParameter("hallType") %>">
        <input type="hidden" name="room" value="<%= request.getParameter("room") %>">
        <input type="hidden" name="lab" value="<%= request.getParameter("lab") %>">
        <input type="hidden" name="bookingDate" value="<%= request.getParameter("bookingDate") %>">
        <input type="hidden" name="selectedSlot" value="<%= request.getParameter("selectedSlot") %>">

        <div class="form-group">
            <label>Hall Type: </label>
            <p><%= request.getParameter("hallType") %></p>
        </div>
        <div class="form-group">
            <label>Room: </label>
            <p><%= request.getParameter("room") %></p>
        </div>
        <div class="form-group">
            <label>Lab: </label>
            <p><%= request.getParameter("lab") %></p>
        </div>
        <div class="form-group">
            <label>Date: </label>
            <p><%= request.getParameter("bookingDate") %></p>
        </div>
        <div class="form-group">
            <label>Time Slot: </label>
            <p><%= request.getParameter("selectedSlot") %></p>
        </div>
       <button type="button" onclick="history.back()" style="background-color: #007bff; margin-top: 10px;">
    Go Back
</button>

        <!-- Trigger the JavaScript function to get user name via popup -->
        <button type="button" onclick="getUserName()">Confirm Booking</button>
    </form>

    <div class="message">
        <%
    // Database credentials
    String dbURL = "jdbc:mysql://localhost:3306/booking";
    String dbUser = "root";
    String dbPassword = "";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    // Retrieve form parameters after the user name is entered
    String userName = request.getParameter("userName");
    String hallType = request.getParameter("hallType");
    String room = request.getParameter("room");
    String lab = request.getParameter("lab");
    String bookingDate = request.getParameter("bookingDate");
    String timeSlot = request.getParameter("selectedSlot");

    if (userName != null && !userName.isEmpty() && timeSlot != null && !timeSlot.isEmpty()) {
        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // Step 1: Check if the username already exists in the database
            String checkUserSql = "SELECT * FROM  users WHERE  userId= ?";
            pstmt = conn.prepareStatement(checkUserSql);
            pstmt.setString(1, userName);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // User exists, proceed with the booking

                // Step 2: Insert the booking details into the database
                String insertBookingSql = "INSERT INTO bookings (name, hall_type, room, lab, booking_date, Time_Slots) VALUES (?, ?, ?, ?, ?, ?)";
                pstmt = conn.prepareStatement(insertBookingSql);

                // Set parameters
                pstmt.setString(1, userName);
                pstmt.setString(2, hallType);
                pstmt.setString(3, room);
                pstmt.setString(4, lab);
                pstmt.setString(5, bookingDate);
                pstmt.setString(6, timeSlot);

                // Execute query
                int rowsAffected = pstmt.executeUpdate();
                if (rowsAffected > 0) {
                    out.println("<script>alert('Booking Confirmed. Thank you, " + userName + ". Your reservation has been successfully made.');</script>");
                    out.println("<div class='success'><h1>Booking Confirmed</h1>");
                    out.println("<p>Thank you, " + userName + ". Your reservation has been successfully made.</p></div>");
                } else {
                    out.println("<script>alert('Error: There was an error processing your booking. Please try again later.');</script>");
                    out.println("<div class='error'><h1>Error</h1>");
                    out.println("<p>There was an error processing your booking. Please try again later.</p></div>");
                }
            } else {
                // User does not exist
                out.println("<script>alert('Error: User does not exist in the system. Please register first.');</script>");
                out.println("<div class='error'><h1>User Not Found</h1>");
                out.println("<p>The username " + userName + " does not exist. Please register before making a booking.</p></div>");
            }
        } catch (ClassNotFoundException e) {
            out.println("<div class='error'><h1>Driver Error</h1>");
            out.println("<p>Could not load database driver: " + e.getMessage() + "</p></div>");
        } catch (SQLException e) {
            out.println("<div class='error'><h1>SQL Error</h1>");
            out.println("<p>Error processing your booking: " + e.getMessage() + "</p></div>");
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                out.println("<div class='error'><h1>Resource Closing Error</h1>");
                out.println("<p>Error closing database resources: " + e.getMessage() + "</p></div>");
            }
        }
    }
%>

    </div>
</div>

</body>
</html>
