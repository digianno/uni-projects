<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>

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
      $("#navCus").load("common/navCus.jsp");
      $("#footer").load("common/footer.html");
      $("#section").load("common/section.html");
    });
  </script>
</head>

<body>
  <% if(exception != null) { 
         if (exception.getMessage() == "Wrong username or password"){
          request.setAttribute("loginM", "Το email ή ο κωδικός δεν είναι σωστά!");
          %>
  <jsp:forward page="login.jsp" />
  <%
          } else if ( exception.getMessage() == "You need to log in first" ) {
            request.setAttribute("errorM","Θα πρέπει να συνδεθείτε πρώτα!"); %>
  <jsp:forward page="login.jsp" />
  <%
          } else if ( exception.getMessage() == "Πρέπει να συνδεθείτε πρίν ολοκληρώσετε την παραγγελία σας." ) {
            request.setAttribute("errorM", "Πρέπει να συνδεθείτε στον λογαριασμό σας πρωτού ολοκληρώσετε την παραγγελία σας."); %>
  <jsp:forward page="login.jsp" />
  <%
          } else if ( exception.getMessage() == "An error occured while setting customer in database:" ) {
            request.setAttribute("registerError", "An error occured while setting customer in database!"); %>
  <jsp:forward page="registration.jsp" />
  <% 
	  }  else if ( exception.getMessage() == "Wrong product!" ) {
            request.setAttribute("Wrong Product!", "Το προϊόν που ζητήσατε δεν υπάρχει!"); %>
  <jsp:forward page="shop.jsp?id=all" />
  <% 
	}
  %>



  <!-- Page Title -->
  <div class="page-header">
    <h1>Σφάλμα</h1>
  </div>

  <div class="alert alert-danger" role="alert">
    <p>
      <b>Message: </b> <%= exception.getMessage() %>
    </p>
    <p>
      <b>Class: </b> <%= exception.getClass() %>
    </p>
  </div>

  <% } %>

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

  <script>
    $(document).ready(function () {

      var quantitiy = 0;
      $('.quantity-right-plus').click(function (e) {

        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        var quantity = parseInt($('#quantity').val());

        // If is not undefined

        $('#quantity').val(quantity + 1);


        // Increment

      });

      $('.quantity-left-minus').click(function (e) {
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        var quantity = parseInt($('#quantity').val());

        // If is not undefined

        // Increment
        if (quantity > 0) {
          $('#quantity').val(quantity - 1);
        }
      });

    });
  </script>

</body>

</html>