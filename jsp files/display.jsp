<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Emergency Shelter Records</title>
        <style>  
            /* General Body Styling */
            body {
                margin: 0;
                padding: 0;
                background: url('images/wildfire.jpg') no-repeat center center/cover;
                font-family: Arial, sans-serif;
/*                background-color: #f4f4f9;*/
                text-align: center;
                min-height: 100vh;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            /* Header */
            h1 {
                color: black;
                margin-top: 20px;
            }

            /* Card Container */
            .card-container {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                gap: 1rem;
                margin: 20px auto;
            }

            /* Individual Cards */
            .card {
                background-color: #a8997c;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                padding: 1.5rem;
                width: 300px;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }

            .card:hover {
                background: white;
                transform: translateY(-10px);
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
            }

            .card h3 {
                margin: 0;
                font-size: 1.2rem;
                color: #333;
            }

            .card p {
                font-size: 1rem;
                color: #666;
                margin-top: 0.5rem;
            }

            /* Footer Buttons */
            .footer {
                width: 100%;
                position: fixed;
                bottom: 20px;
                display: flex;
                gap: 15rem;
                justify-content: center;
                padding: 20px 40px;
            }

            .footer-btn {
                background-color:#a8997c;
                color: white;
                border: 0px;
                left: 40px;
                padding: 0.8rem 1.5rem;
                font-size: 1rem;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease, transform 0.2s ease;
            }

            .footer-btn:hover {
                background-color: #45a049;
                transform: translateY(-5px);
            }

               .footer-text {
        position: fixed;
        bottom: 70px;
        left: 0;
        width: 100%;
        overflow: hidden;
        white-space: nowrap;
    }

    .footer-text h4 {
        display: inline-block;
        font-size: 1rem;
        color: black;
        margin: 0;
        font-family: 'Arial', sans-serif;
        animation: scroll-left 10s linear infinite;
    }

    @keyframes scroll-left {
        from {
            transform: translateX(100%);
        }
        to {
            transform: translateX(-100%);
        }
    }
            /* Left-aligned Text */
/*            .footer-text {
                position: fixed;
                bottom: 70px;
                left: 40px;
                font-size: 1rem;
                color: black;
                margin-bottom: 10px;
                font-family: 'Arial', sans-serif;
            }*/
        </style>
    </head>
    <body>
        <h1>Emergency Shelter</h1>
        
        <div class="card-container">
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smx", "root", "");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM volunters;");

                    while (rs.next()) {
                        String name = rs.getString(1);
                        String phone  = rs.getString(2);
                        String address = rs.getString(3);
                        String availability = rs.getString(4);
            %>
                        <div class="card">
                            <h3><%= name %></h3>
                            <p>Phone: <%= phone %></p>
                            <p>Address: <%= address %></p>
                            <p>Availability: <%= availability %></p>
                        </div>
            <%
                    }
                    con.close();
                } catch (ClassNotFoundException | SQLException ex) {
                    out.println("Error: " + ex.getMessage());
                }
            %>
        </div>

        <!-- Footer with Buttons -->
        <div class="footer">
            <!-- Update Details Button -->
            <button class="footer-btn" onclick="window.location.href='update.html';">Update Details</button>
            
            <!-- Provide Details Button -->
            <button class="footer-btn" onclick="window.location.href='add.html';">Provide Details</button>
        </div>
        
        <!-- Footer Text -->
        <div class="footer-text">
    <h4 class="marquee">Kindly update the details if the accommodation is occupied.</h4>
</div>
</html>
