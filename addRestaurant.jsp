<%@ page import="java.sql.*" %>
<% 
    try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
    }
    catch(ClassNotFoundException cnf){
        out.print(cnf);
    }
    int counter = 1 ;
    try{
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe" , "system" , "root");
        Statement st = con.createStatement();
        String rname =request.getParameter("rname");
        String rtype=request.getParameter("rtype");
        String rdesc=request.getParameter("rdesc");
        String rcity=request.getParameter("rcity");
        String rarea=request.getParameter("rarea");
        String rcadd=request.getParameter("rcadd");
        String rotime=request.getParameter("rotime");
        String rctime=request.getParameter("rctime");
        String rphone=request.getParameter("rphone");
        String remail=request.getParameter("remail");
        String rweb=request.getParameter("rweb");
        String rdish=request.getParameter("rdish");
        String rfeat=request.getParameter("rfeat");


        PreparedStatement pst = con.prepareStatement("Insert into restaurant values(restIdSeq.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?,?,?,0.0,0)");

        
        int i=0; 
        pst.setString(1,rname);
        pst.setString(2,rtype);
        pst.setString(3,rdesc);
        pst.setString(4,rcity);
        pst.setString(5,rarea);
        pst.setString(6,rcadd);
        pst.setString(7,rotime);
        pst.setString(8,rctime);
        pst.setString(9,rphone);
        pst.setString(10,remail);
        pst.setString(11,rweb);
        pst.setString(12,rdish);
        pst.setString(13,rfeat);
        pst.executeUpdate();
        ++counter;
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
            <div class="card-title text-success">
                <h1>Thank You!</h1>
                <hr>
            </div>
            <div class="card-body">
                <b>Your contribution will help foodies like you find their next go to destination.</b> 
            </div>
            <div class="row text-center">
                <div class="col-4"></div>
                <div class="col-4">
                    <a href="index.html" class="btn btn-success" >Go Back </a>
                </div>
                
            </div>
            
        </div>  
    </div>
    </body>
        
        </html>


<%        
        con.close();
    }
    catch(SQLException e){
        out.print(e);
        out.print("<h4 style='color:red'>Error with Restaurant " + counter + " Data!</h4>");
        out.print("<h4 style='color:red'>Registration Failed</h4>");
    }
%>