<%@ page import="java.sql.*,java.util.*" %>
<%  
    try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
    }
    catch(ClassNotFoundException cnf){
        out.print(cnf);
    }
    Connection con = null ;
    try{
        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe" , "system" , "root");
        Statement st = con.createStatement();
        
        
        int rrating=Integer.valueOf(request.getParameter("rate"));
        
        int id = Integer.valueOf(request.getParameter("restid"));
        
        
        String query1 = "Select rating from restaurant where restid='" +id+"'";
        ResultSet rs = st.executeQuery(query1);
        ResultSetMetaData metadata = rs.getMetaData();

        rs.next();
        float curRating=rs.getInt(1);
        String query2 = "Select noOfRating from restaurant where restid='" +id+"'";
        ResultSet rs2 = st.executeQuery(query2);
        ResultSetMetaData metadata2 = rs2.getMetaData();
        rs2.next();
        int totalRating=rs2.getInt(1)+1;
        
        float newRating=curRating+rrating;
        String uname=request.getParameter("uname");
        String phone = request.getParameter("uphone");
        String udesc=request.getParameter("feedback");

        PreparedStatement pst = con.prepareStatement("Update restaurant set rating = ? , noOfRating = ? where restid = ? ");
        pst.setFloat(1,newRating);
        pst.setInt(2,totalRating);
        pst.setInt(3,id);
        pst.executeUpdate();


        //Reviews Table
        PreparedStatement pst2 = con.prepareStatement("Insert into reviews values(reviewIdSeq.NEXTVAL,?,?,?,?,?)");
        pst2.setInt(1,id);
        pst2.setString(2,uname);
        pst2.setString(3,phone);
        pst2.setInt(4,rrating);
        pst2.setString(5,udesc);
        pst2.executeUpdate();

        %>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="styles.css">
        <style>
          input::-webkit-outer-spin-button,
          input::-webkit-inner-spin-button {
              -webkit-appearance: none;
              margin: 0;
          }
        </style>
    </head>
    <body>
        <div class="container" style="margin-left: 350px ;margin-top:200px">
        <div class="card m-5 shadow p-3 text-center " style="width: 400px;">
            <div class="card-title text-warning">
                <h1>Thank You!</h1>
                <hr>
            </div>
            <div class="card-body">
                <b>Your feedback has been added.</b> 
            </div>
            <div class="row text-center">
                <div class="col-4"></div>
                <div class="col-4">
                    <a href="allRestaurant.jsp" class="btn btn-warning" >Go Back </a>
                </div>
                
            </div>
            
        </div>  
    </div>
    </body>
        
        </html>
<%
        
        
    }
    catch(SQLException e){
        out.print(e);
        out.print("<h4 style='color:red'>Failed to update Your Rating</h4>");
    }
    finally{
        con.close();
    }
%>