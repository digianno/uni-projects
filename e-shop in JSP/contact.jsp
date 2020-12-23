<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*"%>
<%@page import="website.*"%>
<%@ page errorPage="erroPage.jsp"%>


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

  <script>
    $(document).ready(function () {
      var today = new Date();
      var dd = today.getDate();
      var mm = today.getMonth() + 1;
      var yy = today.getFullYear();
      if (dd < 10) {
        dd = '0' + dd;
      }
      if (mm < 10) {
        mm = '0' + mm;
      }
      var rightnow = yy + '-' + mm + '-' + dd;
      $('#date-withminvalue').attr('min', rightnow);
    });
  </script>

</head>

<body class="goto-here">
  <%
    request.setCharacterEncoding("UTF-8");
      if ( session.getAttribute("loggedin") != null ) { %>
  <div id="navCus"></div>
  <%  }  else if (session.getAttribute("loggedin") == null) { %>
  <div id="nav"></div>
  <% }
       %>

  <div class="hero-wrap hero-bread" style="background-image: url('images/bg_4.jpg');">
    <div class="container">
      <div class="row no-gutters slider-text align-items-center justify-content-center">
        <div class="col-md-9 ftco-animate text-center">
          <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Κλεισε</a></span> <span>ραντεβου στο εργαστηριο
              μας και γινε</span></p>
          <h1 class="mb-0 bread">ο δημιουργος των δικων σου ζυμαρικων</h1>
        </div>
      </div>
    </div>
  </div>

  <section class="ftco-section contact-section bg-light">
    <div class="container">
      <div class="row d-flex mb-5 contact-info">
        <div class="w-100"></div>
        <div class="col-md-3 d-flex">
          <div class="info bg-white p-4">
            <p><span>Διεύθυνση:</span> Νικηταρά 88, Μεγαλόπολη, Αρκαδία, Ελλάδα</p>
          </div>
        </div>
        <div class="col-md-3 d-flex">
          <div class="info bg-white p-4">
            <p><span>Τηλέφωνο επικοινωνίας:</span> +30 2791 024032</p>
          </div>
        </div>
        <div class="col-md-3 d-flex">
          <div class="info bg-white p-4">
            <p><span>Email:</span> megaloupoli@zumarika.gr</p>
          </div>
        </div>
        <div class="col-md-3 d-flex">
          <div class="info bg-white p-4">
            <p>Ώρες λειτουργίας: 09:00 - 21:000</p>
          </div>
        </div>
      </div>

      <div class="sidebar-box ftco-animate">
        <h3 class="heading">Πληροφορίες για τα ραντεβού</h3>
        <p>
          Σας παρέχουμε τη δυνατότητα να δημιουργήσετε τα δικά σας ζυμαρικά. Εσείς βάζετε τα υλικά και εμείς το μεράκι
          και όλα τα απαραίτητα εργαλεία για την παρασκευή τους στην άριστη ποιότητα.
          Μπορείτε να κλείσετε ραντεβού καθόλη τη διάρκεια του χρόνου από Δευτέρα έως Παρασκευή από τις 8 το πρωί μέχρι
          και τη 1 το μεσημέρι (8:00-13:00).
          Η αρχική χρέωση για τα ζυμαρικά σας είναι 1.80€ το κιλό συν ΦΠΑ. Στην τιμή αυτή προστίθεται οποιοδήποτε υλικό
          δεν έχετε εσείς διαθέσιμο και προστεθεί από εμάς κατά την παραγωγή (αλεύρι, αυγά, γάλα, αλάτι).
        </p>
      </div>

      <div class="row block-9">
        <div class="col-md-6 order-md-last d-flex">
          <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2469.6295893773504!2d22.131890315335905!3d37.40169797982895!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x1360459becc5023b%3A0xd24950d10dbd836c!2zzqDOsc-BzrHOtM6_z4POuc6xzrrOrCDOls-FzrzOsc-BzrnOus6sIM6czrXOs86xzrvPjM-Azr_Ou863z4IgIs6oz43Ou867zrEi!5e1!3m2!1sel!2sgr!4v1573740093449!5m2!1sel!2sgr"
            width="540" height="754" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
        </div>
        <div class="col-md-6 order-md-last d-flex">
          <% if ( session.getAttribute("loggedin") != null ) { %>
          <form method="POST" action="contactController.jsp" class="bg-white p-5 contact-form">
            <h4>Παρακαλώ συμπληρώστε τα παρακάτω στοιχεία για να κλείσετε ραντεβού.</h4>
            <% if ( session.getAttribute("loggedin") != null ) { 
                        Customer cus =(Customer)session.getAttribute("loggedin"); %>
            <div class="form-group">
              Ονοματεπώνυμο: <% out.println(cus.getName() + " " +  cus.getSurname()); %>
            </div>
            <div class="form-group">
              Email: <% out.println(cus.getEmail()); %>
            </div>
            <%  }  else if (session.getAttribute("loggedin") == null) { %>
            <div class="form-group">
              <input type="text" class="form-control" placeholder="Όνομα" name="name">
            </div>
            <div class="form-group">
              <input type="text" class="form-control" placeholder="Email" name="email">
            </div>
            <% } %>
            <div class="form-group">
              <input type="date" class="form-control" id="date-withminvalue" placeholder="Ημερομηνία Ραντεβού"
                name="date" required>
            </div>
            <div class="form-group">
              <input type="time" class="form-control" placeholder="Ώρα Ραντεβού" name="hour" min="08:00" max="21:00"
                required>
            </div>
            <div class="form-group">
              <textarea name="details" id="" cols="30" rows="7" class="form-control" placeholder="Πληροφορίες"
                minlength="5" maxlength="50" required></textarea>
            </div>
            <div class="form-group">
              <input type="submit" value="Κλείσε ραντεβού" class="btn btn-primary py-3 px-5">
            </div>
          </form>
          <% } else if (session.getAttribute("loggedin") == null) { %>
          <div class="bg-white p-5 contact-formm">
            <h5>Θα πρέπει να είστε συνδεδεμένοι για να μπορέσετε να κλέιστε ραντεβού.</h5>
            <br>
            <form action="login.jsp">
              <input type="submit" value="Έχω λογαριασμό." class="btn btn-primary py-3 px-5">
            </form>
            <br>
            <form action="registration.jsp">
              <input type="submit" value="Δημιουργία λογαρισμού." class="btn btn-primary py-3 px-5">
            </form>

          </div>
          <% } %>

        </div>
      </div>
    </div>
  </section>


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