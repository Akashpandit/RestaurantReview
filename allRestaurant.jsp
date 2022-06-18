<%@ page import="java.sql.*" %>

<% 
    try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
    }
    catch(ClassNotFoundException cnf){
        out.print(cnf);
    }
%>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <style>
          input::-webkit-outer-spin-button,
          input::-webkit-inner-spin-button {
              -webkit-appearance: none;
              margin: 0;
          }
        </style>
    </head>
    <body class=" bg-warning">
        <div class="container-xl p-5 my-3 shadow bg-white">
            <div class="card px-3 py-0 bg-warning shadow p-3 mb-4 text-center rounded" >
                <div class="card-title text-white">
                    <h1>Rate Restaurant</h1>
                </div>
                
                </div>
                <a href="index.html" class="btn btn-dark">Go Back</a>
                
            <%
                Connection con = null ;
                try{
                    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe" , "system" , "root");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("Select * from restaurant order by RestId");
                    ResultSetMetaData metadata = rs.getMetaData();
                    int no_of_column = metadata.getColumnCount();
            %>
            <%
                    for(int i = 1 ; i <= no_of_column ; ++i){
                        //out.print("<th>" + metadata.getColumnName(i) + "</th>");
                    }
                    while(rs.next()){
            %>                        
                        <div class="card my-3 shadow p-3" >
                            <div class="row">
                                <div class="col-4 border-end">
                                    <img src="food.svg" class="card-img-top" alt="..." height="200px" width="200px" >

                                </div>
                                <div class="col-8 px-3 ">
                                    <div class="row text-primary">
                                        <div class="col-10">
                                            <h2><%=rs.getString(2)%></h2>
                                        </div>
                                        <div class="col-2 text-dark">
                                            <% if(rs.getFloat(16)>0){%>
                                            <img src="star.png" alt="" height="30px" width="30px">
                                            <% 
                                                float formattedRating=rs.getInt(15)/rs.getFloat(16);
                                                java.util.Formatter formatter = new java.util.Formatter();
                                            %>
                                            <%=formatter.format("%.1f", formattedRating)%>
                                            <%}
                                            else{
                                                out.println("No Rating");
                                            }
                                            %>
                                        </div>
                                        <div class="col-1">
                                            
                                        </div>
                                    </div>    
                                    <div class="row">
                                       
                                    </div>                               
                                <div class="row">
                                    <div class="col">
                                        <b> Type: </b><%=rs.getString(3)%></div>
                                </div>
                                <div class="row">
                                    <div class="col text-secondary">
                                        <p>
                                            <%=rs.getString(4)%>
                                        </p>
                                    </div>
                                    
                                     
                                </div>
                                <div class="row">
                                    <div class="col-1 text-center">
                                        <img src="locationPin.png" alt="" height="20px" width="20px">
                                    </div>
                                    <div class="col px-0">
                                        <%=rs.getString(6)+", "%>
                                        <%=rs.getString(5)%> 
                                    </div>
                                </div>
                                <div class="row ">
                                    <div class="col-2 px-3">
                                    <form action="#">
                                        <!-- <button class="btn btn-outline-primary my-2">Rate</button> -->
                                        <a href="rateRestaurant.jsp?id=<%= rs.getInt(1)%>" class="btn btn-outline-primary my-2">Rate</a>
                                    </form>
                                    </div>
                                    <div class="col">
                                    <form action="#">
                                        <a href="moreDetails.jsp?id=<%= rs.getInt(1)%>" class="btn btn-outline-warning my-2">View More</a>
                                    </form>
                                </div>
                                </div>
                            </div>
                        </div>
                        
                           
                        </div>
                            
            <%
                    }
                }
                catch(SQLException e){
                    e.printStackTrace();
                }
                finally{
                    con.close();
                }
            %>

            
        </div>
    </body>
</html>