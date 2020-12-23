<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*"%>
<%@page import="website.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <title>Προφίλ Πελάτη</title>
  <link rel="icon" type="image/jpg" href="./images/icon.jpg" />
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

<body class="goto-here">

  <div id="navCus"></div>

  <% if(session.getAttribute("loggedin") == null){
      throw new Exception("You need to log in first");
    }
    Customer cus =(Customer)session.getAttribute("loggedin");
    %>

  <div class="hero-wrap hero-bread" style="background-image: url('images/bg_2.jpg');">
    <div class="container">
      <div class="row no-gutters slider-text align-items-center justify-content-center">
        <div class="col-md-9 ftco-animate text-center">

          <h1 class="mb-0 bread">Το προφίλ σας</h1>
        </div>
      </div>
    </div>
  </div>

  <hr>
  <section class="ftco-section ftco-no-pb ftco-no-pt bg-light">
    <div class="container">
      <div class="row">
        <div class="col-md-5 p-md-5 img img-2 d-flex justify-content-center align-items-center">
          <a href="#">
            <img class="media-object" src="images/profile.png">
          </a>
        </div>
        <div class="col-md-7 py-5 wrap-about pb-md-5 ftco-animate">
          <div class="heading-section-bold mb-4 mt-md-5">
            <div class="ml-md-0">
              <h2 class="mb-4">Welcome, <% out.println(cus.getName()) ;%> </h2>
            </div>
          </div>
          <div class="pb-md-5">
            <h4>Ονοματεπώνυμο: <% out.println(cus.getName()) ;%> <span><%out.println(cus.getSurname()) ;%></span></h4>
            <h5>Email: <% out.println(cus.getEmail()) ;%></h5>
            <h5>Φύλο: <% out.println(cus.getGender()) ;%></h5>
            <h5>Τηλέφωνο: <% out.println(cus.getTel()) ;%></h5>
            <h5>Ημερομηνία Γέννησης: <% out.println(cus.getBirthday()) ;%> </h5>
            <h5>Διέυθυνση: <% out.println(cus.getAddress()) ;%><span>, <% out.println(cus.getPostal_Code()) ;%></span>
            </h5>
            <h5>Περιοχή: <% out.println(cus.getCity()) ;%>, <span><% out.println(cus.getCountry()) ;%></span></h5>

          </div>
        </div>
        <div class="col-md-7 py-5 wrap-about pb-md-5 ftco-animate">
          <div class="heading-section-bold mb-4 mt-md-5">
            <div class="ml-md-0">
              <h2 class="mb-4">Τα προσεχή ραντεβού σου</h2>
            </div>
          </div>
          <% 
                  if(session.getAttribute("loggedin") != null) {
                      int nID = cus.getID(); 
                      AppointmentDAO appo = new AppointmentDAO();

                      appo.open();
                      List<Appointment> appointments = appo.cusAppointments(nID);
                      if (appointments.isEmpty()) {
                %>
          <div class="bg-white p-5 contact-formm">
            <h5>Φαίνεται πως δεν έχετε κάποιο ραντεβού καταχωρυμένο.</h5>
            <br>
            <form action="contact.jsp">
              <input type="submit" value="Δημιουργήστε ένα ραντεβού." class="btn btn-primary py-3 px-5">
            </form>
            <br>
          </div>
          <%
                  appo.close();  
                } else { %>
          <div class="bg-white p-5 contact-formm">

            <% 
                        request.setCharacterEncoding("UTF-8");
                        int count = 1;
                        for (Appointment point: appointments){
                          if (count >1 ){  %>
            <h2> -----------------------</h2>
            <% } %>
            <h2> <% out.println(count); %> </h2>
            Περιγραφή: <h5> <% out.println(point.getDescription()); %> </h5>
            Ημερομηνία: <h5> <% out.println(point.getDate()); %> </h5>
            Ώρα: <h5><% out.println(point.getTime()); %> </h5>
            <td><a href="delete-ajax.jsp?cus_id=<%=point.getCus_id()%>&appo_id=<%=point.getAppo_id()%>"><button
                  type="button" class="btn btn-primary py-3 px-5">Ακύρωση</button></a></td>
            <%    
                        count++;
                        }
                        %>
            <br>
          </div>
          <% 
              appo.close();  
              }
            }
              %>
          <div class="heading-section-bold mb-4 mt-md-5">
            <div class="ml-md-0">
              <h2 class="mb-4">Οι παραγγελίες σου</h2>
            </div>
          </div>
          <% 
                  if(session.getAttribute("loggedin") != null) {
                      int nID = cus.getID(); 
                      OrderDAO temp = new OrderDAO();

                     
                      List<Order> orders = temp.getOrders(nID,"close");
                      if (orders.isEmpty()) {
                %>
          <div class="bg-white p-5 contact-formm">
            <h5>Φαίνεται πως δεν έχετε πραγματοποιήσει κάποια παραγγελία.</h5>
            <br>
            <form action="http://ism.dmst.aueb.gr/ismgroup10/E-shop/shop.jsp?id=all">
              <input type="submit" value="Δείτε τα πpoϊόντα μας." class="btn btn-primary py-3 px-5">
            </form>
            <br>
          </div>
          <%
                } else { %>
          <div class="bg-white p-5 contact-formm">

            <% 
                        request.setCharacterEncoding("UTF-8");
                        int count = 1;
                        for (Order ordr: orders){
                          if (count >1 ){  %>
            <h2> -----------------------</h2>
            <% } %>
            <h2> <% out.println(count); %> </h2>
            Σύνολο: <h5> <% out.println(ordr.getSum() + "€"); %> </h5>
            Ημερομηνία: <h5> <% out.println(ordr.getDate()); %> </h5>
            Μέθοδος Πληρωμής: <h5>
              <% if(ordr.getMethod().equals("bank") ){ out.println("Μέσω τραπέζης"); }else{ out.println("Με πιστωτική/χρεωστική κάρτα."); } %>
            </h5>
            <td><a href="view-order-ajax.jsp?orderCode=<%=ordr.getOrder_id()%>"><button type="button"
                  class="btn btn-primary ">Προβολή παραγγελίας</button></a></td>
            <%    
                        count++;
                        }
                        %>
            <br>
          </div>
          <% 
              }
            }
              %>

        </div>
      </div>
    </div>
    </div>
  </section>
  <hr>

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
              <span>Όλες οι πρώτες ύλες που χρησιμοποιούμε καλλιεργούνται στον τόπο μας από ντόπιους.</span>
            </div>
          </div>
        </div>
        <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
          <div class="media block-6 services mb-md-0 mb-4">
            <div class="icon bg-color-3 d-flex justify-content-center align-items-center mb-2">
              <span class="flaticon-award"></span>
            </div>
            <div class="media-body">
              <h3 class="heading">Εξωλοκλήρου Χειροποίητα προϊοντα</h3>
              <span>Όλα μας τα πpoϊοντα είναι χειροποίητα από την οικογένεια μας για εσάς.</span>
            </div>
          </div>
        </div>
        <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
          <div class="media block-6 services mb-md-0 mb-4">
            <div class="icon bg-color-4 d-flex justify-content-center align-items-center mb-2">
              <span class="flaticon-customer-service"></span>
            </div>
            <div class="media-body">
              <h3 class="heading">Μεγάλο Δίκτυο Καταστημάτων</h3>
              <span>Πάνω από 50 συνεργαζόμενα καταστήματα σε όλη την Ελλάδα</span>
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
              <span>Για αγορές άνω τον 50 €</span>
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