<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*"%>
<%@page import="website.*  "%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Αρχική</title>
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


  <section id="home-section" class="hero">
    <div class="home-slider owl-carousel">
      <div class="slider-item" style="background-image: url(images/bg_3.jpg);">
        <div class="overlay"></div>
        <div class="container">
          <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

            <div class="col-sm-12 ftco-animate text-center">
              <h1 class="mb-2">Οικογένεια Ψύλλα</h1>
              <h2 class="subheading mb-4">Με την παραδοσιακη μας συνταγη, που εχει μεινει αναλλοιωτη στα 30 χρονια
                λειτουργιας μας.</h2>
            </div>

          </div>
        </div>
      </div>
      <div class="slider-item" style="background-image: url(images/bg_2.jpg);">
        <div class="overlay"></div>
        <div class="container">
          <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

            <div class="col-sm-12 ftco-animate text-center">
              <h1 class="mb-2">100% Φρέσκα &amp; Ντόπια υλικά</h1>
              <h2 class="subheading mb-4">Εχουμε δημιουργησει ισχυρες σχεσεις με τους προμηθευτες μας, γιατι γνωριζουμε
                ποσο σημαντικοι ειναι για την ζυμαρικα μας. </h2>
            </div>

          </div>
        </div>
      </div>
      <div class="slider-item" style="background-image: url(images/bg_1.jpg);">
        <div class="overlay"></div>
        <div class="container">
          <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

            <div class="col-md-12 ftco-animate text-center">
              <h1 class="mb-2">Η καθημερίνη σας απόλαυση</h1>
              <h2 class="subheading mb-4">Σε πανω απο 50 καταστηματα σε ολη την Ελλαδα.</h2>
              <p><a href="partners.jsp" class="btn btn-primary">Που θα μας βρείς</a></p>
            </div>

          </div>
        </div>
      </div>
    </div>
  </section>
  <section class="ftco-section">
    <div class="container">
      <div class="row no-gutters ftco-services">
        <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
          <div class="media block-6 services mb-md-0 mb-4">
            <div class="icon bg-color-2 d-flex justify-content-center align-items-center mb-2">
              <span class="flaticon-diet"></span>
            </div>
            <div class="media-body">
              <h3 class="heading">ΠΑΝΤΑ ΜΕ ΦΡΕΣΚΑ ΥΛΙΚΑ</h3>
              <span>Ολες οι πρωτες υλες που χρησιμοποιουμε καλλιεργουνται στον τοπο μας απο ντοπιους.</span>
            </div>
          </div>
        </div>
        <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
          <div class="media block-6 services mb-md-0 mb-4">
            <div class="icon bg-color-3 d-flex justify-content-center align-items-center mb-2">
              <span class="flaticon-award"></span>
            </div>
            <div class="media-body">
              <h3 class="heading">Εξωλοκληρου Χειροποιητα προϊοντα</h3>
              <span>Ολα μας τα προϊοντα ειναι χειροποιητα από την οικογενεια μας για εσας.</span>
            </div>
          </div>
        </div>
        <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
          <div class="media block-6 services mb-md-0 mb-4">
            <div class="icon bg-color-4 d-flex justify-content-center align-items-center mb-2">
              <span class="flaticon-customer-service"></span>
            </div>
            <div class="media-body">
              <h3 class="heading">Μεγαλο Δικτυο Καταστηματων</h3>
              <span>Πανω απο 50 συνεργαζομενα καταστηματα σε ολη την Ελλαδα</span>
            </div>
          </div>
        </div>
        <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
          <div class="media block-6 services mb-md-0 mb-4">
            <div class="icon bg-color-1 active d-flex justify-content-center align-items-center mb-2">
              <span class="flaticon-shipped"></span>
            </div>
            <div class="media-body">
              <h3 class="heading">ΔΩΡΕΑΝ ΑΠΟΣΤΟΛΗ ΣΤΟΝ ΧΩΡΟ ΣΑΣ</h3>
              <span>Για αγορες ανω των 50 €</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <hr>

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