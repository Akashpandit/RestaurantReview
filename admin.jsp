<%@ page import="java.sql.*" %>
<%
    try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
    }
    catch(ClassNotFoundException cnf){
        out.println(cnf);
    }
    try{
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe" , "system" , "root");
        Statement st   = con.createStatement();
        String create_table     = "Create table restaurant (RestId number(9) Primary Key, name varchar2(20) not null, type varchar2(20), resDesc varchar2(500), city varchar2(15), area varchar2(40), compAdd varchar2(70),oTime varchar2(9), cTime varchar2(9), rPhone char(13), rEmail varchar2(30), rWeb varchar2(30), popDish varchar2(100),spFeature varchar2(100),rating number(5),noOfRating number)";
        String create_sq        = "CREATE SEQUENCE restIdSeq START WITH 1001 INCREMENT by 1 MINVALUE 1000 MAXVALUE 9999 CYCLE";
        st.execute(create_table);
        st.execute(create_sq);

        String create_table2     = "Create table reviews (revId number(9) primary key,restId number(9),name varchar2(20),phone varchar2(13), rating number(1),feedback varchar2(200))";
        String create_sq2        = "CREATE SEQUENCE reviewIdSeq START WITH 1001 INCREMENT by 1 MINVALUE 1000 MAXVALUE 9999 CYCLE";
        st.execute(create_table2);
        st.execute(create_sq2);


        out.print("<h3 style='color:green'>Table Created Successfully</h3>");
        con.close();
    }
    catch(SQLException e){
        out.print("<h3 style='color:red'>Error: " + e + "</h3>");
    }
%>