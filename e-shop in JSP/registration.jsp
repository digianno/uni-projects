<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*, java.util.List , java.util.ArrayList"%>
<%@page import="website.*"%>


<!DOCTYPE html>
<html lang="en">

<head>
  <title>Δημιουργία λογαριασμού</title>
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
  <% List<String> errorsRe = new ArrayList<String>(); %>


  <a name="register"></a>
  <div class="page-wrapper bg-red p-t-180 p-b-100 font-robo">
    <div class="wrapper wrapper--w960">
      <div class="card-heading"></div>
      <div class="card-body">
        <h2 class="title">Εγγραφή νέου πελάτη </h2>
        <% if (request.getAttribute("already") != null) { %>
        <div class="alert alert-danger text-center" role="alert"><% out.println(request.getAttribute("already"));%>
        </div>
        </p>
        <% } else if (request.getAttribute("RegErrors") != null ) { %>
        <div class="alert alert-danger text-center" role="alert">Παρακαλώ συμπληρώστε σωστά τα στοιχεία σας.</div>
        </p>
        <% 
                        errorsRe = (List<String>) request.getAttribute("RegErrors");
                      }
                      %>
        <form method="POST" action="registerController.jsp">
          <div class="row row-space">
            <div class="col-100">
              <div class="input-groupp">
                <input class="input--style-2" type="text" placeholder="Όνομα" name="name">
              </div>
            </div>
            <div class="col-100">
              <div class="input-groupp">
                <input class="input--style-2" type="text" placeholder="Επώνυμο" name="surname">
              </div>
            </div>
          </div>

          <div class="row row-space">
            <% if ( errorsRe.contains("Το όνομα θα πρέπει να αποτελείται τουλάχιστον απο 3 χαρακτήρες.")) { %>
            <h5 style="color:red;"> Το όνομα πρέπει να είναι τουλάχιστον 3 χαρακτήρες.</h5>
            <% } else { %>
            <div class="col-100"></div>
            <% } %>
            <% if ( errorsRe.contains("Το επίθετο θα πρέπει να αποτελείται τουλάχιστον από 3 χαρακτήρες.")) { %>
            <h5 style="color:red;"> Το επώνυμο θα πρέπει να είναι τουλάχιστον 3 χαρακτήρες.</h5>
            <% } %>
          </div>
          <div class="row row-space">
            <div class="col-100">
              <div class="input-groupp">
                <input class="input--style-2 js-datepicker" type="date" placeholder="Ημερομηνία Γέννησης"
                  name="birthday">
                <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar" onclick="makeDate()"></i>
              </div>
            </div>
            <div class="col-100">
              <div class="select-dropdown">
                <div class="input-groupp">
                  <select name="gender">
                    <option disabled="disabled" selected="selected">Φύλο</option>
                    <option>Male</option>
                    <option>Female</option>
                    <option>Other</option>
                  </select>
                </div>
              </div>
            </div>
          </div>
          <div class="row row-space">
            <% if ( errorsRe.contains("Παρακαλώ συμπληρώστε την Η/Γ σας.")) { %>
            <h5 style="color:red;"> Παρακαλώ συμπληρώστε την ημερομηνία γέννησής σας.</h5>
            <% } else { %>
            <div class="col-100"></div>
            <% } %>
            <% if ( errorsRe.contains("Παρακαλώ συμπληρώστε το φύλο σας.")) { %>
            <h5 style="color:red;"> Παρακαλώ επιλέξτε φύλο.</h5>
            <% } %>
          </div>
          <div class="row row-space">
            <div class="col-100">
              <div class="input-groupp">
                <input class="input--style-2" type="email" placeholder="Email" name="Email">
              </div>
            </div>
            <div class="col-100">
              <div class="input-groupp">
                <input class="input--style-2" type="text" placeholder="Τηλέφωνο" name="Tel">
              </div>
            </div>
          </div>
          <div class="row row-space">
            <% if ( errorsRe.contains("Θα πρέπει να ορίσετε email.")) { %>
            <h5 style="color:red;"> Το email σας θα πρέπει να είναι έγκυρο. </h5>
            <% } else { %>
            <div class="col-100"></div>
            <% } %>
            <% if ( errorsRe.contains("Παρακαλώ συμπληρώστε το κινητό σας.")) { %>
            <h5 style="color:red;"> Παρακαλώ συμπληρώστε το τηλέφωνο σας</h5>
            <% } %>
          </div>
          <div class="row row-space">
            <div class="col-100">
              <div class="input-groupp">
                <input class="input--style-2" type="password" placeholder="Kωδικός" name="password" id="mypass1">
              </div>
            </div>
            <div class="col-100">
              <div class="input-groupp">
                <input class="input--style-2" type="password" placeholder="Επανάληψη κωδικού" name="password2"
                  id="mypass2">
              </div>
            </div>
          </div>
          <div class="row row-space">
            <% if ( errorsRe.contains("Το συνθηματικό θα πρέπει να αποτελείται τουλάχιστον απο 5 χαρακτήρες.")) { %>
            <h5 style="color:red;"> Το συνθηματικό θα πρέπει να αποτελείται από 5 χαρακτήρες. </h5>
            <% } else { %>
            <div class="col-100"></div>
            <% } %>
            <% if ( errorsRe.contains("Τα συνθηματικά δεν συμφωνούν μεταξύ τους.")) { %>
            <h5 style="color:red;"> Θα πρέπει να συμφωνούν οι δύο κωδικοί.</h5>
            <% } %>
          </div>
          <div class="row row-space">
            <label style="display:ruby; margin-top: 0.5rem;">
              <input type="checkbox" onclick="myHide()"> Εμφάνιση Κωδικού
            </label>
          </div>
          <div class="row row-space">
            <div class="col-100">
              <div class="input-groupp">
                <input class="input--style-2" type="text" placeholder="Διεύθυνση" name="Address">
              </div>
            </div>
            <div class="col-100">
              <div class="input-groupp">
                <input class="input--style-2" type="text" placeholder="Τ.Κ" name="z_code">
              </div>
            </div>
          </div>
          <div class="row row-space">
            <% if ( errorsRe.contains("Παρακαλώ συμπληρώστε την διεύθυνσή σας.")) { %>
            <h5 style="color:red;"> Παρακαλώ συμπληρώστε την διεύθυνσή σας. </h5>
            <% } else { %>
            <div class="col-100"></div>
            <% } %>
            <% if ( errorsRe.contains("Παρακαλώ συμπληρώστε τον Τ.Κ σας.")) { %>
            <h5 style="color:red;">Παρακαλώ συμπληρώστε τον Τ.Κ σας.</h5>
            <% } %>
          </div>
          <div class="row row-space">
            <div class="col-100">
              <div class="input-groupp">
                <input class="input--style-2" type="text" placeholder="Πόλη" name="city">
              </div>
            </div>
            <div class="col-100">
              <div class="input-groupp">
                <input class="input--style-2" type="text" placeholder="Χώρα" name="country">
              </div>
            </div>
          </div>
          <div class="row row-space">
            <% if ( errorsRe.contains("Παρακαλώ συμπληρώστε την πόλη σας.")) { %>
            <h5 style="color:red;"> Παρακαλώ συμπληρώστε την Πόλη σας. </h5>
            <% } else { %>
            <div class="col-100"></div>
            <% } %>
            <% if ( errorsRe.contains("Παρακαλώ συμπληρώστε την Χώρα σας.")) { %>
            <h5 style="color:red;"> Παρακαλώ συμπληρώστε την Χώρα σας.</h5>
            <% } %>
          </div>
          <div class="row row-space">
            <div class="form-group">
              <div class="col-100">
                <label style="display:ruby; margin-top: 0.5rem;">
                  <input type="checkbox" name="checkbox" value="off">I aggree to the terms and conditions.
                </label>
              </div>
              <div class="form-group">
                <div class="col-100">
                  <% if ( errorsRe.contains("Παρακαλώ αποδεχθείτε τους όρους.")) { %>
                  <h5 style="color:red;"> Παρακαλώ αποδεχθείτε τους όρους. </h5>
                  <% } %>

                </div>
              </div>
            </div>
          </div>
          <div class="p-t-30">
            <button class="btn btn--radius btn--green" type="submit">Εγγραφή</button>
            <button> <a href='login.jsp' class="btn btn--radius btn--green" type="submit">Έχω λογαριασμό</a></button>
          </div>
        </form>
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
      var x = document.getElementById("mypass1");
      var y = document.getElementById("mypass2");
      if (x.type === "password" || y.type === "password") {

        x.type = "text";
        y.type = "text";
      } else {
        x.type = "password";
        y.type = "password";
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