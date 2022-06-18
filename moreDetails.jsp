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
    <body class="d-flex flex-shrink-1 flex-grow-1 bd-highlight">
      <div class="container-xl shadow p-3 m-10 my-2 rounded bd-highlight">
        <div class=" text-center">
          
            <h1 class="text-primary"><%=rs.getString(2)%></h1>
            <p class="text-secondary"><%=rs.getString(6)+", "+rs.getString(5)%></p>
            <hr>
          </div>
          <form action="allRestaurant.jsp"  >
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
                <div class="col-1 text-end">
                    <img src="contact.png" alt="" width="30px" height="30px">

                </div>
                <div class="col-3 ">
                  <p><%=rs.getString(10)%></p>
                </div>
                <div class="col-1 text-end ">
                    <img src="remail.png" alt="" width="25px" height="25px">

                </div>
                  <div class="col-2 ">
                    <p><%=rs.getString(11)%></p>
                  </div>
                  <div class="col-1 text-end">
                    <img src="web.png" alt="" width="25px" height="25px">
                </div>
                  <div class="col-2  ">
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
                  <div class="col-4"></div>
                <div class="col-2 p-1">
                    <div class="card shadow-sm text-center bg-info text-white">
                        <label for="name" class="fw-bold form-label">Rating</label>
                        <%
                        if(rs.getInt(15)>0){
                        float formattedRating=rs.getInt(15)/rs.getFloat(16);
                        java.util.Formatter formatter = new java.util.Formatter();
                        %>
                        <b style="font-size: 30px;"><%=formatter.format("%.1f", formattedRating)%></b>
                        <%
                      }else{
                        %>
                        <b style="font-size: 30px;">No Rating</b>
                        <%
                      }
                      %>
                    </div>
                </div>
                <div class="col-2 p-1">
                    <div class="card text-center bg-info text-white">
                        <label for="name" class="fw-bold form-label">No. Of Visitors</label>
                        <b style="font-size: 30px;"><%=rs.getInt(16)%></b>
                    </div>
                </div>
              </div>
              <hr>
            <div class="text-center">
                <a href="allRestaurant.jsp" class="btn btn-primary">Back </a>
              <button type="submit" class="btn btn-outline-primary center" onclick="window.print()">Print</button>
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