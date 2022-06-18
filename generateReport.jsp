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
    <body>
        <div class="container-xl p-5 m-5 shadow">
            <div class="card px-3 py-0 bg-primary shadow p-3 mb-4 text-center rounded" >
                <div class="card-title text-white">
                    <h1>Generate Report</h1>
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
                                <div class="col-2 border-end text-center py-3">
                                    <img src="genReport.png"  alt="..." height="75px" width="80px">

                                </div>
                                <div class="col-10 px-3 ">
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
                                    <div class="col-1">
                                        <img src="locationPin.png" alt="" height="20px" width="20px">
                                    </div>
                                    <div class="col-9">
                                        <%=rs.getString(6)+", "%>
                                        <%=rs.getString(5)%> 
                                    </div>
                                    <div class="col">
                                        <a href="restaurantReport.jsp?id=<%= rs.getInt(1)%>" class="btn btn-outline-primary my-2">View Report</a>
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