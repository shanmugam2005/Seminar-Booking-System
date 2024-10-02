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
    List<String> bookedSlots33 = new ArrayList<>();
    List<String> bookedSlots44 = new ArrayList<>();
    Calendar calendar = Calendar.getInstance();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    String todayDate = sdf.format(calendar.getTime());

    // Get tomorrow's date
    calendar.add(Calendar.DAY_OF_YEAR, 1);
    String tomorrowDate = sdf.format(calendar.getTime());

    List<String> bookedSlots = new ArrayList<>();
    List<String> bookedSlots2 = new ArrayList<>();
    List<String> bookedSlots3 = new ArrayList<>();
    List<String> bookedSlots4= new ArrayList<>();

    List<String> bookedSlotsCisco= new ArrayList<>();
    List<String> bookedSlotsCisco11= new ArrayList<>();
    List<String> bookedSlotsRm= new ArrayList<>();
    List<String> bookedSlotsRm11= new ArrayList<>();
    List<String> bookedSlotsAbj= new ArrayList<>();
    List<String> bookedSlotsAbj11= new ArrayList<>();

    List<String> bookedSlotsF12= new ArrayList<>();
    List<String> bookedSlotsF121 = new ArrayList<>();
    List<String> bookedSlotsF14 = new ArrayList<>();
    List<String> bookedSlotsF141 = new ArrayList<>();
    List<String> bookedSlotsF15 = new ArrayList<>();
    List<String> bookedSlotsF151 = new ArrayList<>();

    String dbURL = "jdbc:mysql://localhost:3306/booking";
    String dbUser = "root";
    String dbPassword = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); // Load the MySQL JDBC driver
        Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword); // Establish connection
        
       PreparedStatement stmt = conn.prepareStatement("SELECT Time_Slots FROM bookings WHERE Hall_Type =? and booking_date=? and lab=? "); 
// Prepare SQL query
        stmt.setString(1,"lab");
        stmt.setString(3,"ICL");
        stmt.setString(2,todayDate);

          ResultSet rs = stmt.executeQuery(); // Execute the query
        
        while (rs.next()) { // Loop through the results
            String timeSlotsString = rs.getString("Time_Slots"); // Get the booked time slots
            if (timeSlotsString != null) {
                String[] timeSlotsArray = timeSlotsString.split(","); // Split by comma
                for (String slot : timeSlotsArray) {
                    bookedSlots4.add(slot.trim()); // Trim and add to the list
                }
            }
        }
        stmt = conn.prepareStatement("SELECT Time_Slots FROM bookings WHERE Hall_Type =? and booking_date=? and lab=?"); 
// Prepare SQL query
        stmt.setString(1,"lab");
        stmt.setString(2,todayDate);
        stmt.setString(3,"RM");
          rs = stmt.executeQuery(); // Execute the query
        
        while (rs.next()) { // Loop through the results
            String timeSlotsString = rs.getString("Time_Slots"); // Get the booked time slots
            if (timeSlotsString != null) {
                String[] timeSlotsArray = timeSlotsString.split(","); // Split by comma
                for (String slot : timeSlotsArray) {
                    bookedSlotsRm.add(slot.trim()); // Trim and add to the list
                }
            }
        }
        
        stmt = conn.prepareStatement("SELECT Time_Slots FROM bookings WHERE Hall_Type =? and booking_date=? and lab=?"); 
// Prepare SQL query
        stmt.setString(1,"lab");
        stmt.setString(2,todayDate);
        stmt.setString(3,"CISCO");
          rs = stmt.executeQuery(); // Execute the query
        
        while (rs.next()) { // Loop through the results
            String timeSlotsString = rs.getString("Time_Slots"); // Get the booked time slots
            if (timeSlotsString != null) {
                String[] timeSlotsArray = timeSlotsString.split(","); // Split by comma
                for (String slot : timeSlotsArray) {
                    bookedSlotsCisco.add(slot.trim()); // Trim and add to the list
                }
            }
        }
        stmt = conn.prepareStatement("SELECT Time_Slots FROM bookings WHERE Hall_Type =? and booking_date=? and lab=?"); 
// Prepare SQL query
        stmt.setString(1,"lab");
        stmt.setString(2,todayDate);
        stmt.setString(3,"APJ");
          rs = stmt.executeQuery(); // Execute the query
        
        while (rs.next()) { // Loop through the results
            String timeSlotsString = rs.getString("Time_Slots"); // Get the booked time slots
            if (timeSlotsString != null) {
                String[] timeSlotsArray = timeSlotsString.split(","); // Split by comma
                for (String slot : timeSlotsArray) {
                    bookedSlotsAbj.add(slot.trim()); // Trim and add to the list
                }
            }
        }
        stmt = conn.prepareStatement("SELECT Time_Slots FROM bookings WHERE Hall_Type =? and booking_date=? and lab=?"); 
// Prepare SQL query
        stmt.setString(1,"lab");
        stmt.setString(2,tomorrowDate);
        stmt.setString(3,"APJ");
          rs = stmt.executeQuery(); // Execute the query
        
        while (rs.next()) { // Loop through the results
            String timeSlotsString = rs.getString("Time_Slots"); // Get the booked time slots
            if (timeSlotsString != null) {
                String[] timeSlotsArray = timeSlotsString.split(","); // Split by comma
                for (String slot : timeSlotsArray) {
                    bookedSlotsAbj11.add(slot.trim()); // Trim and add to the list
                }
            }
        }
        stmt = conn.prepareStatement("SELECT Time_Slots FROM bookings WHERE Hall_Type =? and booking_date=? and lab=?"); 
// Prepare SQL query
        stmt.setString(1,"lab");
        stmt.setString(2,tomorrowDate);
        stmt.setString(3,"CISCO");
          rs = stmt.executeQuery(); // Execute the query
        
        while (rs.next()) { // Loop through the results
            String timeSlotsString = rs.getString("Time_Slots"); // Get the booked time slots
            if (timeSlotsString != null) {
                String[] timeSlotsArray = timeSlotsString.split(","); // Split by comma
                for (String slot : timeSlotsArray) {
                    bookedSlotsCisco11.add(slot.trim()); // Trim and add to the list
                }
            }
        }
        stmt = conn.prepareStatement("SELECT Time_Slots FROM bookings WHERE Hall_Type =? and booking_date=? and lab=?"); 
// Prepare SQL query
        stmt.setString(1,"lab");
        stmt.setString(2,tomorrowDate);
        stmt.setString(3,"ICL");
          rs = stmt.executeQuery(); // Execute the query
        
        while (rs.next()) { // Loop through the results
            String timeSlotsString = rs.getString("Time_Slots"); // Get the booked time slots
            if (timeSlotsString != null) {
                String[] timeSlotsArray = timeSlotsString.split(","); // Split by comma
                for (String slot : timeSlotsArray) {
                    bookedSlots44.add(slot.trim()); // Trim and add to the list
                }
            }
        }
         stmt = conn.prepareStatement("SELECT Time_Slots FROM bookings WHERE Hall_Type =? and booking_date=? and lab=?"); 
// Prepare SQL query
        stmt.setString(1,"lab");
        stmt.setString(2,tomorrowDate);
        stmt.setString(3,"RM");
          rs = stmt.executeQuery(); // Execute the query
        
        while (rs.next()) { // Loop through the results
            String timeSlotsString = rs.getString("Time_Slots"); // Get the booked time slots
            if (timeSlotsString != null) {
                String[] timeSlotsArray = timeSlotsString.split(","); // Split by comma
                for (String slot : timeSlotsArray) {
                    bookedSlotsRm11.add(slot.trim()); // Trim and add to the list
                }
            }
        }
        stmt = conn.prepareStatement("SELECT Time_Slots FROM bookings WHERE Hall_Type =? and booking_date=?"); 
// Prepare SQL query
        stmt.setString(1,"seminar");
        stmt.setString(2,todayDate);
        rs = stmt.executeQuery(); // Execute the query
        
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
        stmt.setString(1,"seminar");
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
        stmt.setString(1,"conference");
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
        stmt.setString(1,"conference");
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
        
        
        
       stmt = conn.prepareStatement("SELECT Time_Slots FROM bookings WHERE Hall_Type =? and booking_date=?and room=?"); 
// Prepare SQL query
        stmt.setString(1,"lecture");
        stmt.setString(2,todayDate);
        stmt.setString(3,"F9");
        rs = stmt.executeQuery(); // Execute the query
        
        while (rs.next()) { // Loop through the results
            String timeSlotsString = rs.getString("Time_Slots"); // Get the booked time slots
            if (timeSlotsString != null) {
                String[] timeSlotsArray = timeSlotsString.split(","); // Split by comma
                for (String slot : timeSlotsArray) {
                    bookedSlots3.add(slot.trim()); // Trim and add to the list
                }
            }
        }
        
        stmt = conn.prepareStatement("SELECT Time_Slots FROM bookings WHERE Hall_Type =? and booking_date=?and room=?"); 
// Prepare SQL query
        stmt.setString(1,"lecture");
        stmt.setString(2,todayDate);
        stmt.setString(3,"F12");
        rs = stmt.executeQuery(); // Execute the query
        
        while (rs.next()) { // Loop through the results
            String timeSlotsString = rs.getString("Time_Slots"); // Get the booked time slots
            if (timeSlotsString != null) {
                String[] timeSlotsArray = timeSlotsString.split(","); // Split by comma
                for (String slot : timeSlotsArray) {
                    bookedSlotsF12.add(slot.trim()); // Trim and add to the list
                }
            }
        }
        stmt = conn.prepareStatement("SELECT Time_Slots FROM bookings WHERE Hall_Type =? and booking_date=?and room=?"); 
// Prepare SQL query
        stmt.setString(1,"lecture");
        stmt.setString(2,todayDate);
        stmt.setString(3,"F14");
        rs = stmt.executeQuery(); // Execute the query
        
        while (rs.next()) { // Loop through the results
            String timeSlotsString = rs.getString("Time_Slots"); // Get the booked time slots
            if (timeSlotsString != null) {
                String[] timeSlotsArray = timeSlotsString.split(","); // Split by comma
                for (String slot : timeSlotsArray) {
                    bookedSlotsF14.add(slot.trim()); // Trim and add to the list
                }
            }
        }
        stmt = conn.prepareStatement("SELECT Time_Slots FROM bookings WHERE Hall_Type =? and booking_date=?and room=?"); 
// Prepare SQL query
        stmt.setString(1,"lecture");
        stmt.setString(2,todayDate);
        stmt.setString(3,"F15");
        rs = stmt.executeQuery(); // Execute the query
        
        while (rs.next()) { // Loop through the results
            String timeSlotsString = rs.getString("Time_Slots"); // Get the booked time slots
            if (timeSlotsString != null) {
                String[] timeSlotsArray = timeSlotsString.split(","); // Split by comma
                for (String slot : timeSlotsArray) {
                    bookedSlotsF15.add(slot.trim()); // Trim and add to the list
                }
            }
        }
        
        stmt = conn.prepareStatement("SELECT Time_Slots FROM bookings WHERE Hall_Type =? and booking_date=? and room=?"); 
// Prepare SQL query
        stmt.setString(1,"lecture");
        stmt.setString(2,tomorrowDate);
        stmt.setString(3,"F15");

        rs = stmt.executeQuery(); // Execute the query
        
        while (rs.next()) { // Loop through the results
            String timeSlotsString = rs.getString("Time_Slots"); // Get the booked time slots
            if (timeSlotsString != null) {
                String[] timeSlotsArray = timeSlotsString.split(","); // Split by comma
                for (String slot : timeSlotsArray) {
                    bookedSlotsF151.add(slot.trim()); // Trim and add to the list
                }
            }
        }
        stmt = conn.prepareStatement("SELECT Time_Slots FROM bookings WHERE Hall_Type =? and booking_date=? and room=?"); 
// Prepare SQL query
        stmt.setString(1,"lecture");
        stmt.setString(2,tomorrowDate);
        stmt.setString(3,"F12");

        rs = stmt.executeQuery(); // Execute the query
        
        while (rs.next()) { // Loop through the results
            String timeSlotsString = rs.getString("Time_Slots"); // Get the booked time slots
            if (timeSlotsString != null) {
                String[] timeSlotsArray = timeSlotsString.split(","); // Split by comma
                for (String slot : timeSlotsArray) {
                    bookedSlotsF121.add(slot.trim()); // Trim and add to the list
                }
            }
        }
        
        stmt = conn.prepareStatement("SELECT Time_Slots FROM bookings WHERE Hall_Type =? and booking_date=? and room=?"); 
// Prepare SQL query
        stmt.setString(1,"lecture");
        stmt.setString(2,tomorrowDate);
        stmt.setString(3,"F14");

        rs = stmt.executeQuery(); // Execute the query
        
        while (rs.next()) { // Loop through the results
            String timeSlotsString = rs.getString("Time_Slots"); // Get the booked time slots
            if (timeSlotsString != null) {
                String[] timeSlotsArray = timeSlotsString.split(","); // Split by comma
                for (String slot : timeSlotsArray) {
                    bookedSlotsF141.add(slot.trim()); // Trim and add to the list
                }
            }
        }
         
       stmt = conn.prepareStatement("SELECT Time_Slots FROM bookings WHERE Hall_Type =? and booking_date=? and room=?"); 
// Prepare SQL query
        stmt.setString(1,"lecture");
        stmt.setString(2,tomorrowDate);
        stmt.setString(3,"F9");

        rs = stmt.executeQuery(); // Execute the query
        
        while (rs.next()) { // Loop through the results
            String timeSlotsString = rs.getString("Time_Slots"); // Get the booked time slots
            if (timeSlotsString != null) {
                String[] timeSlotsArray = timeSlotsString.split(","); // Split by comma
                for (String slot : timeSlotsArray) {
                    bookedSlots33.add(slot.trim()); // Trim and add to the list
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
    if(hall==='F9'){
        if (value ==="<%= todayDate %>"){
    document.getElementById("time-slots-container2").innerHTML = `
    <div class="<%=bookedSlots3.contains("9:15 - 10:05") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots3.contains("9:15 - 10:05") ? "" : "selectSlot(this,'selected-slot3')" %>">
        9:15 - 10:05
    </div>
    <div class="<%= bookedSlots3.contains("10:05 - 10:55") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots3.contains("10:05 - 10:55") ? "" : "selectSlot(this,'selected-slot3')" %>">
        10:05 - 10:55
    </div>
    <div class="<%= bookedSlots3.contains("11:10 - 12:00") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots3.contains("11:10 - 12:00") ? "" : "selectSlot(this,'selected-slot3')" %>">
        11:10 - 12:00
    </div>
    <div class="<%= bookedSlots3.contains("12:00 - 12:50") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots3.contains("12:00 - 12:50") ? "" : "selectSlot(this,'selected-slot3')" %>">
        12:00 - 12:50
    </div>
    <div class="<%= bookedSlots3.contains("13:50 - 14:40") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots3.contains("13:50 - 14:40") ? "" : "selectSlot(this,'selected-slot3')" %>">
        13:50 - 14:40
    </div>
    <div class="<%= bookedSlots3.contains("14:40 - 15:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots3.contains("14:40 - 15:30") ? "" : "selectSlot(this,'selected-slot3')" %>">
        14:40 - 15:30
    </div>
    <div class="<%= bookedSlots3.contains("15:45 - 16:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots3.contains("15:45 - 16:30") ? "" : "selectSlot(this,'selected-slot3')" %>">
        15:45 - 16:30
    </div>
    <div class="<%= bookedSlots3.contains("16:30 - 17:15") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots3.contains("16:30 - 17:15") ? "" : "selectSlot(this,'selected-slot3')" %>">
        16:30 - 17:15
    </div>
        `;
    }
    else{
        document.getElementById("time-slots-container2").innerHTML = `
    <div class="<%=bookedSlots33.contains("9:15 - 10:05") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots33.contains("9:15 - 10:05") ? "" : "selectSlot(this,'selected-slot3')" %>">
        9:15 - 10:05
    </div>
    <div class="<%= bookedSlots33.contains("10:05 - 10:55") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots33.contains("10:05 - 10:55") ? "" : "selectSlot(this,'selected-slot3')" %>">
        10:05 - 10:55
    </div>
    <div class="<%= bookedSlots33.contains("11:10 - 12:00") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots33.contains("11:10 - 12:00") ? "" : "selectSlot(this,'selected-slot3')" %>">
        11:10 - 12:00
    </div>
    <div class="<%= bookedSlots33.contains("12:00 - 12:50") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots33.contains("12:00 - 12:50") ? "" : "selectSlot(this,'selected-slot3')" %>">
        12:00 - 12:50
    </div>
    <div class="<%= bookedSlots33.contains("13:50 - 14:40") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots33.contains("13:50 - 14:40") ? "" : "selectSlot(this,'selected-slot3')" %>">
        13:50 - 14:40
    </div>
    <div class="<%= bookedSlots33.contains("14:40 - 15:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots33.contains("14:40 - 15:30") ? "" : "selectSlot(this,'selected-slot3')" %>">
        14:40 - 15:30
    </div>
    <div class="<%= bookedSlots33.contains("15:45 - 16:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots33.contains("15:45 - 16:30") ? "" : "selectSlot(this,'selected-slot3')" %>">
        15:45 - 16:30
    </div>
    <div class="<%= bookedSlots33.contains("16:30 - 17:15") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots33.contains("16:30 - 17:15") ? "" : "selectSlot(this,'selected-slot3')" %>">
        16:30 - 17:15
    </div>
        `;
    }
    }
    if(hall==='ICL'){
        if (value ==="<%= todayDate %>"){
    document.getElementById("time-slots-container3").innerHTML = `
    <div class="<%= bookedSlots4.contains("9:15 - 10:05") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots4.contains("9:15 - 10:05") ? "" : "selectSlot(this,'selected-slot4')" %>">
        9:15 - 10:05
    </div>
    <div class="<%= bookedSlots4.contains("10:05 - 10:55") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots4.contains("10:05 - 10:55") ? "" : "selectSlot(this,'selected-slot4')" %>">
        10:05 - 10:55
    </div>
    <div class="<%= bookedSlots4.contains("11:10 - 12:00") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots4.contains("11:10 - 12:00") ? "" : "selectSlot(this,'selected-slot4')" %>">
        11:10 - 12:00
    </div>
    <div class="<%= bookedSlots4.contains("12:00 - 12:50") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots4.contains("12:00 - 12:50") ? "" : "selectSlot(this,'selected-slot4')" %>">
        12:00 - 12:50
    </div>
    <div class="<%= bookedSlots4.contains("13:50 - 14:40") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots4.contains("13:50 - 14:40") ? "" : "selectSlot(this,'selected-slot4')" %>">
        13:50 - 14:40
    </div>
    <div class="<%= bookedSlots4.contains("14:40 - 15:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots4.contains("14:40 - 15:30") ? "" : "selectSlot(this,'selected-slot4')" %>">
        14:40 - 15:30
    </div>
    <div class="<%= bookedSlots4.contains("15:45 - 16:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots4.contains("15:45 - 16:30") ? "" : "selectSlot(this,'selected-slot4')" %>">
        15:45 - 16:30
    </div>
    <div class="<%= bookedSlots4.contains("16:30 - 17:15") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots4.contains("16:30 - 17:15") ? "" : "selectSlot(this,'selected-slot4')" %>">
        16:30 - 17:15
    </div>
        `;
    }
    else{
        document.getElementById("time-slots-container3").innerHTML = `
    <div class="<%= bookedSlots44.contains("9:15 - 10:05") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots44.contains("9:15 - 10:05") ? "" : "selectSlot(this,'selected-slot4')" %>">
        9:15 - 10:05
    </div>
    <div class="<%= bookedSlots44.contains("10:05 - 10:55") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots44.contains("10:05 - 10:55") ? "" : "selectSlot(this,'selected-slot4')" %>">
        10:05 - 10:55
    </div>
    <div class="<%= bookedSlots44.contains("11:10 - 12:00") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots44.contains("11:10 - 12:00") ? "" : "selectSlot(this,'selected-slot4')" %>">
        11:10 - 12:00
    </div>
    <div class="<%= bookedSlots44.contains("12:00 - 12:50") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots44.contains("12:00 - 12:50") ? "" : "selectSlot(this,'selected-slot4')" %>">
        12:00 - 12:50
    </div>
    <div class="<%= bookedSlots44.contains("13:50 - 14:40") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots44.contains("13:50 - 14:40") ? "" : "selectSlot(this,'selected-slot4')" %>">
        13:50 - 14:40
    </div>
    <div class="<%= bookedSlots44.contains("14:40 - 15:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots44.contains("14:40 - 15:30") ? "" : "selectSlot(this,'selected-slot4')" %>">
        14:40 - 15:30
    </div>
    <div class="<%= bookedSlots44.contains("15:45 - 16:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots44.contains("15:45 - 16:30") ? "" : "selectSlot(this,'selected-slot4')" %>">
        15:45 - 16:30
    </div>
    <div class="<%= bookedSlots44.contains("16:30 - 17:15") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlots44.contains("16:30 - 17:15") ? "" : "selectSlot(this,'selected-slot4')" %>">
        16:30 - 17:15
    </div>
        `;
    }
    }
    if(hall==='RM'){
        if (value ==="<%= todayDate %>"){
    document.getElementById("time-slots-container3").innerHTML = `
    <div class="<%= bookedSlotsRm.contains("9:15 - 10:05") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsRm.contains("9:15 - 10:05") ? "" : "selectSlot(this,'selected-slot4')" %>">
        9:15 - 10:05
    </div>
    <div class="<%= bookedSlotsRm.contains("10:05 - 10:55") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsRm.contains("10:05 - 10:55") ? "" : "selectSlot(this,'selected-slot4')" %>">
        10:05 - 10:55
    </div>
    <div class="<%= bookedSlotsRm.contains("11:10 - 12:00") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsRm.contains("11:10 - 12:00") ? "" : "selectSlot(this,'selected-slot4')" %>">
        11:10 - 12:00
    </div>
    <div class="<%= bookedSlotsRm.contains("12:00 - 12:50") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsRm.contains("12:00 - 12:50") ? "" : "selectSlot(this,'selected-slot4')" %>">
        12:00 - 12:50
    </div>
    <div class="<%= bookedSlotsRm.contains("13:50 - 14:40") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsRm.contains("13:50 - 14:40") ? "" : "selectSlot(this,'selected-slot4')" %>">
        13:50 - 14:40
    </div>
    <div class="<%= bookedSlotsRm.contains("14:40 - 15:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsRm.contains("14:40 - 15:30") ? "" : "selectSlot(this,'selected-slot4')" %>">
        14:40 - 15:30
    </div>
    <div class="<%= bookedSlotsRm.contains("15:45 - 16:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsRm.contains("15:45 - 16:30") ? "" : "selectSlot(this,'selected-slot4')" %>">
        15:45 - 16:30
    </div>
    <div class="<%= bookedSlotsRm.contains("16:30 - 17:15") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsRm.contains("16:30 - 17:15") ? "" : "selectSlot(this,'selected-slot4')" %>">
        16:30 - 17:15
    </div>
        `;
    }
    else{
        document.getElementById("time-slots-container3").innerHTML = `
    <div class="<%= bookedSlotsRm11.contains("9:15 - 10:05") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsRm11.contains("9:15 - 10:05") ? "" : "selectSlot(this,'selected-slot4')" %>">
        9:15 - 10:05
    </div>
    <div class="<%= bookedSlotsRm11.contains("10:05 - 10:55") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsRm11.contains("10:05 - 10:55") ? "" : "selectSlot(this,'selected-slot4')" %>">
        10:05 - 10:55
    </div>
    <div class="<%= bookedSlotsRm11.contains("11:10 - 12:00") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsRm11.contains("11:10 - 12:00") ? "" : "selectSlot(this,'selected-slot4')" %>">
        11:10 - 12:00
    </div>
    <div class="<%= bookedSlotsRm11.contains("12:00 - 12:50") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsRm11.contains("12:00 - 12:50") ? "" : "selectSlot(this,'selected-slot4')" %>">
        12:00 - 12:50
    </div>
    <div class="<%= bookedSlotsRm11.contains("13:50 - 14:40") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsRm11.contains("13:50 - 14:40") ? "" : "selectSlot(this,'selected-slot4')" %>">
        13:50 - 14:40
    </div>
    <div class="<%= bookedSlotsRm11.contains("14:40 - 15:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsRm11.contains("14:40 - 15:30") ? "" : "selectSlot(this,'selected-slot4')" %>">
        14:40 - 15:30
    </div>
    <div class="<%= bookedSlotsRm11.contains("15:45 - 16:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsRm11.contains("15:45 - 16:30") ? "" : "selectSlot(this,'selected-slot4')" %>">
        15:45 - 16:30
    </div>
    <div class="<%= bookedSlotsRm11.contains("16:30 - 17:15") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsRm11.contains("16:30 - 17:15") ? "" : "selectSlot(this,'selected-slot4')" %>">
        16:30 - 17:15
    </div>
        `;
    }
          
    }
    if(hall==='APJ'){
        if (value ==="<%= todayDate %>"){
    document.getElementById("time-slots-container3").innerHTML = `
    <div class="<%= bookedSlotsAbj.contains("9:15 - 10:05") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsAbj.contains("9:15 - 10:05") ? "" : "selectSlot(this,'selected-slot4')" %>">
        9:15 - 10:05
    </div>
    <div class="<%= bookedSlotsAbj.contains("10:05 - 10:55") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsAbj.contains("10:05 - 10:55") ? "" : "selectSlot(this,'selected-slot4')" %>">
        10:05 - 10:55
    </div>
    <div class="<%= bookedSlotsAbj.contains("11:10 - 12:00") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsAbj.contains("11:10 - 12:00") ? "" : "selectSlot(this,'selected-slot4')" %>">
        11:10 - 12:00
    </div>
    <div class="<%= bookedSlotsAbj.contains("12:00 - 12:50") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsAbj.contains("12:00 - 12:50") ? "" : "selectSlot(this,'selected-slot4')" %>">
        12:00 - 12:50
    </div>
    <div class="<%= bookedSlotsAbj.contains("13:50 - 14:40") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsAbj.contains("13:50 - 14:40") ? "" : "selectSlot(this,'selected-slot4')" %>">
        13:50 - 14:40
    </div>
    <div class="<%= bookedSlotsAbj.contains("14:40 - 15:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsAbj.contains("14:40 - 15:30") ? "" : "selectSlot(this,'selected-slot4')" %>">
        14:40 - 15:30
    </div>
    <div class="<%= bookedSlotsAbj.contains("15:45 - 16:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsAbj.contains("15:45 - 16:30") ? "" : "selectSlot(this,'selected-slot4')" %>">
        15:45 - 16:30
    </div>
    <div class="<%= bookedSlotsAbj.contains("16:30 - 17:15") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsAbj.contains("16:30 - 17:15") ? "" : "selectSlot(this,'selected-slot4')" %>">
        16:30 - 17:15
    </div>
        `;
    }
    else{
        document.getElementById("time-slots-container3").innerHTML = `
    <div class="<%= bookedSlotsAbj11.contains("9:15 - 10:05") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsAbj11.contains("9:15 - 10:05") ? "" : "selectSlot(this,'selected-slot4')" %>">
        9:15 - 10:05
    </div>
    <div class="<%= bookedSlotsAbj11.contains("10:05 - 10:55") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsAbj11.contains("10:05 - 10:55") ? "" : "selectSlot(this,'selected-slot4')" %>">
        10:05 - 10:55
    </div>
    <div class="<%= bookedSlotsAbj11.contains("11:10 - 12:00") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsAbj11.contains("11:10 - 12:00") ? "" : "selectSlot(this,'selected-slot4')" %>">
        11:10 - 12:00
    </div>
    <div class="<%= bookedSlotsAbj11.contains("12:00 - 12:50") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsAbj11.contains("12:00 - 12:50") ? "" : "selectSlot(this,'selected-slot4')" %>">
        12:00 - 12:50
    </div>
    <div class="<%= bookedSlotsAbj11.contains("13:50 - 14:40") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsAbj11.contains("13:50 - 14:40") ? "" : "selectSlot(this,'selected-slot4')" %>">
        13:50 - 14:40
    </div>
    <div class="<%= bookedSlotsAbj11.contains("14:40 - 15:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsAbj11.contains("14:40 - 15:30") ? "" : "selectSlot(this,'selected-slot4')" %>">
        14:40 - 15:30
    </div>
    <div class="<%= bookedSlotsAbj11.contains("15:45 - 16:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsAbj11.contains("15:45 - 16:30") ? "" : "selectSlot(this,'selected-slot4')" %>">
        15:45 - 16:30
    </div>
    <div class="<%= bookedSlotsAbj11.contains("16:30 - 17:15") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsAbj11.contains("16:30 - 17:15") ? "" : "selectSlot(this,'selected-slot4')" %>">
        16:30 - 17:15
    </div>
        `;
    }
          
    }
    if(hall==='CISCO'){
        if (value ==="<%= todayDate %>"){
    document.getElementById("time-slots-container3").innerHTML = `
    <div class="<%= bookedSlotsCisco.contains("9:15 - 10:05") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsCisco.contains("9:15 - 10:05") ? "" : "selectSlot(this,'selected-slot4')" %>">
        9:15 - 10:05
    </div>
    <div class="<%= bookedSlotsCisco.contains("10:05 - 10:55") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsCisco.contains("10:05 - 10:55") ? "" : "selectSlot(this,'selected-slot4')" %>">
        10:05 - 10:55
    </div>
    <div class="<%= bookedSlotsCisco.contains("11:10 - 12:00") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsCisco.contains("11:10 - 12:00") ? "" : "selectSlot(this,'selected-slot4')" %>">
        11:10 - 12:00
    </div>
    <div class="<%= bookedSlotsCisco.contains("12:00 - 12:50") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsCisco.contains("12:00 - 12:50") ? "" : "selectSlot(this,'selected-slot4')" %>">
        12:00 - 12:50
    </div>
    <div class="<%= bookedSlotsCisco.contains("13:50 - 14:40") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsCisco.contains("13:50 - 14:40") ? "" : "selectSlot(this,'selected-slot4')" %>">
        13:50 - 14:40
    </div>
    <div class="<%= bookedSlotsCisco.contains("14:40 - 15:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsCisco.contains("14:40 - 15:30") ? "" : "selectSlot(this,'selected-slot4')" %>">
        14:40 - 15:30
    </div>
    <div class="<%= bookedSlotsCisco.contains("15:45 - 16:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsCisco.contains("15:45 - 16:30") ? "" : "selectSlot(this,'selected-slot4')" %>">
        15:45 - 16:30
    </div>
    <div class="<%= bookedSlotsCisco.contains("16:30 - 17:15") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsCisco.contains("16:30 - 17:15") ? "" : "selectSlot(this,'selected-slot4')" %>">
        16:30 - 17:15
    </div>
        `;
    }
    else{
        document.getElementById("time-slots-container3").innerHTML = `
    <div class="<%= bookedSlotsCisco11.contains("9:15 - 10:05") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsCisco11.contains("9:15 - 10:05") ? "" : "selectSlot(this,'selected-slot4')" %>">
        9:15 - 10:05
    </div>
    <div class="<%= bookedSlotsCisco11.contains("10:05 - 10:55") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsCisco11.contains("10:05 - 10:55") ? "" : "selectSlot(this,'selected-slot4')" %>">
        10:05 - 10:55
    </div>
    <div class="<%= bookedSlotsCisco11.contains("11:10 - 12:00") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsCisco11.contains("11:10 - 12:00") ? "" : "selectSlot(this,'selected-slot4')" %>">
        11:10 - 12:00
    </div>
    <div class="<%= bookedSlotsCisco11.contains("12:00 - 12:50") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsCisco11.contains("12:00 - 12:50") ? "" : "selectSlot(this,'selected-slot4')" %>">
        12:00 - 12:50
    </div>
    <div class="<%= bookedSlotsCisco11.contains("13:50 - 14:40") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsCisco11.contains("13:50 - 14:40") ? "" : "selectSlot(this,'selected-slot4')" %>">
        13:50 - 14:40
    </div>
    <div class="<%= bookedSlotsCisco11.contains("14:40 - 15:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsCisco11.contains("14:40 - 15:30") ? "" : "selectSlot(this,'selected-slot4')" %>">
        14:40 - 15:30
    </div>
    <div class="<%= bookedSlotsCisco11.contains("15:45 - 16:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsCisco11.contains("15:45 - 16:30") ? "" : "selectSlot(this,'selected-slot4')" %>">
        15:45 - 16:30
    </div>
    <div class="<%= bookedSlotsCisco11.contains("16:30 - 17:15") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsCisco11.contains("16:30 - 17:15") ? "" : "selectSlot(this,'selected-slot4')" %>">
        16:30 - 17:15
    </div>
        `;
    }
          
    }
     if(hall==='F12'){
        if (value ==="<%= todayDate %>"){
    document.getElementById("time-slots-container2").innerHTML = `
    <div class="<%= bookedSlotsF12.contains("9:15 - 10:05") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF12.contains("9:15 - 10:05") ? "" : "selectSlot(this,'selected-slot3')" %>">
        9:15 - 10:05
    </div>
    <div class="<%= bookedSlotsF12.contains("10:05 - 10:55") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF12.contains("10:05 - 10:55") ? "" : "selectSlot(this,'selected-slot3')" %>">
        10:05 - 10:55
    </div>
    <div class="<%= bookedSlotsF12.contains("11:10 - 12:00") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF12.contains("11:10 - 12:00") ? "" : "selectSlot(this,'selected-slot3')" %>">
        11:10 - 12:00
    </div>
    <div class="<%= bookedSlotsF12.contains("12:00 - 12:50") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF12.contains("12:00 - 12:50") ? "" : "selectSlot(this,'selected-slot3')" %>">
        12:00 - 12:50
    </div>
    <div class="<%= bookedSlotsF12.contains("13:50 - 14:40") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF12.contains("13:50 - 14:40") ? "" : "selectSlot(this,'selected-slot3')" %>">
        13:50 - 14:40
    </div>
    <div class="<%= bookedSlotsF12.contains("14:40 - 15:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF12.contains("14:40 - 15:30") ? "" : "selectSlot(this,'selected-slot3')" %>">
        14:40 - 15:30
    </div>
    <div class="<%= bookedSlotsF12.contains("15:45 - 16:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF12.contains("15:45 - 16:30") ? "" : "selectSlot(this,'selected-slot3')" %>">
        15:45 - 16:30
    </div>
    <div class="<%= bookedSlotsF12.contains("16:30 - 17:15") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF12.contains("16:30 - 17:15") ? "" : "selectSlot(this,'selected-slot3')" %>">
        16:30 - 17:15
    </div>
        `;
    }
    else{
        document.getElementById("time-slots-container2").innerHTML = `
    <div class="<%= bookedSlotsF121.contains("9:15 - 10:05") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF121.contains("9:15 - 10:05") ? "" : "selectSlot(this,'selected-slot3')" %>">
        9:15 - 10:05
    </div>
    <div class="<%= bookedSlotsF121.contains("10:05 - 10:55") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF121.contains("10:05 - 10:55") ? "" : "selectSlot(this,'selected-slot3')" %>">
        10:05 - 10:55
    </div>
    <div class="<%= bookedSlotsF121.contains("11:10 - 12:00") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF121.contains("11:10 - 12:00") ? "" : "selectSlot(this,'selected-slot3')" %>">
        11:10 - 12:00
    </div>
    <div class="<%= bookedSlotsF121.contains("12:00 - 12:50") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF121.contains("12:00 - 12:50") ? "" : "selectSlot(this,'selected-slot3')" %>">
        12:00 - 12:50
    </div>
    <div class="<%= bookedSlotsF121.contains("13:50 - 14:40") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF121.contains("13:50 - 14:40") ? "" : "selectSlot(this,'selected-slot3')" %>">
        13:50 - 14:40
    </div>
    <div class="<%= bookedSlotsF121.contains("14:40 - 15:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF121.contains("14:40 - 15:30") ? "" : "selectSlot(this,'selected-slot3')" %>">
        14:40 - 15:30
    </div>
    <div class="<%= bookedSlotsF121.contains("15:45 - 16:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF121.contains("15:45 - 16:30") ? "" : "selectSlot(this,'selected-slot3')" %>">
        15:45 - 16:30
    </div>
    <div class="<%= bookedSlotsF121.contains("16:30 - 17:15") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF121.contains("16:30 - 17:15") ? "" : "selectSlot(this,'selected-slot3')" %>">
        16:30 - 17:15
    </div>
        `;
    }
    }
     if(hall==='F14'){
        if (value ==="<%= todayDate %>"){
    document.getElementById("time-slots-container2").innerHTML = `
    <div class="<%= bookedSlotsF14.contains("9:15 - 10:05") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF14.contains("9:15 - 10:05") ? "" : "selectSlot(this,'selected-slot3')" %>">
        9:15 - 10:05
    </div>
    <div class="<%= bookedSlotsF14.contains("10:05 - 10:55") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF14.contains("10:05 - 10:55") ? "" : "selectSlot(this,'selected-slot3')" %>">
        10:05 - 10:55
    </div>
    <div class="<%= bookedSlotsF14.contains("11:10 - 12:00") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF14.contains("11:10 - 12:00") ? "" : "selectSlot(this,'selected-slot3')" %>">
        11:10 - 12:00
    </div>
    <div class="<%= bookedSlotsF14.contains("12:00 - 12:50") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF14.contains("12:00 - 12:50") ? "" : "selectSlot(this,'selected-slot3')" %>">
        12:00 - 12:50
    </div>
    <div class="<%= bookedSlotsF14.contains("13:50 - 14:40") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF14.contains("13:50 - 14:40") ? "" : "selectSlot(this,'selected-slot3')" %>">
        13:50 - 14:40
    </div>
    <div class="<%= bookedSlotsF14.contains("14:40 - 15:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF14.contains("14:40 - 15:30") ? "" : "selectSlot(this,'selected-slot3')" %>">
        14:40 - 15:30
    </div>
    <div class="<%= bookedSlotsF14.contains("15:45 - 16:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF14.contains("15:45 - 16:30") ? "" : "selectSlot(this,'selected-slot3')" %>">
        15:45 - 16:30
    </div>
    <div class="<%= bookedSlotsF14.contains("16:30 - 17:15") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF14.contains("16:30 - 17:15") ? "" : "selectSlot(this,'selected-slot3')" %>">
        16:30 - 17:15
    </div>
        `;
    }
    else{
        document.getElementById("time-slots-container2").innerHTML = `
    <div class="<%= bookedSlotsF141.contains("9:15 - 10:05") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF141.contains("9:15 - 10:05") ? "" : "selectSlot(this,'selected-slot3')" %>">
        9:15 - 10:05
    </div>
    <div class="<%= bookedSlotsF141.contains("10:05 - 10:55") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF141.contains("10:05 - 10:55") ? "" : "selectSlot(this,'selected-slot3')" %>">
        10:05 - 10:55
    </div>
    <div class="<%= bookedSlotsF141.contains("11:10 - 12:00") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF141.contains("11:10 - 12:00") ? "" : "selectSlot(this,'selected-slot3')" %>">
        11:10 - 12:00
    </div>
    <div class="<%= bookedSlotsF141.contains("12:00 - 12:50") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF141.contains("12:00 - 12:50") ? "" : "selectSlot(this,'selected-slot3')" %>">
        12:00 - 12:50
    </div>
    <div class="<%= bookedSlotsF141.contains("13:50 - 14:40") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF141.contains("13:50 - 14:40") ? "" : "selectSlot(this,'selected-slot3')" %>">
        13:50 - 14:40
    </div>
    <div class="<%= bookedSlotsF141.contains("14:40 - 15:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF141.contains("14:40 - 15:30") ? "" : "selectSlot(this,'selected-slot3')" %>">
        14:40 - 15:30
    </div>
    <div class="<%= bookedSlotsF141.contains("15:45 - 16:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF141.contains("15:45 - 16:30") ? "" : "selectSlot(this,'selected-slot3')" %>">
        15:45 - 16:30
    </div>
    <div class="<%= bookedSlotsF141.contains("16:30 - 17:15") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF141.contains("16:30 - 17:15") ? "" : "selectSlot(this,'selected-slot3')" %>">
        16:30 - 17:15
    </div>
        `;
    }
          
    }
    
          
    if(hall==='F15'){
        if (value ==="<%= todayDate %>"){
    document.getElementById("time-slots-container2").innerHTML = `
    <div class="<%= bookedSlotsF15.contains("9:15 - 10:05") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF15.contains("9:15 - 10:05") ? "" : "selectSlot(this,'selected-slot3')" %>">
        9:15 - 10:05
    </div>
    <div class="<%= bookedSlotsF15.contains("10:05 - 10:55") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF15.contains("10:05 - 10:55") ? "" : "selectSlot(this,'selected-slot3')" %>">
        10:05 - 10:55
    </div>
    <div class="<%= bookedSlotsF15.contains("11:10 - 12:00") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF15.contains("11:10 - 12:00") ? "" : "selectSlot(this,'selected-slot3')" %>">
        11:10 - 12:00
    </div>
    <div class="<%= bookedSlotsF15.contains("12:00 - 12:50") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF15.contains("12:00 - 12:50") ? "" : "selectSlot(this,'selected-slot3')" %>">
        12:00 - 12:50
    </div>
    <div class="<%= bookedSlotsF15.contains("13:50 - 14:40") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF15.contains("13:50 - 14:40") ? "" : "selectSlot(this,'selected-slot3')" %>">
        13:50 - 14:40
    </div>
    <div class="<%= bookedSlotsF15.contains("14:40 - 15:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF15.contains("14:40 - 15:30") ? "" : "selectSlot(this,'selected-slot3')" %>">
        14:40 - 15:30
    </div>
    <div class="<%= bookedSlotsF15.contains("15:45 - 16:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF15.contains("15:45 - 16:30") ? "" : "selectSlot(this,'selected-slot3')" %>">
        15:45 - 16:30
    </div>
    <div class="<%= bookedSlotsF15.contains("16:30 - 17:15") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF15.contains("16:30 - 17:15") ? "" : "selectSlot(this,'selected-slot3')" %>">
        16:30 - 17:15
    </div>
        `;
    }
    else{
        document.getElementById("time-slots-container2").innerHTML = `
    <div class="<%= bookedSlotsF151.contains("9:15 - 10:05") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF151.contains("9:15 - 10:05") ? "" : "selectSlot(this,'selected-slot3')" %>">
        9:15 - 10:05
    </div>
    <div class="<%= bookedSlotsF151.contains("10:05 - 10:55") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF151.contains("10:05 - 10:55") ? "" : "selectSlot(this,'selected-slot3')" %>">
        10:05 - 10:55
    </div>
    <div class="<%= bookedSlotsF151.contains("11:10 - 12:00") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF151.contains("11:10 - 12:00") ? "" : "selectSlot(this,'selected-slot3')" %>">
        11:10 - 12:00
    </div>
    <div class="<%= bookedSlotsF151.contains("12:00 - 12:50") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF151.contains("12:00 - 12:50") ? "" : "selectSlot(this,'selected-slot3')" %>">
        12:00 - 12:50
    </div>
    <div class="<%= bookedSlotsF151.contains("13:50 - 14:40") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF151.contains("13:50 - 14:40") ? "" : "selectSlot(this,'selected-slot3')" %>">
        13:50 - 14:40
    </div>
    <div class="<%= bookedSlotsF151.contains("14:40 - 15:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF151.contains("14:40 - 15:30") ? "" : "selectSlot(this,'selected-slot3')" %>">
        14:40 - 15:30
    </div>
    <div class="<%= bookedSlotsF151.contains("15:45 - 16:30") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF151.contains("15:45 - 16:30") ? "" : "selectSlot(this,'selected-slot3')" %>">
        15:45 - 16:30
    </div>
    <div class="<%= bookedSlotsF151.contains("16:30 - 17:15") ? "booked" : "time-slot" %>" 
         onclick="<%= bookedSlotsF151.contains("16:30 - 17:15") ? "" : "selectSlot(this,'selected-slot3')" %>">
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
            <h1>CSE Hall Booking</h1>

            <div class="hall-grid">
                <!-- Conference Hall -->
                <div class="hall">
                    <h2>Conference Hall</h2>
                    <p>This hall is suitable for meetings and conferences.</p>
                    <form action="submitBooking.jsp" method="post">
                        <input type="hidden" name="hallType" value="conference">
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


                        <button type="submit" class="booking-button">Book Conference Hall</button>
                    </form>
<button class="view-booked-dates-button" onclick="window.location.href='getBookedDates.jsp?type=conference'">Show/Hide Booked Dates</button>
                    <div id="conference-booked-dates" class="booked-dates hidden"></div>
                </div>

                <!-- Additional halls go here (Seminar, Lecture, Lab) -->
                <div class="hall">
                    <h2>Seminar Hall</h2>
                    <p>This hall is perfect for seminars and talks.</p>
                    <form action="submitBooking.jsp" method="post">
                        <input type="hidden" name="hallType" value="seminar">
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

<button type="submit" class="booking-button">Book Seminar Hall</button>
                    </form>
<button class="view-booked-dates-button" onclick="window.location.href='getBookedDates.jsp?type=seminar'">Show/Hide Booked Dates</button>
                    <div id="seminar-booked-dates" class="booked-dates hidden"></div>
                </div>

                <!-- Lecture Hall -->
                <div class="hall">
                    <h2>Lecture Hall</h2>
                    <p>This hall is ideal for lectures and educational sessions. Choose from F1 to F15.</p>
                    <form action="submitBooking.jsp" method="post">
                        <input type="hidden" name="hallType" value="lecture">
                        <label for="lecture-room">Select Room:</label>
                        <select id="lecture-room" onChange="updateTimeSlots(bookingDate.value,this.value)" name="room" >
                            <option value="F9">F9</option>
                            <option value="F12">F12</option>
                            <option value="F14">F14</option>
                            <option value="F15">F15</option>
                            <!-- Add more options here -->
                        </select><br><br>
                        <label for="lecture-date">Select Booking Date:</label>
                        <input type="date" id="conference-date" name="bookingDate" min="<%= todayDate %>" max="<%= tomorrowDate %>"   onchange="updateTimeSlots(this.value,room.value)" required >
                        <input type="hidden" id="selected-slot3" name="selectedSlot">

                        <div id="time-slots-container2" class="time-slots">
    <div class="time-slot" >9:15 - 10:05</div>
    <div class= "time-slot" >10:05 - 10:55</div>
    <div class="time-slot" >11:10 - 12:00</div>
    <div class="time-slot" >12:00 - 12:50</div>
    <div class="time-slot" >13:50 - 14:40</div>
    <div class="time-slot">14:40 - 15:30</div>
    <div class="time-slot" >15:45 - 16:30</div>
    <div class="time-slot" >16:30 - 17:15</div>
    </div>

                        <button type="submit" class="booking-button">Book Lecture Hall</button>
                    </form>
<button class="view-booked-dates-button" onclick="window.location.href='getBookedDates.jsp?type=lecture'">Show/Hide Booked Dates</button>
                    <div id="lecture-booked-dates" class="booked-dates hidden"></div>
                </div>

                <!-- Lab Hall -->
                <div class="hall">
                    <h2>Lab Hall</h2>
                    <p>This hall is equipped for laboratory sessions and experiments. Choose from the following labs:</p>
                    <form action="submitBooking.jsp" method="post">
                        <input type="hidden" name="hallType" value="lab">
                        <label for="lab-room">Select Lab:</label>
                        <select id="lab-room" onChange="updateTimeSlots(bookingDate.value,this.value)" name="lab">
                            <option value="ICL">ICL Lab</option>
                            <option value="RM" >RM Lab</option>
                            <option value="CISCO">CISCO Lab</option>
                            <option value="APJ">APJ Lab</option>
                        </select><br><br>
                        <label for="lab-date">Select Booking Date:</label>
                        <input type="date" id="conference-date" name="bookingDate" min="<%= todayDate %>" max="<%= tomorrowDate %>"   onchange="updateTimeSlots(this.value,lab.value,'time-slots-container3')" required >
                       <input type="hidden" id="selected-slot4" name="selectedSlot">

    <div id="time-slots-container3" class="time-slots">
    <div class="time-slot" >9:15 - 10:05</div>
    <div class= "time-slot" >10:05 - 10:55</div>
    <div class="time-slot" >11:10 - 12:00</div>
    <div class="time-slot" >12:00 - 12:50</div>
    <div class="time-slot" >13:50 - 14:40</div>
    <div class="time-slot">14:40 - 15:30</div>
    <div class="time-slot" >15:45 - 16:30</div>
    <div class="time-slot" >16:30 - 17:15</div>
    </div>

                        <button type="submit" class="booking-button">Book Lab Hall</button>
                    </form>
<button class="view-booked-dates-button" onclick="window.location.href='getBookedDates.jsp?type=lab'">Show/Hide Booked Dates</button>
                    <div id="lab-booked-dates" class="booked-dates hidden"></div>
                </div>

            </div>
              <button type="button" class="view-booked-dates-button" onclick="window.location.href='cancelBookedDates.jsp'">Cancel Booking</button>

        </div>
    </body>
</html>
