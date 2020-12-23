<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*"%>
<%@page import="website.*"%>
<%@ page errorPage="errorPage.jsp"%>


<!DOCTYPE html>
<html lang="en">

<head>
  <title>Κλείσε ραντεβού</title>
  <link rel="icon" type="image/jpg" href="images/icon.jpg" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

  <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
    rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">

  <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
  <link rel="stylesheet" href="css/animate.css">

  <link rel="stylesheet" href="css/owl.carousel.min.css">
  <link rel="stylesheet" href="css/owl.theme.default.min.css">
  <link rel="stylesheet" href="css/magnific-popup.css">

  <link rel="stylesheet" href="css/aos.css">

  <link rel="stylesheet" href="css/ionicons.min.css">

  <link rel="stylesheet" href="css/bootstrap-datepicker.css">
  <link rel="stylesheet" href="css/jquery.timepicker.css">


  <link rel="stylesheet" href="css/flaticon.css">
  <link rel="stylesheet" href="css/icomoon.css">
  <link rel="stylesheet" href="css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script>
    $(document).ready(function () {
      $("#nav").load("common/nav.jsp");
      $("#navCus").load("common/navCus.jsp");
      $("#footer").load("common/footer.html");
      $("#section").load("common/section.html");
    });
  </script>

</head>

<body class="goto-here">

  <% 
          if(session.getAttribute("loggedin") == null){
            throw new Exception("You need to log in first");
        }
        request.setCharacterEncoding("UTF-8");
        Customer cus =(Customer)session.getAttribute("loggedin");
        int nID = cus.getID();
        String nDate =  request.getParameter("date");
        String nHour = request.getParameter("hour");
        String nDetails = request.getParameter("details");

        

        AppointmentDAO appointment = new AppointmentDAO();
        appointment.open();
         if( appointment.makeAppointment(nID,nDate,nHour,nDetails) == true) {
            appointment.close(); 
      %>
  <jsp:forward page="cuProfile.jsp" />
  <%
    }
    
    %>


  <div id="footer"></div>




  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
      <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
      <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
        stroke="#F96D00" /></svg></div>


  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="js/main.js"></script>

</body>

</html>