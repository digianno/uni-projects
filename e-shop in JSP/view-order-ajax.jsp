<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*"%>
<%@page import="website.*"%>

<%@ page errorPage="errorPage.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Η παραγγελία σας</title>
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
	if(session.getAttribute("loggedin") == null){
        throw new Exception("You need to log in first");
    } 
    int orderCode = Integer.parseInt(request.getParameter("orderCode"));
    OrderDAO ord = new OrderDAO();
    List<ArrayList<Integer>> orderitems = ord.getOrderItems(orderCode);
	%>
  <div id="navCus"></div>
  <div class="hero-wrap hero-bread" style="background-image: url('images/bg_6.jpg');">
    <div class="container">
      <div class="row no-gutters slider-text align-items-center justify-content-center">
        <div class="col-md-9 ftco-animate text-center">
          <h1 class="mb-0 bread">Ευχαριστουμε που μας επιλεξατε.</h1>
        </div>
      </div>
    </div>
  </div>

  <%

ProductDAO temp = new ProductDAO();
temp.open();
List<Product> productlist = temp.getAllProducts();
List<Product> products = new ArrayList<Product>();
%>
  <section class="ftco-section ftco-cart">
    <div class="container">
      <div class="row">
        <div class="col-md-12 ftco-animate">
          <%
                            for( int i = 0; i < orderitems.size();i++) {
                                for(int j = 0; j < productlist.size();j++) {
                                    if (orderitems.get(i).get(0) == Integer.parseInt(productlist.get(j).getCode())) {
                                        products.add(new Product(productlist.get(j).getCode(),productlist.get(j).getCategory(),productlist.get(j).getName(),productlist.get(j).getPrice(),productlist.get(j).getImage(),orderitems.get(i).get(1)));
                                    }
                                }
                            }
        temp.close();
		%>

          <div class="cart-list">
            <table class="table">
              <thead class="thead-primary">
                <tr class="text-center">
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th>Τιμή</th>
                  <th>Ποσότητα</th>
                  <th>Σύνολο</th>
                </tr>
              </thead>

              <%
                            double sum = 0;
								for (int i = 0; i < products.size(); i++) {
									Product product = products.get(i);
									sum = sum + product.getPrice()*product.getQuantity();
							%>
              <tbody class="cart-items">
                <tr class="cart-row">

                  <td class="image-prod">
                    <div class="img" style="background-image:url(<%=product.getImage()%>);"></div>
                  </td>

                  <td class="product-name">
                    <h3><%=product.getName()%></h3>
                    <p><%=product.getName()%> με 100% αγνά και ντόπια υλικά.</p>
                  </td>
                  <td class="price"><%=product.getPrice()%> &euro; </td>
                  <td class="row-quantity"> <%=product.getQuantity()%></td>
                  <td class="price"><% out.println(product.getPrice()*product.getQuantity());%> &euro; </td>
                </tr><!-- END TR-->

              </tbody>

              <%  } %>
            </table>

          </div>
        </div>
      </div>
      <div class="row justify-content-end">
        <div class="col-lg-4 mt-5 cart-wrap ftco-animate">
          <div class="cart-total mb-3">
            <h3>Συνολικό ποσό</h3>
            <p class="d-flex">
              <span>Προϊοντα</span>
              <span><%=sum%> € </span>
            </p>
            <p class="d-flex">
              <span>Μεταφορικά</span>
              <span>3.00 € </span>
            </p>
            <p class="d-flex total-price">
              <span>Συνολο</span>
              <span id="total-sum2"><%=sum+3%> &euro; </span>
            </p>
          </div>
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