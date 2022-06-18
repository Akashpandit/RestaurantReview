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
    <body >
      <div class="container-xl shadow p-3 m-10 my-2 rounded bd-highlight">
        <div class=" text-center text-primary">
          
            <h1>Rate <%=rs.getString(2)%></h1> 
          </div>
          <form action="ratingUpdate.jsp">
            <div class=" card my-5 p-4 bd-highlight">
                <input type="text" name="restid" value="<%=rs.getString(1)%>" hidden>
              <div class="row mb-3 mt-3">
                <div class="col-2">
                  <label for="rname" class="fw-bold form-label">Restaurant Name: </label>
                </div>
                <div class="col-3">
                  <input type="text" class="form-control" id="id"name="id" value="<%=rs.getString(2)%>" readonly>
                  <div class="invalid-feedback">Please fill out this field.</div>
                </div>
                <div class="col-1"></div>
                <div class="col-1">
                  <label for="name" class="fw-bold text-center form-label">Type:</label>
                </div>
                <div class="col-4 ">
                  <input type="text" class="form-control" id="name" name="rtype" value="<%=rs.getString(3)%>" readonly>
                  <div class="invalid-feedback">Please fill out this field.</div>
                </div>
                <div class="col-1"></div>
              </div>

              <hr>
              <label for="uname" class="fw-bold  form-label">Fill out the following details: </label>
              <div class="row mb-3 mt-3">
                <div class="col-1">
                  <label for="uname" class="fw-bold form-label">Name: </label>
                </div><div class="col-4">
                    <input type="text" class="form-control" id="uname" placeholder="Enter Your Name" name="uname" required>
                    <div class="invalid-feedback">Please fill out this field.</div>
                  </div>
                  <div class="col-1"></div>
                <div class="col-1">
                  <label for="email" class="fw-bold text-center form-label">Phone:</label>
                </div>
                <div class="col-4">
                  <input type="text"  class="form-control" id="phone" placeholder="Enter Your Phone Number" name="uphone" minlength="10" maxlength="10" required>
                  <div class="invalid-feedback">Please fill out this field.</div>
                </div>          
                
                <div class="col-1"></div>
              </div>
              <div class="row">
                  <div class="col-1">
                    <label for="rating" class="fw-bold form-label">Your Rating:</label>
                  </div>
                  <div class="col-3" >
                    <div class="rate" >
                      <div class="invalid-feedback">Please fill out this field.</div>
                        <input type="radio" id="star5" name="rate" value="5" />
                        <label for="star5" title="Highly Satisfied">5 stars</label>
                        <input type="radio" id="star4" name="rate" value="4" />
                        <label for="star4" title="Satisfied">4 stars</label>
                        <input type="radio" id="star3" name="rate" value="3" />
                        <label for="star3" title="Good">3 stars</label>
                        <input type="radio" id="star2" name="rate" value="2"/>
                        <label for="star2" title="Dissatisfied">2 stars</label>
                        <input type="radio" id="star1" name="rate" value="1"  required/>
                        
                        <label for="star1" title="Highly Dissatified">1 star</label>
                    </div>
                    
                  </div>
              </div>
              <div>
                <label for="rating" class="fw-bold form-label">Feedback:</label>
                <textarea name="feedback" id="" class="form-control" rows="3" placeholder="How was your experience being here?"></textarea>
              </div>
            

            <div class="text-center my-3">
              <button type="submit" class="btn btn-primary center">Submit</button>
              <a href="allRestaurant.jsp" class="btn btn-outline-danger">Cancel</a>
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