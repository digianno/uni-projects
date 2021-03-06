<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*, java.util.List , java.util.ArrayList"%>
<%@page import="website.*"%>


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

  <% 
        request.setCharacterEncoding("UTF-8");
        String nName = request.getParameter("name");
        String nSurname = request.getParameter("surname");
        String nBirthday = request.getParameter("birthday");
        String nGender = request.getParameter("gender");
        String nEmail = request.getParameter("Email");
        String nTel = request.getParameter("Tel");
        String nPswd = request.getParameter("password");
        String Cnfrm = request.getParameter("password2");
        String nAddress = request.getParameter("Address");
        String nPost = request.getParameter("z_code");
        String nCountry = request.getParameter("country");
        String nCity = request.getParameter("city");
        String checkbox=request.getParameter("checkbox");


       
			if (nName.length() >= 3 && nSurname.length() >= 3 && !nGender.equals("Φύλο") && !nBirthday.equals("") && !nEmail.equals("") && nPswd.length() >= 5 && Cnfrm.equals(nPswd) && !checkbox.equals("") && !nCity.equals("") && !nAddress.equals("") && !nCountry.equals("") && !nTel.equals("") && !nPost.equals(""))
			 {
               			 CustomerDAO control = new CustomerDAO();
                		control.open();
               			 if(control.isCustomerRegistered(nEmail) == false) {
                        control.setCustomer(nName,nSurname,nBirthday,nGender, nEmail, nTel, nPswd, nAddress, nPost, nCountry, nCity);
                        Customer usr = control.authenticate(nEmail, nPswd);
                        session.setAttribute("loggedin", usr );
                        control.close();
                        %>
  <jsp:forward page="cuProfile.jsp" />
  <% } else if (control.isCustomerRegistered(nEmail) == true) {
                          request.setAttribute("already","Υπάρχει ήδη  λογαρισμός με το συγκεκριμένο email!");
                          control.close();
                       } %>
  <jsp:forward page="registration.jsp" />

  <%
  	} else {
          List<String> errors = new ArrayList<String>();
          if ( 3 > nName.length()){
            errors.add("Το όνομα θα πρέπει να αποτελείται τουλάχιστον απο 3 χαρακτήρες.");
          }
          if(nSurname.length() < 3 ) {
            errors.add("Το επίθετο θα πρέπει να αποτελείται τουλάχιστον από 3 χαρακτήρες.");
          }
          if (nEmail.equals("")){
            errors.add("Θα πρέπει να ορίσετε email.");
          }
          if (nPswd.length() < 5){
            errors.add("Το συνθηματικό θα πρέπει να αποτελείται τουλάχιστον απο 5 χαρακτήρες.");
          }
          if (!Cnfrm.equals(nPswd)){
            errors.add("Τα συνθηματικά δεν συμφωνούν μεταξύ τους.");
          }
          if (checkbox == null){
            errors.add("Παρακαλώ αποδεχθείτε τους όρους.");
          }
          if (nCity.equals("")){
            errors.add("Παρακαλώ συμπληρώστε την πόλη σας.");
          }
          if (nAddress.equals("")){
            errors.add("Παρακαλώ συμπληρώστε την διεύθυνσή σας.");
          }
          if (nCountry.equals("")){
            errors.add("Παρακαλώ συμπληρώστε την Χώρα σας.");
          }
          if (nTel.equals("")){
            errors.add("Παρακαλώ συμπληρώστε το κινητό σας.");
          }
          if (nPost.equals("")){
            errors.add("Παρακαλώ συμπληρώστε τον Τ.Κ σας.");
          }
          if (nBirthday.equals("")){
            errors.add("Παρακαλώ συμπληρώστε την Η/Γ σας.");
          }
          if (nGender == null){
            errors.add("Παρακαλώ συμπληρώστε το φύλο σας.");
          }
          request.setAttribute("RegErrors",errors);
          %>
  <jsp:forward page="registration.jsp" />
  <%
    }
		%>





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
      var z = document.getElementById("mypass3");
      if (x.type === "password" || y.type === "password" || z.type === "password") {
        x.type = "text";
        y.type = "text";
        z.type = "text";
      } else {
        x.type = "password";
        y.type = "password";
        z.type = "password";
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