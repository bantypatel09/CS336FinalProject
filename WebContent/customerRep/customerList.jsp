<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
   	<head>
    </head>
   	<body>
   	    <title>Customer List</title>
   		<h1>List of Customers With Reservations:</h1></br></br>
   		    <a href="customerRepHome.jsp">Go back</a> </br> </br>
 
		<form action="transitLineList.jsp" method="POST">
    	Produce List By Transit Line: <input type="text" name="transit_line"/> <br/>
		<input type="submit" value="submit"/> <br/> 
	 	</form> <br/>
	 	
	 	<form action="dateList.jsp" method="POST">
    	Produce List By DepartureDateTime: <input type="text" name="date"/> <br/>
		<input type="submit" value="submit"/> <br/> 
	 	</form> <br/>
             
           
   		
	   	
		
      	<!-- Retrieve train schedules from data base -->
	   	<%
	   		try{
	   			Class.forName("com.mysql.jdbc.Driver");
	   			Connection con = DriverManager.getConnection("jdbc:mysql://cs336.cl2bmz1pwrvy.us-east-2.rds.amazonaws.com:3306/proj","admin", "password");
	   			Statement st = con.createStatement();
	   		    ResultSet rs;
	   		 	rs=st.executeQuery("select c.first_name, c.last_name,  r.DepartureDateTime,r.ArrivalDateTime,t.TransitLine from Customer c, Reservation r, Train_Schedule_Data t where c.username=r.username and r.TrainId=t.TrainId");
	   		 	%>
		<table id="customerList" style="width:100%" border='1'>
		<thead>
			  <tr>
			  	  <th>First  Name</th>
			  	  <th>Last  Name</th>
			  	  <th>DepartureDateTime</th>
			  	  <th>ArrivalDateTime</th>
			  	  <th>Transit Line</th>
			  </tr>
		  </thead>
		  <tbody>
		<%
		         
				while (rs.next()) {
					  
				   
					out.print("<tr>");
					
					out.print("<td>");
					out.print(rs.getString("c.first_name"));
					out.print("</td>");
					
					out.print("<td>");
					out.print(rs.getString("c.last_name"));
					out.print("</td>");
					
					out.print("<td>");
					out.print(rs.getString("r.DepartureDateTime"));
					out.print("</td>");
					
					out.print("<td>");
					out.print(rs.getString("r.ArrivalDateTime"));
					out.print("</td>");
				
					out.print("<td>");
					out.print(rs.getString("t.TransitLine"));
					out.print("</td>");
				
					out.print("</tr>");
					
				}
	   		} catch(Exception e){
	   			e.printStackTrace();
	   		}
	   
	   	%> 	
	  
  	</script> 
  		<body>
  		
  	</body>
</html>