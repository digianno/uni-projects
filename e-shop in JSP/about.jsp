<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*"%>
<%@page import="website.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Η ιστορία μας</title>
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

	<div class="hero-wrap hero-bread" style="background-image: url('images/bg_5.jpg');">
		<div class="container">
			<div class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Λίγα λόγια </a></span> <span>για
							την</span></p>
					<h1 class="mb-0 bread">επιχείρηση μας</h1>
				</div>
			</div>
		</div>
	</div>
	<hr>
	<section class="ftco-section ftco-no-pb ftco-no-pt bg-light">
		<div class="container">
			<div class="row">
				<div class="col-md-5 p-md-5 img img-2 d-flex justify-content-center align-items-center"
					style="background-image: url(images/about.jpg);">
					<a href="./video/RPReplay_Final1571450830 2.mov"
						class="icon popup-vimeo d-flex justify-content-center align-items-center">
						<span class="icon-play"></span>
					</a>
				</div>
				<div class="col-md-7 py-5 wrap-about pb-md-5 ftco-animate">
					<div class="heading-section-bold mb-4 mt-md-5">
						<div class="ml-md-0">
							<h2 class="mb-4">Καλώς ήρθατε στο ηλεκτρονικό μας κατάστημα</h2>
						</div>
					</div>
					<div class="pb-md-5">
						<p>Η επιχείρηση Παραδοσιακά Ζυμαρικά Μεγαλόπολης δραστηριοποιείται στον τομέα της παραγωγής
							ζυμαρικών από το 1985 έως και σήμερα.Όλα αυτά τα χρόνια κύριο μέλημα μας είναι η παραγωγή
							των ζυμαρικών να ακολουθεί πιστά την παράδοση τόσο στον τομέα της παρασκευής όσο και στον
							τομέα των πρώτων υλών.
							<p>Αυτό σημαίνει ότι οι πρώτες ύλες προέρχονται από την ευρύτερη περιοχή μας και είναι πάντα
								φρέσκες και αγνές. Για την παρασκευή των ζυμαρικών ακολουθούμε πιστά τις συνταγές των
								γιαγιάδων και των γονέων μας που ξεκίνησαν άλλωστε αυτή την επιχείρηση.</p>
							<p><a href="#" class="btn btn-primary">Shop now</a></p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<hr>

	<section class="ftco-section ftco-counter img" id="section-counter" style="background-image: url(images/bg_3.jpg);">
		<div class="container">
			<div class="row justify-content-center py-5">
				<div class="col-md-10">
					<div class="row">
						<div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
							<div class="block-18 text-center">
								<div class="text">
									<strong class="number" data-number="10000">0</strong>
									<span>Χαρούμενοι πελάτες</span>
								</div>
							</div>
						</div>
						<div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
							<div class="block-18 text-center">
								<div class="text">
									<strong class="number" data-number="100">0</strong>
									<span>Συνεργαζόμενα Καταστήματα</span>
								</div>
							</div>
						</div>
						<div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
							<div class="block-18 text-center">
								<div class="text">
									<strong class="number" data-number="50">0</strong>
									<span>Προμηθευτές</span>
								</div>
							</div>
						</div>
						<div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
							<div class="block-18 text-center">
								<div class="text">
									<strong class="number" data-number="30">0</strong>
									<span>Χρόνια Εμπειρίας</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

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
