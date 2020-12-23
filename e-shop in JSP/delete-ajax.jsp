<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>

<%@ page errorPage="errorPage.jsp"%>
<%
 if(session.getAttribute("loggedin") == null){
     throw new Exception("You need to log in first");
  }
int cus_id = Integer.parseInt(request.getParameter("cus_id"));
int appo_id = Integer.parseInt(request.getParameter("appo_id"));
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://195.251.249.131:3306/ismgroup10?useUnicode=yes&characterEncoding=UTF-8", "ismgroup10", "o3db0w");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM appointment WHERE cus_id="+cus_id+ " and appo_id="+ appo_id);
int j = st.executeUpdate(" alter table appointment auto_increment = 1");
 %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Διαγραφή ραντεβού</title>
  <link rel="icon" type="image/jpg" href="images/icon.jpg" />
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
    rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i"
    rel="stylesheet">


  <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
  <link rel="stylesheet" href="css/animate.css">


  <link rel="stylesheet" href="css/aos.css">

  <link rel="stylesheet" href="css/ionicons.min.css">

  <link rel="stylesheet" href="css/jquery.timepicker.css">


  <link rel="stylesheet" href="css/flaticon.css">
  <link rel="stylesheet" href="css/icomoon.css">
  <link rel="stylesheet" href="css/style.css">

  <link rel="stylesheet" href="css/main.css" media="all">

  <!-- automatically will redirect to cuProfile.jsp after 5 seconds -->
  <meta http-equiv="refresh" content="5;url=cuProfile.jsp" />

  <!-- Icons font CSS-->
  <link rel="stylesheet" href="vendor/mdi-font/css/material-design-iconic-font.min.css" media="all">
  <link rel="stylesheet" href="vendor/font-awesome-4.7/css/font-awesome.min.css" media="all">

  <!-- Vendor CSS-->
  <link rel="stylesheet" href="vendor/select2/select2.min.css" media="all">
  <link rel="stylesheet" href="vendor/datepicker/daterangepicker.css" media="all">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script>
    $(document).ready(function () {
      $("#navCus").load("common/navCus.jsp");
      $("#footer").load("common/footer.html");
      $("#section").load("common/section.html");
    });
  </script>

</head>

<body>
  <div id="navCus"></div>
  <div class="container" role="main">
    <br>
    <br>
    <div class="alert alert-success text-center" role="alert">Λυπούμαστε που τελικά δεν θα μπορέσετε να μας
      επισκεφθείτε. Σε μερικά δευτερόλεπτα θα επιστρέψετε αυτόματα στο προφίλ σας. </div>

  </div>
  <!-- /container -->

  <div id="footer"></div>


  <!-- Bootstrap core JavaScript
	================================================== -->
  <!-- Placed at the end of the document so the pages load faster -->
  <script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
  <script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>

</body>

</html>


<%

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>