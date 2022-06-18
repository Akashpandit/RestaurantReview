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
        <link rel="stylesheet" href="styles.css">
        <style>
          input::-webkit-outer-spin-button,
          input::-webkit-inner-spin-button {
              -webkit-appearance: none;
              margin: 0;
          }
        </style>
    </head>
<%  
    Connection con = null ;
    try{
        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe" , "system" , "root");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("Select * from restaurant where restid=" + request.getParameter("id"));
        
        if(rs.next()){
%>
    <body>
      <div class="container shadow p-3  my-2 rounded bd-highlight">
        <div class=" text-center">
          
            <h1 class="text-primary"><%=rs.getString(2)%></h1>
            <p class="text-secondary"><%=rs.getString(6)+", "+rs.getString(5)%></p>
            <hr>
          </div>
          <form action="generateReport.jsp"  >
            <div class="card my-2 p-4 bd-highlight">
                <div class="row">
                <div class="col-1">
                  <label for="name" class="fw-bold text-center form-label">Type:</label>
                </div>
                <div class="col-3 ">
                  <p><%=rs.getString(3)%></p>
                </div>
                <div class="col-2 text-end">
                    <label for="name" class="fw-bold text-center text-success form-label">Opens At:</label>
                  </div>
                  <div class="col-2 ">
                    <p><%=rs.getString(8)+" Hrs"%></p>
  
                    
                  </div>
                  <div class="col-2 text-end">
                    <label for="name" class="fw-bold text-center text-danger form-label">Closes At:</label>
                  </div>
                  <div class="col-2  ">
                    <p><%=rs.getString(9)+" Hrs"%></p>
  
                    
                  </div>
                <div class="col-1"></div>
              </div>
              
              <div class="row">
                <div class="col-1">
                  <label for="name" class="fw-bold text-center form-label">About:</label>
                </div>
                <div class="col-8 ">
                  <p><%=rs.getString(4)%></p>

                  <div class="invalid-feedback">Please fill out this field.</div>
                </div>
                <div class="col-1"></div>
              </div>
              <div class="row">
                <div class="col-1">
                  <label for="name" class="fw-bold text-center form-label">Address:</label>
                </div>
                <div class="col-8 ">
                  <p><%=rs.getString(7)+", "+rs.getString(6)+", "+rs.getString(5)%></p>

                  <div class="invalid-feedback">Please fill out this field.</div>
                </div>
                <div class="col-1"></div>
              </div>
              <label for="name" class="fw-bold  form-label">Contact Details: </label>
              <div class="row">
                <div class="col-1 text-end px-0">
                    <img src="contact.png" alt="" width="30px" height="30px">

                </div>
                <div class="col-3 px-0">
                  <p><%=rs.getString(10)%></p>
                </div>
                <div class="col-1 text-end px-0">
                    <img src="remail.png" alt="" width="25px" height="25px">

                </div>
                  <div class="col-2 px-1">
                    <p><%=rs.getString(11)%></p>
                  </div>
                  <div class="col-1 text-end px-1">
                    <img src="web.png" alt="" width="25px" height="25px">
                </div>
                  <div class="col-2 px-0 ">
                    <p><%=rs.getString(12)%></p>  
                  </div>
                <div class="col-1"></div>
              </div>

              <div class="row">
                <div class="col-2">
                  <label for="name" class="fw-bold text-center form-label">Popular Dishes: </label>
                </div>
                <div class="col-3 ">
                  <p><%=rs.getString(13)%></p>
                </div>
                <div class="col-2 text-end">
                    <label for="name" class="fw-bold text-center form-label">Special Features:</label>
                  </div>
                  <div class="col text-start ">
                    <p><%=rs.getString(14)%></p>
  
                    
                  </div>
                  
                <div class="col-1"></div>
              </div>
              <br>
              <div class="row">
                  
                
              </div>
             


              <div class="card p-4 ">
                <div class="row">
                  <b class="card-title text-center text-dark"> <h3>Summary</h3></b>
                  <hr>
                  <div class=" card col-2 mx-1 text-center bg-warning py-4">
                    <label for="name" class="fw-bold form-label">Rating</label>
                        <% 
                        float formattedRating=rs.getInt(15)/rs.getFloat(16);
                        java.util.Formatter formatter = new java.util.Formatter();
                        %>
                        <b style="font-size: 30px;"><%=formatter.format("%.1f", formattedRating)%></b>
                  </div>
                <div class=" card col-2 text-center bg-black text-warning py-4">
                  <label for="name" class="fw-bold form-label ">No. Of Visitors</label>
                  
                        <b style="font-size: 30px;"><%=rs.getInt(16)%></b>

                </div>
                <div class="col"></div>
                  <div class="col ">
                    <%
                    ResultSet rs3=st.executeQuery("select count(rating) from reviews where rating=5 and restid=" + request.getParameter("id"));
                    rs3.next();
                   
                    
                    %>
                  <div class="row">
                    <div class="col-5">
                      
                      <img src="star.png" alt="" height="20px" width="20px">
                      <img src="star.png" alt="" height="20px" width="20px">
                      <img src="star.png" alt="" height="20px" width="20px">
                      <img src="star.png" alt="" height="20px" width="20px">
                      <img src="star.png" alt="" height="20px" width="20px">
                      
                    </div>
                    <div class="col-1">
                      <%=rs3.getInt(1)%>
                    </div>
                </div>
                <%
                ResultSet rs4=st.executeQuery("select count(rating) from reviews where rating=4 and restid=" + request.getParameter("id"));
                /*ResultSet rs6=st.executeQuery("select count(rating) from reviews where rating=2 and restid=" + request.getParameter("id"));
                ResultSet rs7=st.executeQuery("select count(rating) from reviews where rating=1 and restid=" + request.getParameter("id"));
                */
                rs4.next();
                %>
                <div class="row">
                  <div class="col-5">
                    
                    <img src="star.png" alt="" height="20px" width="20px">
                    <img src="star.png" alt="" height="20px" width="20px">
                    <img src="star.png" alt="" height="20px" width="20px">
                    <img src="star.png" alt="" height="20px" width="20px">
                    
                    
                  </div>
                  <div class="col">
                    <%=rs4.getInt(1)%>
                  </div>
              </div>
              <%
              ResultSet rs5=st.executeQuery("select count(rating) from reviews where rating=3 and restid=" + request.getParameter("id"));
                rs5.next();
              %>
              <div class="row">
                <div class="col-5">
                  
                  <img src="star.png" alt="" height="20px" width="20px">
                  <img src="star.png" alt="" height="20px" width="20px">
                  <img src="star.png" alt="" height="20px" width="20px">
                  
                  
                </div>
                <div class="col">
                  <%=rs5.getInt(1)%>
                </div>
            </div>
            <%
              ResultSet rs6=st.executeQuery("select count(rating) from reviews where rating=2 and restid=" + request.getParameter("id"));
                rs6.next();
              %>
            <div class="row">
              <div class="col-5">
                
                <img src="star.png" alt="" height="20px" width="20px">
                <img src="star.png" alt="" height="20px" width="20px">
                
              </div>
              <div class="col">
                <%=rs6.getInt(1)%>
              </div>
            </div>
          <%
              ResultSet rs7=st.executeQuery("select count(rating) from reviews where rating=1 and restid=" + request.getParameter("id"));
                rs7.next();
              %>
          <div class="row">
            <div class="col-5">
              
              <img src="star.png" alt="" height="20px" width="20px">
            </div>
            <div class="col">
              <%=rs7.getInt(1)%>
            </div>
        </div>
                </div>
                
              </div>
              
            </div>
          
              <hr>
              <p class="text-info fw-bold">Reviews</p>
              
                <%
                    String query = "Select * from reviews where restid=" + request.getParameter("id");
                    ResultSet rs2 = st.executeQuery(query);
                    ResultSetMetaData metadata2 = rs2.getMetaData();
                    int no_of_column2 = metadata2.getColumnCount();
            %>
            <%
                    int revCounter=1;
                    while(rs2.next()){
            %>
            <div class="row mx-1">
                
                <div class="col-1 text-center card py-1 my-1 text-primary fw-bold" style="height:40px; width:40px">
                    
                    <%
                        out.println(revCounter);
                        revCounter++;
                        %>
                </div>
                <div class="col">
                <div class="card p-4 my-1">
                
                <div class="row">
                    <div class="col-2 px-0 text-center">
                        <img src="userReview.png" alt="" height="80px" width="80px">
                    </div>
                    <div class="col-10">
                        <div class="row">
                            <div class="col">
                                <div class="card-title text-dark fw-bold">
                                    <h4><%=rs2.getString(3)%></h4>
                                </div>
                                <hr>
                            </div>
                           
                            <div class="col-3">
                                <img src="contact.png" alt="" width="30px" height="30px">
                                <%=rs2.getString(4)%>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col text-secondary">
                                <%
                                    if(rs2.getString(6)==null){
                                        out.println("Not Available");
                                    }else{
                                        out.println(rs2.getString(6));
                                    }
                                %>
                            </div>
                            <div class="col-3 px-5 text-end">
                        
                                     <div class=" row">
                                        <div class="col"><b><%=rs2.getString(5) %></b>
                                            <img src="star.png" alt="" height="40px" width="40px">
                                        </div>
                                </div>
                            </div>
                        
                        </div>  
                    </div>
                </div>
        </div>
    </div>
</div>                       
                       
            <% } %>
            <div class="text-center my-2">
                <a href="generateReport.jsp" class="btn btn-outline-primary">Back </a>
              <button type="submit" class="btn btn-primary center" onclick="window.print()">Print</button>
            <a href="index.html" class="btn btn-outline-primary">Home</a>
            </div>
            </div>
        </form>
    </div>
</body>
</html>
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