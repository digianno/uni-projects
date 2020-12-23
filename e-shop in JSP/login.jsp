<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*"%>
<%@page import="website.*  "%>
<%@ page errorPage="errorPage.jsp"%>

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

<body class="goto-here">

  <div id="nav"></div>

  <div class="page-wrapper bg-red p-t-180 p-b-100 font-robo">
    <div class="wrapper wrapper--w960">
      <div class="card card-2">
        <div class="card-heading"></div>
        <div class="card-body">
          <% request.setCharacterEncoding("UTF-8"); 
                            if (request.getAttribute("loginM") != null){ %>
          <div class="alert alert-danger text-center" role="alert"><% out.println(request.getAttribute("loginM"));%>
          </div>
          </p>
          <% } else if (request.getAttribute("errorM") != null) { %>
          <div class="alert alert-danger text-center" role="alert"><% out.println(request.getAttribute("errorM"));%>
          </div>
          </p>
          <% } %>
          <h2 class="title">Είσοδος πελάτη</h2>
          <form method="POST" action="loginController.jsp">

            <div class="row row-space">
              <div class="col-100">
                <div class="input-groupp">
                  <input class="input--style-2" type="text" placeholder="Email" name="email">
                </div>
              </div>
              <div class="col-100">
                <div class="input-groupp">
                  <input class="input--style-2" type="password" placeholder="Password" name="password" id="mypass">
                </div>
              </div>
              <label>
                <input type="checkbox" onclick="myHide()"> Εμφάνιση κωδικού
              </label>
            </div>
            <div class="p-t-30">
              <button class="btn btn--radius btn--green" type="submit">Σύνδεση</button>

              <button> <a href="registration.jsp" class="btn btn--radius btn--green" type="submit">Γίνε
                  μέλος</a></button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>


  <div id="footer"></div>



  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
      <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
      <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
        stroke="#F96D00" /></svg></div>

  <script>
    function myHide() {
      var x = document.getElementById("mypass");
      if (x.type === "password") {
        x.type = "text";
      } else {
        x.type = "password";
      }
    }
  </script>

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
  <script src="common/cart.js"></script>
  <script src="common/calendar.js"></script>
</body>

</html>