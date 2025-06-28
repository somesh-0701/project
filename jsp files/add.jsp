<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <style>
        /* Style for the card */
        body{
           background-image: url('images/8807792.jpg'); 
            background-size: cover; 
            background-repeat: no-repeat; 
            background-position: center;
        }
        .card {
            width: 300px;
            padding: 20px;
            border-radius: 15px;
            background-color: #f9f9f9;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
            font-family: Arial, sans-serif;
            color: #333;
            margin: 100px auto;
        }

        /* Green bold text for the message */
        .message {
            font-size: 20px;
            font-weight: bold;
            color: #4CAF50; /* Green color */
            margin-bottom: 20px;
        }

        /* Button Style */
        .btn {
            background-color: #007BFF; /* Blue */
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            text-align: center;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .card:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smx", "root", "");
        Statement stmt = con.createStatement();

        String vname = request.getParameter("text1");
        String vcontact = request.getParameter("text2");
        String vaddress = request.getParameter("text3");
        String vavailability = request.getParameter("text4");

        String query = "INSERT INTO volunters VALUES('" + vname + "', '" + vcontact + "', '" + vaddress + "', '" + vavailability + "');";

        stmt.executeUpdate(query);
        con.close();
%>
        <!-- Display the success card -->
        <div class="card">
            <div class="message">DETAILS PROVIDED</div>
            <a href="menupage.html" class="btn">Back</a>
        </div>
<%
    } catch (ClassNotFoundException ex) {
        out.println("Error: " + ex.getMessage());
    } catch (SQLException ex) {
        out.println("Database Error: " + ex.getMessage());
    }
%>
</body>
</html>
