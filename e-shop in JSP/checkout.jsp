<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*"%>
<%@page import="website.*"%>

<%@ page errorPage="errorPage.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Πληρωμή</title>
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
	<div id="navCus"></div>
	<div class="hero-wrap hero-bread" style="background-image: url('images/bg_1.jpg');">
		<div class="container">
			<div class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-0 bread">Στοιχεια πληρωμης</h1>
				</div>
			</div>
		</div>
	</div>
	<% if(session.getAttribute("loggedin") == null ){
			throw new Exception("Πρέπει να συνδεθείτε πρίν ολοκληρώσετε την παραγγελία σας.");
		  } 
		  Customer cus =(Customer)session.getAttribute("loggedin");

		  if (session.getAttribute("cart") == null ){ %>
	<br>
	<div class="container">
		<div role="alert" class="alert alert-danger center"> <a href="shop.jsp?id=all"> Παρακαλώ επιλέξτε κάποια από τα
				προϊόντα μας.</a> </div>
	</div>
	<%
		  } else {
			double sum = 0;
			Product product = null;
			List<Product> productlist = (List)session.getAttribute("cart");
				for (int i = 0; i < productlist.size(); i++) {
					product = productlist.get(i);
					sum += product.getTotalPrice();
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
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-7 ftco-animate">
					<form class="billing-form">
						<h3 class="mb-4 billing-heading">Στοιχεία χρέωσης</h3>
						<div class="row align-items-end">
							<div class="col-md-6">
								<div class="form-group">
									<label for="firstname">Όνομα</label>
									<div class="form-control"><%=cus.getName()%> </div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="lastname">Επίθετο</label>
									<div class="form-control"><%=cus.getSurname()%> </div>
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group">
									<label for="lastname">Χώρα</label>
									<div class="form-control"><%=cus.getCountry()%> </div>
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group">
									<label for="lastname">Διεύθυνση</label>
									<div class="form-control"><%=cus.getAddress()%> </div>
								</div>
							</div>

							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="towncity">Πόλη</label>
									<div class="form-control"><%=cus.getCity()%> </div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="postcodezip">Τ.Κ</label>
									<div class="form-control"><%=cus.getPostal_Code()%> </div>
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="phone">Τηλέφωνο Επικοινωνίας</label>
									<div class="form-control"><%=cus.getTel()%> </div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="emailaddress">Email </label>
									<div class="form-control"><%=cus.getEmail()%> </div>
								</div>
							</div>
						</div>
					</form><!-- END -->


				</div>
				<div class="col-xl-5">
					<div class="row mt-5 pt-3">
						<div class="col-md-12 d-flex mb-5">
							<div class="cart-detail cart-total p-3 p-md-4">
								<h3 class="billing-heading mb-4">Καλάθι</h3>
								<p class="d-flex">
									<span>Ποσό</span>
									<span><%=sum%> €</span>
								</p>
								<p class="d-flex">
									<span>Μεταφορικά</span>
									<span>3.00 €</span>
								</p>
								<hr>
								<p class="d-flex total-price">
									<span>Σύνολο</span>
									<span><%=sum + 3%> €</span>
								</p>
							</div>
						</div>
						<div class="col-md-12">
							<div class="cart-detail p-3 p-md-4">
								<h3 class="billing-heading mb-4">Τρόποι πληρωμής</h3>
								<div class="form-group">
									<div class="col-md-12">
										<div class="radio">
											<label><input type="radio" name="optradio" value="bank" class="mr-2">
												Τραπεζικός λογαριασμός</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-12">
										<div class="radio">
											<label><input type="radio" name="optradio" value="credit" class="mr-2">
												Πιστωτική/Χρεωστική κάρτα</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-12">
										<div class="checkbox">
											<label><input type="checkbox" id="terms" class="mr-2"> Έχω διαβάσει και
												αποδέχομαι τους όρους και τις προϋποθέσεις.</label>
										</div>
									</div>
								</div>
								<p> <a href="Javascript: void(0);" data-user-id="<%=cus.getID()%>"
										data-order-total="<%=sum%>" class="btn btn-primary makeAnOrder">Πληρωμή</a></p>
							</div>
						</div>
					</div>
				</div> <!-- .col-md-8 -->
			</div>
		</div>
	</section> <!-- .section -->
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



</body>

</html>