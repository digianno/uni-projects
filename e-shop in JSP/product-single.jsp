<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*"%>
<%@page import="website.*"%>
<%@ page errorPage="errorPage.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<title>Περιγραφή</title>
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
	ProductDAO pdao = new ProductDAO();
	pdao.open();
	List<Product> productlist = pdao.getAllProducts();
	pdao.close();
	  
	if ( session.getAttribute("loggedin") != null ) { %>
	<div id="navCus"></div>
	<%  }  else if (session.getAttribute("loggedin") == null) { %>
	<div id="nav"></div>
	<% }
	String id = request.getParameter("prd");
	int length = Integer.parseInt(id);
	if ( length > productlist.size() ){
		throw new Exception("Wrong product!");
	}

	for(Product pro: productlist){
		if (id.equals(pro.getCode())){
			Product pdt = pro;
			request.setAttribute("product",pdt);
			break;
		}
	}
	Product productt = (Product)request.getAttribute("product");
	%>

	<div class="hero-wrap hero-bread" style="background-image: url('images/bg_1.jpg');"> </div>
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
	<section class="ftco-sectionn">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 mb-5 ftco-animate">
					<img src="<%=productt.getImage()%>" class="img-fluid">
				</div>
				<div class="col-lg-6 product-details pl-md-5 ftco-animate">
					<h3><%=productt.getName()%></h3>

					<p class="price"><span><%= productt.getPrice() %> &euro; </span></p>
					<p>Tα κύρια υλικά που χρησιμοποιούνται είναι αλεύρι μαλακό και σκληρό, σιμιγδάλι, γάλα και αυγά.</p>
					<p>Τα προϊόντα μας φτιάχνονται πάντα με τα ίδια υλικά και τη συνταγή, όπως ακριβώς και οι προγόνοι μας.</p>
					<p>Συσκευασία 1 κιλού.</p>	
					
					<div class="w-100"></div>
					<input type="number" name="quantity" min="1" style="width:60px;" value="1"
						id="<%=productt.getCode() %>"> <a href="Javascript: void(0);"
						data-quantity-field="<%=productt.getCode() %>" data-product-quantity="1"
						data-product-name="<%=productt.getName() %>" data-product-price="<%=productt.getPrice() %>"
						data-product-image="<%=productt.getImage() %>"
						data-product-category="<%=productt.getCategory()%>"
						class="btn btn-primary addtocart">Προσθήκη</a>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-sectionn">
		<div class="container">
			<div class="row no-gutters ftco-services">
				<div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services mb-md-0 mb-4">
						<div class="icon bg-color-2 d-flex justify-content-center align-items-center mb-2">
							<span class="flaticon-diet"></span>
						</div>
						<div class="media-body">
							<h3 class="heading">ΠΑΝΤΑ ΜΕ ΦΡΕΣΚΑ ΥΛΙΚΑ</h3>
							<span>Ολες οι πρωτες υλες που χρησιμοποιουμε καλλιεργουνται στον τοπο μας απο
								ντοπιους.</span>
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