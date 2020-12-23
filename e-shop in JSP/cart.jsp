<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*"%>
<%@page import="website.*"%>

<%@ page errorPage="errorPage.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Το καλάθι σας</title>
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
					<h1 class="mb-0 bread">Το καλάθι σου</h1>
				</div>
			</div>
		</div>
	</div>

	<%


List<Product> productlist = (List)session.getAttribute("cart");

int cartproducts = 0;

if(session.getAttribute("cartitems") != null) {
	cartproducts = (Integer)session.getAttribute("cartitems");
}

%>
	<div class="modal fade" tabindex="-1" role="dialog" id="msgmodal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title text-center" id="gridSystemModalLabel">Καλάθι αγορών</h4>
				</div>
				<div class="modal-body">
					<div class="text-center alert alert-warning">
						<span id="screenmsg"></span>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">ΟΚ</button>
				</div>
			</div>
		</div>
	</div> <!-- /msgmodal -->
	<section class="ftco-section ftco-cart">
		<div class="container">
			<div class="row">
				<div class="col-md-12 ftco-animate">

					<%
							if(productlist != null) {
								request.setCharacterEncoding("UTF-8"); 
								Product product = null;
								double sum = 0;
		%>
					<div class="cart-list">
						<table class="table">
							<thead class="thead-primary">
								<tr class="text-center">
									<th>&nbsp;</th>
									<th>&nbsp;</th>
									<th>Όνομα Προίόντος</th>
									<th>Τιμή</th>
									<th>Ποσότητα</th>
									<th>Σύνολο</th>
								</tr>
							</thead>

							<%
								for (int i = 0; i < productlist.size(); i++) {
									product = productlist.get(i);
									sum += product.getTotalPrice();
									
							%>
							<tbody class="cart-items" id="<%=product.getCode()%>">
								<tr class="cart-row">
									<td class="product-remove"> <a href="javascript:void(0)"
											data-quantity-field="<%=product.getCode()%>" data-sum-field="<%=sum%>"
											data-total-field="<%=product.getTotalPrice()%>"
											class="btn btn-primary ion-ios-close removeProduct"></a> </td>

									<td class="image-prod">
										<div class="img" style="background-image:url(<%=product.getImage()%>);"></div>
									</td>

									<td class="product-name">
										<h3><%=product.getName()%></h3>
										<p><%=product.getName()%> με 100% αγνά και ντόπια υλικά.</p>
									</td>

									<td class="price"><%=product.getPrice()%> &euro; </td>

									<td class="row-quantity"> <%=product.getQuantity()%></td>
									<td class="price"><%=product.getTotalPrice()%> &euro; </td>
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
							<span class="cart-total-price">Σύνολο</span>
							<span class="cart-total-price" id="total-sum"> <%=sum%> &euro;</span>
						</p>
						<p class="d-flex">
							<span>Μεταφορικά</span>
							<span>3.00 € </span>
						</p>
						<hr>
						<p class="d-flex total-price">
							<span>Συνολο</span>
							<span id="total-sum2"><%=sum+3%> &euro; </span>
						</p>
					</div>
					<p><a href="checkout.jsp" class="btn btn-primary py-3 px-4">Ολοκλήρωσε την παραγγελία σου</a></p>
				</div>
			</div>
		</div>
	</section>
	<%  } else {
			%>
	<div role="alert" class="alert alert-danger">Το καλάθι σας είναι άδειο</div>
	<%	}
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