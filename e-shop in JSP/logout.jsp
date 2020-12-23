<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*"%>
<%@page import="website.*  "%>
<%@ page errorPage="errorPage.jsp"%>
<%
if(session.getAttribute("loggedin") == null){
  throw new Exception("You need to log in first");
}
session.invalidate();
%>

<!DOCTYPE html>
<html lang="en">

<head>
  <title>Log in</title>
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

  <!-- automatically will redirect to index.jsp after 2 seconds -->
  <meta http-equiv="refresh" content="2;url=index.jsp" />

  <!-- Icons font CSS-->
  <link rel="stylesheet" href="vendor/mdi-font/css/material-design-iconic-font.min.css" media="all">
  <link rel="stylesheet" href="vendor/font-awesome-4.7/css/font-awesome.min.css" media="all">

  <!-- Vendor CSS-->
  <link rel="stylesheet" href="vendor/select2/select2.min.css" media="all">
  <link rel="stylesheet" href="vendor/datepicker/daterangepicker.css" media="all">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script>
    $(document).ready(function () {
      $("#nav").load("common/nav.jsp");
      $("#footer").load("common/footer.html");
      $("#section").load("common/section.html");
    });
  </script>

</head>

<body>

  <div class="container" role="main">

    <div class="alert alert-success text-center" role="alert">Η έξοδος πραγματοποιηθηκε με επιτυχία</div>

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