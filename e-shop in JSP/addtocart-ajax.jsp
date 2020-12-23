<%--
	This page will handle only AJAX requests
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, website.*"%>
<%@ page errorPage="ajaxerror.jsp"%>
<%
String quantity = request.getParameter("quantity");
String code = request.getParameter("code");
String name = request.getParameter("name");
String  price = request.getParameter("price");
String image = request.getParameter("image");
String category = request.getParameter("category");

int quantityNum = 0;
double priceNum = 0;



try {
	
	if(request.getHeader("X-Request-page") == null || !request.getHeader("X-Request-page").equals( "my_ajax_script" ) ) {
		throw new Exception("Η σελίδα δεν επιτρέπει την απευθείας κλίση");
	}
	if( quantity == null || quantity.length() == 0
		|| code == null || code.length() == 0
		|| name == null || name.length() == 0
		|| price == null || price.length() == 0
		|| image == null || image.length() == 0 
		|| category == null || category.length() == 0 ) {
		
		throw new Exception("Μη έγκυρο αίτημα");	
	}	
	
} catch(Exception e) {
	throw new Exception(e.getMessage() );	
}

try {
	quantityNum = Integer.parseInt(quantity);
	
	if(quantityNum <= 0) {
		throw new Exception();
	}
	
} catch(Exception e) {
	throw new Exception( "Η ποσότητα '" + quantity + "' δεν είναι έγκυρη" );	
}

try {
	priceNum = Double.parseDouble(price);
	
	if(priceNum <= 0) {
		throw new Exception();
	}
	
} catch(Exception e) {
	throw new Exception( "Η τιμή '" + price + "' δεν είναι έγκυρη" );	
}


List<Product> productlist = null;
int totalitems = 0;

productlist = (List)session.getAttribute("cart");

Product product = new Product();
product.setCode(code);
product.setName(name);
product.setPrice(priceNum);
product.setQuantity(quantityNum);
product.setImage(image);
product.setCategory(category);

if(productlist == null) {
	
	productlist = new ArrayList<Product>();
	productlist.add(product);
	session.setAttribute("cart", productlist);	
	totalitems = getTotalItems(productlist);	
	session.setAttribute("cartitems", totalitems );
	
	out.println( totalitems );
	return;
	
} 	
		
List<Product> newproductlist = new ArrayList<Product>();
boolean isAlreadyinCart = false;

for (int i = 0; i < productlist.size(); i++) {
	Product tmpproduct = productlist.get(i);
	int num1 = tmpproduct.getQuantity();
	int num2 = product.getQuantity();
	
	if( tmpproduct.getCode().equals(product.getCode()) ) {
		tmpproduct.setQuantity( num1 + num2 );
		
		newproductlist.add(tmpproduct);				
		isAlreadyinCart = true;
	} else {
		newproductlist.add(tmpproduct);
	} 		
}

if(!isAlreadyinCart) {
	newproductlist.add(product);	
}

session.removeAttribute("cart");
session.setAttribute("cart", newproductlist);
totalitems = getTotalItems(newproductlist);
session.setAttribute("cartitems", totalitems);

out.println( totalitems );
%>

<%!
private int getTotalItems(List<Product> items) {
	
	int sum = 0;
	
	for(Product product: items) {		
		sum += product.getQuantity();		
	}
	
	return sum;
}
%>