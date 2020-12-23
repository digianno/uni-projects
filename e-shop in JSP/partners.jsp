<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*"%>
<%@page import="website.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Που θα μας βρείς</title>
  <link rel="icon" type="image/jpg" href="images/icon.jpg" />
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
	if ( session.getAttribute("loggedin") != null ) { %>
  <div id="navCus"></div>
  <%  }  else if (session.getAttribute("loggedin") == null) { %>
  <div id="nav"></div>
  <% }
	 %>


  <div class="hero-wrap hero-bread" style="background-image: url('images/bg_1.jpg');">
    <div class="container">
      <div class="row no-gutters slider-text align-items-center justify-content-center">
        <div class="col-md-9 ftco-animate text-center">
          <p class="breadcrumbs"><span class="mr-2"><a href="index.html">οι</a></span> </p>
          <h1 class="mb-0 bread">Συνεργατες μας</h1>
        </div>
      </div>
    </div>
  </div>
  <section class="ftco-section ftco-degree-bg">
    <div class="container">
      <div>
        <iframe src="https://www.google.com/maps/d/embed?mid=14VHlnhF6ZAqkJJEIJJ_akX9YbeTuRXKS" width="100%"
          height="480"></iframe> </div>
      <div class="row">
        <div class="col-lg-8 ftco-animate">
          <div class="row">
            <% 
					PartnersDAO pda = new PartnersDAO();
					List<Partners> parts = new ArrayList<Partners>();
					parts= pda.getAllPartners();
					for(Partners part: parts) { %>
            <div class="col-md-12 d-flex ftco-animate">
              <div class="blog-entry align-self-stretch d-md-flex">
                <div class="mapouter">
                  <div class="gmap_canvas"><iframe width="275" height="250" id="gmap_canvas" src="<%=part.getURL()%>"
                      frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe><a
                      href="https://usave.co.uk">usave</a></div>
                  <style>
                    .mapouter {
                      position: relative;
                      text-align: right;
                      height: 250px;
                      width: 275px;
                    }

                    .gmap_canvas {
                      overflow: hidden;
                      background: none !important;
                      height: 250px;
                      width: 275px;
                    }
                  </style>
                </div> </a>
                <div class="text d-block pl-md-4">
                  <h3 class="heading" style="color:#7d3a1e"><%=part.getName()%></h3>
                  <h5><span style="color:#7d3a1e;font-weight:bold">Περιοχή: </span><%=part.getCity()%> </h5>
                  <h5><span style="color:#7d3a1e;font-weight:bold">Τηλέφωνο: </span><%=part.getTel()%> </h5>
                  <h5><span style="color:#7d3a1e;font-weight:bold">Είδος: </span><%=part.getKind()%> </h5>


                </div>
              </div>
            </div>
            <% } %>
          </div>
        </div> <!-- .col-md-8 -->
      </div>
    </div>
  </section> <!-- .section -->

  <div id="section"></div>

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
  <script
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>

</body>

</html>