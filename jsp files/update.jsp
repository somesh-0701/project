<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Details Updated</title>
        <style>
            /* General Body Styling */
            body {
                margin: 0;
                padding: 0;
                font-family: 'Poppins', Arial, sans-serif;
                background-color: #f4f4f9;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                text-align: center;
                background-image: url('images/upd.jpg'); 
                background-size: cover; 
                background-repeat: no-repeat; 
                background-position: center;
            }

            /* Card Container */
            .card {
                background-color: transparent;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                padding: 2rem 3rem;
                width: 400px;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }

            .card:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
            }

            /* Text Styling */
            .card h1 {
                margin: 0 0 10px;
                font-size: 2rem;
                color: black;
            }

            .card p {
                font-size: 1.2rem;
                color: black;
                margin: 0;
                font-weight: 500;
            }

            /* Back Button */
            .btn-back {
                display: inline-block;
                margin-top: 20px;
                padding: 10px 20px;
                background-color: #007BFF;
                color: white;
                text-decoration: none;
                font-size: 1rem;
                border-radius: 5px;
                transition: background-color 0.3s ease, transform 0.3s ease;
            }

            .btn-back:hover {
                background-color: #0056b3;
                transform: translateY(-2px);
            }
        </style>
    </head>
    <body>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smx", "root", "");
                Statement stmt = con.createStatement();

                String vavailability = request.getParameter("text1");
                String vname = request.getParameter("text2");

                String query = "UPDATE volunters SET availability='" + vavailability + "' WHERE name='" + vname + "';";
                stmt.executeUpdate(query);
                con.close();
        %>
        <div class="card">
            <h1>Details Updated</h1>
            <p>Thanks for your response</p>
            <a href="menupage.html" class="btn-back">Back</a>
        </div>
        <%
            } catch (ClassNotFoundException | SQLException ex) {
                out.println("<div class='card'><h1>Error</h1><p>" + ex.getMessage() + "</p></div>");
            }
        %>
    </body>
</html>
