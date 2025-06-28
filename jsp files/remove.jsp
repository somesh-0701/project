<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <style>
        /* Style for the card */
        body{
            background-image: url('images/dell.jpg');
      background-size: cover;
      background-position: center;
        }
        .card {
            width: 300px;
            padding: 20px;
            border-radius: 15px;
            background-color: #f1f1f1;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
            font-family: Arial, sans-serif;
            color: #333;
            margin: 100px auto;
        }

        /* Green tick mark */
        .tick {
            color: #4CAF50;
            font-size: 50px;
            margin-bottom: 20px;
        }

        /* Success message with colorful font */
        .message {
            font-size: 18px;
            font-weight: bold;
            color: #FF6347; /* Tomato color */
            background: -webkit-linear-gradient(45deg, #FF6347, #FFD700);
            -webkit-background-clip: text;
            color: transparent;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
            margin-bottom: 20px;
        }

        /* Button Style */
        .btn {
            background-color: #008CBA; /* Blue */
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            text-align: center;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #005f73;
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

        String query = "DELETE FROM volunters WHERE name='" + vname + "';";

        stmt.executeUpdate(query);
        con.close();

%>

        <div class="card">
            <div class="tick">&#10004;</div>
            <div class="message">DETAILS REMOVED SUCCESSFULLY</div>
            <a href="admin.html" class="btn">Back to Admin Dashboard</a>
        </div>

<%
    } catch (ClassNotFoundException ex) {
        out.println(ex.getMessage());
    }
%>

</body>
</html>
