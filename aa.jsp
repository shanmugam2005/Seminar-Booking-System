<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet"%>
<%@ page import="java.sql.*, java.util.*" %>

<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.*" %>

<%
    // Get today's date
    List<String> bookedSlots11 = new ArrayList<>();
    List<String> bookedSlots22 = new ArrayList<>();
    Calendar calendar = Calendar.getInstance();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    String todayDate = sdf.format(calendar.getTime());

    // Get tomorrow's date
    calendar.add(Calendar.DAY_OF_YEAR, 1);
    String tomorrowDate = sdf.format(calendar.getTime());

    List<String> bookedSlots = new ArrayList<>();
    List<String> bookedSlots2 = new ArrayList<>();

    String dbURL = "jdbc:mysql://localhost:3306/booking";
    String dbUser = "root";
    String dbPassword = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); // Load the MySQL JDBC driver
        Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword); // Establish connection
        
       PreparedStatement stmt = conn.prepareStatement("SELECT Time_Slots FROM bookings WHERE Hall_Type =? and booking_date=?"); 
// Prepare SQL query
        stmt.setString(1,"Assembly");
        stmt.setString(2,todayDate);
          ResultSet rs = stmt.executeQuery(); // Execute the query
        
        while (rs.next()) { // Loop through the results
            String timeSlotsString = rs.getString("Time_Slots"); // Get the booked time slots
            if (timeSlotsString != null) {
                String[] timeSlotsArray = timeSlotsString.split(","); // Split by comma
                for (String slot : timeSlotsArray) {
                    bookedSlots2.add(slot.trim()); // Trim and add to the list
                }
            }
        }
       stmt = conn.prepareStatement("SELECT Time_Slots FROM bookings WHERE Hall_Type =? and booking_date=?"); 
// Prepare SQL query
        stmt.setString(1,"Assembly");
        stmt.setString(2,tomorrowDate);

          rs = stmt.executeQuery(); // Execute the query
        
        while (rs.next()) { // Loop through the results
            String timeSlotsString = rs.getString("Time_Slots"); // Get the booked time slots
            if (timeSlotsString != null) {
                String[] timeSlotsArray = timeSlotsString.split(","); // Split by comma
                for (String slot : timeSlotsArray) {
                    bookedSlots22.add(slot.trim()); // Trim and add to the list
                }
            }
        }
       stmt = conn.prepareStatement("SELECT Time_Slots FROM bookings WHERE Hall_Type =? and booking_date=?"); 
// Prepare SQL query
        stmt.setString(1,"Auditorium");
        stmt.setString(2,tomorrowDate);
        rs = stmt.executeQuery(); // Execute the query
        
        while (rs.next()) { // Loop through the results
            String timeSlotsString = rs.getString("Time_Slots"); // Get the booked time slots
            if (timeSlotsString != null) {
                String[] timeSlotsArray = timeSlotsString.split(","); // Split by comma
                for (String slot : timeSlotsArray) {
                    bookedSlots11.add(slot.trim()); // Trim and add to the list
                }
            }
        }
        
      stmt = conn.prepareStatement("SELECT Time_Slots FROM bookings WHERE Hall_Type =? and booking_date=?"); 
// Prepare SQL query
        stmt.setString(1,"Auditorium");
        stmt.setString(2,todayDate);
        rs = stmt.executeQuery(); // Execute the query
        
        while (rs.next()) { // Loop through the results
            String timeSlotsString = rs.getString("Time_Slots"); // Get the booked time slots
            if (timeSlotsString != null) {
                String[] timeSlotsArray = timeSlotsString.split(","); // Split by comma
                for (String slot : timeSlotsArray) {
                    bookedSlots.add(slot.trim()); // Trim and add to the list
                }
            }
        }
        
        
        
       
        
        
    } catch (SQLException e) {
        out.println("SQL Error: " + e.getMessage());
        e.printStackTrace(); // Print stack trace for debugging
    } catch (ClassNotFoundException e) {
        out.println("Driver Error: " + e.getMessage());
        e.printStackTrace(); // Print stack trace for debugging
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CSE Hall Booking</title>
        <style>
        body {
    font-family: 'Arial', sans-serif;
    margin: 20px;
    background-color: #f0f0f0;
}

.container {
    max-width: 1200px;
    margin: auto;
    padding: 20px;
    background-color: #ffffff;
    border-radius: 8px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    color: #333;
    margin-bottom: 20px;
}

.hall-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 20px;
}

.hall {
    border: 1px solid #ddd;
    padding: 20px;
    border-radius: 8px;
    background-color: #fafafa;
    transition: transform 0.3s;
}

.hall:hover {
    transform: scale(1.02);
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
}

.hall h2 {
    margin-top: 0;
    color: #4CAF50;
}

.booking-button,
.view-booked-dates-button {
    display: inline-block;
    margin-top: 10px;
    padding: 13px 24px;
    border-radius: 5px;
    font-weight: bold;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s;
}

.booking-button {
    background-color: #4CAF50;
    color: white;
}

.view-booked-dates-button {
    background-color: #FF5722;
}

.view-booked-dates-button:hover {
    background-color: #e64a19;
}

.booking-button:hover {
    background-color: #45a049;
}

.booked-dates,
.time-slots {
    margin-top: 10px;
    margin-bottom: 10px;
    background-color: #ffffff;
    padding: 15px;
    border-radius: 8px;
    border: 1px solid #ccc;
    box-shadow: 0 1px 5px rgba(0, 0, 0, 0.1);
}

.hidden {
    display: none;
}

.time-slot {
    display: inline-block;
    background-color: #2196F3;
    color: white;
    padding: 10px;
    margin: 5px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
    transition: background-color 0.3s;
}

.time-slot.selected {
    background-color: #28a745; /* Green background for selected slot */
}

.booked {
    display: inline-block;
    background-color: #28a745;
    color: white;
    padding: 10px;
    margin: 5px;
    border-radius: 5px;
    font-size: 14px;
    transition: background-color 0.3s;
    cursor: not-allowed; /* Change cursor for booked slots */
}

.selected {
    background-color: #add8e6; /* Highlight selected slots */
}

.time-slot:hover {
    background-color: #1976D2;
}
    </style>
       
        <script type="text/javascript">
            var Date;
          function selectSlot(slotElement,sldId) {
    // Toggle 'selected' class on the clicked slot
    slotElement.classList.toggle('selected');
    
    // Optionally, update a hidden input field or another element with selected slots (if needed)
    const selectedSlots = document.querySelectorAll('.time-slot.selected');
    let selectedValues = [];
    
    // Collect the text content of all selected slots
    selectedSlots.forEach(slot => selectedValues.push(slot.textContent));
    
    // Update hidden input with a comma-separated list of selected values (optional)
    const selectedSlotInput = document.getElementById(sldId);
    selectedSlotInput.value = selectedValues.join(', ');
        console.log('Selected slots:', selectedSlotInput.value);  // Debugging

}


function updateTimeSlots(value,hall){   
    if(hall==='conference'){  
    if (value ==="<%= todayDate %>"){
    document.getElementById("time-slots-container").innerHTML = `
    <div class="<%=bookedSlots.contains("9:15 - 10:05") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots.contains("9:15 - 10:05") ? "" : "selectSlot(this,'selected-slot1')" %>">
        9:15 - 10:05
    </div>
    <div class="<%= bookedSlots.contains("10:05 - 10:55") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots.contains("10:05 - 10:55") ? "" : "selectSlot(this,'selected-slot1')" %>">
        10:05 - 10:55
    </div>
    <div class="<%= bookedSlots.contains("11:10 - 12:00") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots.contains("11:10 - 12:00") ? "" : "selectSlot(this,'selected-slot1')" %>">
        11:10 - 12:00
    </div>
    <div class="<%= bookedSlots.contains("12:00 - 12:50") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots.contains("12:00 - 12:50") ? "" : "selectSlot(this,'selected-slot1')" %>">
        12:00 - 12:50
    </div>
    <div class="<%= bookedSlots.contains("13:50 - 14:40") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots.contains("13:50 - 14:40") ? "" : "selectSlot(this,'selected-slot1')" %>">
        13:50 - 14:40
    </div>
    <div class="<%= bookedSlots.contains("14:40 - 15:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots.contains("14:40 - 15:30") ? "" : "selectSlot(this,'selected-slot1')" %>">
        14:40 - 15:30
    </div>
    <div class="<%= bookedSlots.contains("15:45 - 16:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots.contains("15:45 - 16:30") ? "" : "selectSlot(this,'selected-slot1')" %>">
        15:45 - 16:30
    </div>
    <div class="<%= bookedSlots.contains("16:30 - 17:15") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots.contains("16:30 - 17:15") ? "" : "selectSlot(this,'selected-slot1')" %>">
        16:30 - 17:15
    </div>
        `;
    }
    else{
        document.getElementById("time-slots-container").innerHTML = `
    <div class="<%=bookedSlots11.contains("9:15 - 10:05") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots11.contains("9:15 - 10:05") ? "" : "selectSlot(this,'selected-slot1')" %>">
        9:15 - 10:05
    </div>
    <div class="<%= bookedSlots11.contains("10:05 - 10:55") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots11.contains("10:05 - 10:55") ? "" : "selectSlot(this,'selected-slot1')" %>">
        10:05 - 10:55
    </div>
    <div class="<%= bookedSlots11.contains("11:10 - 12:00") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots11.contains("11:10 - 12:00") ? "" : "selectSlot(this,'selected-slot1')" %>">
        11:10 - 12:00
    </div>
    <div class="<%= bookedSlots11.contains("12:00 - 12:50") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots11.contains("12:00 - 12:50") ? "" : "selectSlot(this,'selected-slot1')" %>">
        12:00 - 12:50
    </div>
    <div class="<%= bookedSlots11.contains("13:50 - 14:40") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots11.contains("13:50 - 14:40") ? "" : "selectSlot(this,'selected-slot1')" %>">
        13:50 - 14:40
    </div>
    <div class="<%= bookedSlots11.contains("14:40 - 15:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots11.contains("14:40 - 15:30") ? "" : "selectSlot(this,'selected-slot1')" %>">
        14:40 - 15:30
    </div>
    <div class="<%= bookedSlots11.contains("15:45 - 16:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots11.contains("15:45 - 16:30") ? "" : "selectSlot(this,'selected-slot1')" %>">
        15:45 - 16:30
    </div>
    <div class="<%= bookedSlots11.contains("16:30 - 17:15") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots11.contains("16:30 - 17:15") ? "" : "selectSlot(this,'selected-slot1')" %>">
        16:30 - 17:15
    </div>
        `;
    }
    }
    
    if(hall==='seminar'){
        if (value ==="<%= todayDate %>"){
    document.getElementById("time-slots-container1").innerHTML = `
    <div class="<%=bookedSlots2.contains("9:15 - 10:05") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots2.contains("9:15 - 10:05") ? "" : "selectSlot(this,'selected-slot2')" %>">
        9:15 - 10:05
    </div>
    <div class="<%= bookedSlots2.contains("10:05 - 10:55") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots2.contains("10:05 - 10:55") ? "" : "selectSlot(this,'selected-slot2')" %>">
        10:05 - 10:55
    </div>
    <div class="<%= bookedSlots2.contains("11:10 - 12:00") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots2.contains("11:10 - 12:00") ? "" : "selectSlot(this,'selected-slot2')" %>">
        11:10 - 12:00
    </div>
    <div class="<%= bookedSlots2.contains("12:00 - 12:50") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots2.contains("12:00 - 12:50") ? "" : "selectSlot(this,'selected-slot2')" %>">
        12:00 - 12:50
    </div>
    <div class="<%= bookedSlots2.contains("13:50 - 14:40") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots2.contains("13:50 - 14:40") ? "" : "selectSlot(this,'selected-slot2')" %>">
        13:50 - 14:40
    </div>
    <div class="<%= bookedSlots2.contains("14:40 - 15:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots2.contains("14:40 - 15:30") ? "" : "selectSlot(this,'selected-slot2')" %>">
        14:40 - 15:30
    </div>
    <div class="<%= bookedSlots2.contains("15:45 - 16:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots2.contains("15:45 - 16:30") ? "" : "selectSlot(this,'selected-slot2')" %>">
        15:45 - 16:30
    </div>
    <div class="<%= bookedSlots2.contains("16:30 - 17:15") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots2.contains("16:30 - 17:15") ? "" : "selectSlot(this,'selected-slot2')" %>">
        16:30 - 17:15
    </div>
        `;
    }
    else{
        document.getElementById("time-slots-container1").innerHTML = `
    <div class="<%=bookedSlots22.contains("9:15 - 10:05") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots22.contains("9:15 - 10:05") ? "" : "selectSlot(this,'selected-slot2')" %>">
        9:15 - 10:05
    </div>
    <div class="<%= bookedSlots22.contains("10:05 - 10:55") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots22.contains("10:05 - 10:55") ? "" : "selectSlot(this,'selected-slot2')" %>">
        10:05 - 10:55
    </div>
    <div class="<%= bookedSlots22.contains("11:10 - 12:00") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots22.contains("11:10 - 12:00") ? "" : "selectSlot(this,'selected-slot2')" %>">
        11:10 - 12:00
    </div>
    <div class="<%= bookedSlots22.contains("12:00 - 12:50") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots22.contains("12:00 - 12:50") ? "" : "selectSlot(this,'selected-slot2')" %>">
        12:00 - 12:50
    </div>
    <div class="<%= bookedSlots22.contains("13:50 - 14:40") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots22.contains("13:50 - 14:40") ? "" : "selectSlot(this,'selected-slot2')" %>">
        13:50 - 14:40
    </div>
    <div class="<%= bookedSlots22.contains("14:40 - 15:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots22.contains("14:40 - 15:30") ? "" : "selectSlot(this,'selected-slot2')" %>">
        14:40 - 15:30
    </div>
    <div class="<%= bookedSlots22.contains("15:45 - 16:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots22.contains("15:45 - 16:30") ? "" : "selectSlot(this,'selected-slot2')" %>">
        15:45 - 16:30
    </div>
    <div class="<%= bookedSlots22.contains("16:30 - 17:15") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots22.contains("16:30 - 17:15") ? "" : "selectSlot(this,'selected-slot2')" %>">
        16:30 - 17:15
    </div>
        `;
    }
    }
    
    
    
    }
    
    

    
    
    

 

        </script>
    </head>
    <body>
      

        
        <div class="container">
            <h1>AA Hall Booking</h1>

            <div class="hall-grid">
                <!-- Conference Hall -->
                <div class="hall">
                    <h2>Auditorium</h2>
                    <p>This hall is suitable for meetings and conferences.</p>
                    <form action="submitBooking.jsp" method="post">
                        <input type="hidden" name="hallType" value="Auditorium">
                        <label for="conference-date">Select Booking Date:</label>
                        <input type="date" id="conference-date" name="bookingDate" min="<%= todayDate %>" max="<%= tomorrowDate %>"   onchange="updateTimeSlots(this.value,'conference','time-slots-container')" required >
                        <input type="hidden" id="selected-slot1" name="selectedSlot">
                       
    <div id="time-slots-container" class="time-slots">
    <div class="time-slot" >9:15 - 10:05</div>
    <div class= "time-slot" >10:05 - 10:55</div>
    <div class="time-slot" >11:10 - 12:00</div>
    <div class="time-slot" >12:00 - 12:50</div>
    <div class="time-slot" >13:50 - 14:40</div>
    <div class="time-slot">14:40 - 15:30</div>
    <div class="time-slot" >15:45 - 16:30</div>
    <div class="time-slot" >16:30 - 17:15</div>
    </div>


                        <button type="submit" class="booking-button">Book Auditorium</button>
                    </form>
<button class="view-booked-dates-button" onclick="window.location.href='getBookedDates.jsp?type=Auditorium'">Show/Hide Booked Dates</button>
                    <div id="conference-booked-dates" class="booked-dates hidden"></div>
                </div>

                <!-- Additional halls go here (Seminar, Lecture, Lab) -->
                <div class="hall">
                    <h2>ASSEMBLY Hall</h2>
                    <p>This hall is perfect for seminars and talks.</p>
                    <form action="submitBooking.jsp" method="post">
                        <input type="hidden" name="hallType" value="Assembly">
                        <label for="seminar-date">Select Booking Date:</label>
                        <input type="date" id="conference-date" name="bookingDate" min="<%= todayDate %>" max="<%= tomorrowDate %>"   onchange="updateTimeSlots(this.value,'seminar','time-slots-container1')" required >
                                  <input type="hidden" id="selected-slot2" name="selectedSlot">

                            <div id="time-slots-container1" class="time-slots">
    <div class="time-slot" >9:15 - 10:05</div>
    <div class= "time-slot" >10:05 - 10:55</div>
    <div class="time-slot" >11:10 - 12:00</div>
    <div class="time-slot" >12:00 - 12:50</div>
    <div class="time-slot" >13:50 - 14:40</div>
    <div class="time-slot">14:40 - 15:30</div>
    <div class="time-slot" >15:45 - 16:30</div>
    <div class="time-slot" >16:30 - 17:15</div>
    </div>

<button type="submit" class="booking-button">Book Assembly Hall</button>
                    </form>
<button class="view-booked-dates-button" onclick="window.location.href='getBookedDates.jsp?type=Assembly'">Show/Hide Booked Dates</button>
                    <div id="seminar-booked-dates" class="booked-dates hidden"></div>
                </div>

                <!-- Lecture Hall -->


            </div>
                                  <button type="button" class="view-booked-dates-button" onclick="window.location.href='cancelBookedDates.jsp'">Cancel Booking</button>

        </div>
    </body>
</html>
