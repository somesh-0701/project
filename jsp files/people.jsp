<%@page contentType="text/html" pageEncoding="UTF-8" import= "java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
         try
            {
            Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smx", "root", "");
              Statement stmt=con.createStatement();

            String pname = request.getParameter("text1");
            String pnumber = request.getParameter("text2");
            String pmail = request.getParameter("text3");
//            String vavailability = request.getParameter("text4");
            String query = "insert into pdb values('"+pname+"','"+pnumber+"','"+pmail+"');";
            
            stmt.executeUpdate(query);
            con.close();
            response.sendRedirect("menupage.html");
            
//            out.println(" details provided");
             
               }
            catch(ClassNotFoundException ex)
            {
            ex.getMessage();
            }
                 
            %>
    </body>
</html>
