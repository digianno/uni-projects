<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.* , java.util.List , java.util.ArrayList"%>
<%@page import="website.*"%>

<%
ProductDAO pdao = new ProductDAO();
pdao.open();

List<Product> productlist = pdao.getAllProducts();
pdao.close();


List<Product> xulopites = new ArrayList<Product>();
List<Product> traxanas = new ArrayList<Product>();
List<Product> lazania = new ArrayList<Product>();
List<Product> vides = new ArrayList<Product>();
List<Product> kritharaki = new ArrayList<Product>();
List<Product> other = new ArrayList<Product>();

for(Product product: productlist) {

	if (product.getCategory().equals(new String("Xulopites"))){
		xulopites.add(new Product( product.getCode() , product.getCategory(), product.getName(), product.getPrice(), product.getImage(),product.getQuantity() ));
	} else if (product.getCategory().equals(new String("Traxanas" ))){
		traxanas.add(new Product( product.getCode() , product.getCategory(), product.getName(), product.getPrice(), product.getImage(),product.getQuantity() ));
	} else if ( product.getCategory().equals(new String("Lazania") )){
		lazania.add(new Product( product.getCode() , product.getCategory(), product.getName(), product.getPrice(), product.getImage(),product.getQuantity() ));
	} else if (product.getCategory().equals( new String ("Vides"))){
		vides.add(new Product( product.getCode() , product.getCategory(), product.getName(), product.getPrice(), product.getImage(),product.getQuantity() ));
	} else if( product.getCategory().equals(new String ("Kritharaki"))) {
		kritharaki.add(new Product( product.getCode() , product.getCategory(), product.getName(), product.getPrice(), product.getImage(),product.getQuantity() ));
	} else {
		other.add(new Product( product.getCode() , product.getCategory(), product.getName(), product.getPrice(), product.getImage(),product.getQuantity() ));
	}	
}

request.setAttribute("all",productlist);
request.setAttribute("xulopites",xulopites);
request.setAttribute("traxanas",traxanas);
request.setAttribute("lazania",lazania);
request.setAttribute("vides",vides);
request.setAttribute("kritharaki",kritharaki);
request.setAttribute("other",other);




%>

<!DOCTYPE html>
<html lang="en">

<head>
	<title>Τα προϊόντα μας</title>
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
	<% } %>
	
	<div class="hero-wrap hero-bread" style="background-image: url('images/bg_3.jpg');">
		<div class="container">
			<div class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">

					<h1 class="mb-0 bread">Τα προϊόντα μας</h1>
				</div>
			</div>
		</div>
	</div>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-10 mb-5 text-center">
					<ul class="product-category">
						<li><a href="shop.jsp?id=all">Όλα</a></li>
						<li><a href="shop.jsp?id=xulopites">Χυλοπίτες</a></li>
						<li><a href="shop.jsp?id=traxanas">Τραχανάς</a></li>
						<li><a href="shop.jsp?id=lazania">Λαζάνια</a></li>
						<li><a href="shop.jsp?id=vides">Βίδες</a></li>
						<li><a href="shop.jsp?id=kritharaki">Κριθαράκι</a></li>
						<li><a href="shop.jsp?id=other">Άλλα</a></li>
					</ul>
				</div>
			</div>
	<%
	if (request.getAttribute("Wrong Product!") != null){ %>
          <div class="alert alert-danger text-center" role="alert"><% out.println(request.getAttribute("Wrong Product!"));%> </div>
          </p>
	<% } %>
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
			<div class="row">
				<%
				String selectedLink = request.getParameter("id");
					if (selectedLink.equals("all")) {
						List<Product> all = (List<Product>) request.getAttribute("all");
						for(Product product: all) {
						%>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="product">
						<a href="product-single.jsp?prd=<%=product.getCode()%>" class="img-prod"><img class="img-fluid"
								src="<%=product.getImage() %>">
							<div class="overlay"></div>
						</a>
						<div class="text py-3 pb-4 px-3 text-center">
							<h3><%=product.getName() %></h3>
							<p class="price"><span class="mr-3 price"><%= product.getPrice() %> &euro; </span></p>
							<input type="number" name="quantity" min="1" style="width:60px;" value="1"
								id="<%=product.getCode() %>"> <a href="Javascript: void(0);"
								data-quantity-field="<%=product.getCode() %>" data-product-quantity="1"
								data-product-name="<%=product.getName() %>"
								data-product-price="<%=product.getPrice() %>"
								data-product-image="<%=product.getImage() %>"
								data-product-category="<%=product.getCategory()%>"
								class="btn btn-primary  addtocart">Προσθήκη</a>
						</div>
					</div>
				</div>
				<%
						}
					} else if (selectedLink.equals("xulopites")) {
						xulopites = (List<Product>) request.getAttribute("xulopites");
						for(Product product: xulopites) {
					%>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="product">
						<a href="product-single.jsp?prd=<%=product.getCode()%>" class="img-prod"><img class="img-fluid"
								src="<%=product.getImage() %>">
							<div class="overlay"></div>
						</a>
						<div class="text py-3 pb-4 px-3 text-center">
							<h3><%=product.getName() %></h3>


							<p class="price"><span class="mr-3 price"><%= product.getPrice() %> &euro; </span></p>
							<input type="text" name="quantity" min="1" style="width:60px;" value="1"
								id="<%=product.getCode() %>"> <a href="Javascript: void(0);"
								data-quantity-field="<%=product.getCode() %>" data-product-quantity="1"
								data-product-name="<%=product.getName() %>"
								data-product-price="<%=product.getPrice() %>"
								data-product-image="<%=product.getImage() %>"
								data-product-category="<%=product.getCategory()%>"
								class="btn btn-primary  addtocart">Προσθήκη</a>
						</div>
					</div>
				</div>
				<%
						}
					} else if (selectedLink.equals("traxanas")) {
						traxanas = (List<Product>) request.getAttribute("traxanas");
						for(Product product: traxanas) {
					%>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="product">
						<a href="product-single.jsp?prd=<%=product.getCode()%>" class="img-prod"><img class="img-fluid"
								src="<%=product.getImage() %>">
							<div class="overlay"></div>
						</a>
						<div class="text py-3 pb-4 px-3 text-center">
							<h3><%=product.getName() %></h3>

							<p class="price"><span class="mr-3 price"><%= product.getPrice() %> &euro; </span></p>
							<input type="number" name="quantity" min="1" style="width:60px;" value="1"
								id="<%=product.getCode() %>"> <a href="Javascript: void(0);"
								data-quantity-field="<%=product.getCode() %>" data-product-quantity="1"
								data-product-name="<%=product.getName() %>"
								data-product-price="<%=product.getPrice() %>"
								data-product-image="<%=product.getImage() %>"
								data-product-category="<%=product.getCategory()%>"
								class="btn btn-primary  addtocart">Προσθήκη</a>
						</div>
					</div>
				</div>
				<% 
						}
					} else if (selectedLink.equals("lazania")) {
						lazania = (List<Product>) request.getAttribute("lazania");
						for(Product product: lazania) {
					%>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="product">
						<a href="product-single.jsp?prd=<%=product.getCode()%>" class="img-prod"><img class="img-fluid"
								src="<%=product.getImage() %>">
							<div class="overlay"></div>
						</a>
						<div class="text py-3 pb-4 px-3 text-center">
							<h3><%=product.getName() %></h3>

							<p class="price"><span class="mr-3 price"><%= product.getPrice() %> &euro; </span></p>
							<input type="number" name="quantity" min="1" style="width:60px;" value="1"
								id="<%=product.getCode() %>"> <a href="Javascript: void(0);"
								data-quantity-field="<%=product.getCode() %>" data-product-quantity="1"
								data-product-name="<%=product.getName() %>"
								data-product-price="<%=product.getPrice() %>"
								data-product-image="<%=product.getImage() %>"
								data-product-category="<%=product.getCategory()%>" class="addtocart">Προσθήκη</a>
						</div>
					</div>
				</div>
				<% 
						}
					} else if (selectedLink.equals("vides")) {
						vides = (List<Product>) request.getAttribute("vides");
						for(Product product: vides) {
					%>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="product">
						<a href="product-single.jsp?prd=<%=product.getCode()%>" class="img-prod"><img class="img-fluid"
								src="<%=product.getImage() %>">
							<div class="overlay"></div>
						</a>
						<div class="text py-3 pb-4 px-3 text-center">
							<h3><%=product.getName() %></h3>

							<p class="price"><span class="mr-3 price"><%= product.getPrice() %> &euro; </span></p>
							<input type="number" name="quantity" min="1" style="width:60px;" value="1"
								id="<%=product.getCode() %>"> <a href="Javascript: void(0);"
								data-quantity-field="<%=product.getCode() %>" data-product-quantity="1"
								data-product-name="<%=product.getName() %>"
								data-product-price="<%=product.getPrice() %>"
								data-product-image="<%=product.getImage() %>"
								data-product-category="<%=product.getCategory()%>"
								class="btn btn-primary  addtocart">Προσθήκη</a>
						</div>
					</div>
				</div>
				<% 
						}
					} else if (selectedLink.equals("kritharaki")) {
						kritharaki = (List<Product>) request.getAttribute("kritharaki");
						for(Product product: kritharaki) {
					%>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="product">
						<a href="product-single.jsp?prd=<%=product.getCode()%>" class="img-prod"><img class="img-fluid"
								src="<%=product.getImage() %>">
							<div class="overlay"></div>
						</a>
						<div class="text py-3 pb-4 px-3 text-center">
							<h3><%=product.getName() %></h3>

							<p class="price"><span class="mr-3 price"><%= product.getPrice() %> &euro; </span></p>
							<input type="number" name="quantity" min="1" style="width:60px;" value="1"
								id="<%=product.getCode() %>"> <a href="Javascript: void(0);"
								data-quantity-field="<%=product.getCode() %>" data-product-quantity="1"
								data-product-name="<%=product.getName() %>"
								data-product-price="<%=product.getPrice() %>"
								data-product-image="<%=product.getImage() %>"
								data-product-category="<%=product.getCategory()%>"
								class="btn btn-primary  addtocart">Προσθήκη</a>
						</div>
					</div>
				</div>
				<% 
						}
					} else if (selectedLink.equals("other")) {
						other = (List<Product>) request.getAttribute("other");
						for(Product product: other) {
					%>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="product">
						<a href="product-single.jsp?prd=<%=product.getCode()%>" class="img-prod"><img class="img-fluid"
								src="<%=product.getImage() %>">
							<div class="overlay"></div>
						</a>
						<div class="text py-3 pb-4 px-3 text-center">
							<h3><%=product.getName() %></h3>

							<p class="price"><span class="mr-3 price"><%= product.getPrice() %> &euro; </span></p>
							<input type="number" name="quantity" min="1" style="width:60px;" value="1"
								id="<%=product.getCode() %>"> <a href="Javascript: void(0);"
								data-quantity-field="<%=product.getCode() %>" data-product-quantity="1"
								data-product-name="<%=product.getName() %>"
								data-product-price="<%=product.getPrice() %>"
								data-product-image="<%=product.getImage() %>"
								data-product-category="<%=product.getCategory()%>"
								class="btn btn-primary  addtocart">Προσθήκη</a>
						</div>
					</div>
				</div>
				<% 
						}
					}
				%>
			</div>
	</section>


	<div id="footer"></div>

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
				stroke="#F96D00" /></svg></div>


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