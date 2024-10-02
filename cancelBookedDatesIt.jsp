<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Booking</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .hall {
            background: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            margin: auto;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        label {
            display: block;
            margin: 10px 0 5px;
            color: #555;
        }
        input[type="text"], input[type="date"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        button {
            background-color: #28a745;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }
        button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<div class="hall">
    <h2>Delete Booking</h2>
    <form action="deleteBookingIt.jsp" method="post" id="deleteBookingForm">
        <label for="customer-name">Enter LMS Id:</label>
        <input type="text" id="customer-name" name="customerName" required><br><br>
        
        <label for="booking-date">Booking Date:</label>
        <input type="date" id="booking-date" name="bookingDate" required><br><br>
        
        
        <label for="booking-date">Hall_Type:</label>
        <input type="text" id="booking-date" name="hall_type" required><br><br>

        <button type="submit" class="delete-button">Delete Booking</button>
    </form>
    <button type="button" onclick="history.back()" style="background-color: #007bff; margin-top: 10px;">
    Go Back
</button>

</div>
</body>
</html>
