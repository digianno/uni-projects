<%--
	This page will handle only AJAX requests
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, website.*"%>
<%@ page errorPage="ajaxerror.jsp"%>

<%
String code = request.getParameter("code");

try {	
	if(request.getHeader("X-Request-page") == null || !request.getHeader("X-Request-page").equals( "my_remove_ajax_script" ) ) {
		throw new Exception("Η σελίδα δεν επιτρέπει την απευθείας κλίση");
	}
	if( code == null || code.length() == 0 ) {
		throw new Exception("Μη έγκυρο αίτημα");	
	}	
	
} catch(Exception e) {
	throw new Exception(e.getMessage() );	
}
List<Product> productlist = (List)session.getAttribute("cart");
int totalitems = 0;

if(productlist == null) {
    return ;
} 


List<Product> newproductlist = new ArrayList<Product>();
for (int i = 0; i < productlist.size(); i++) {

	String code2 = productlist.get(i).getCode();
	out.println(code2);
	if (code.equals(code2) ) {
		productlist.remove(i);
		out.println("ok2");
		break;
	} 
}

for (int i = 0; i < productlist.size(); i++) {
	newproductlist.add(productlist.get(i));
}


session.removeAttribute("cart");
if (newproductlist.size() != 0 ) {
	session.setAttribute("cart", newproductlist);
} else {
	session.setAttribute("cart", null);
}
totalitems = getTotalItems(newproductlist);
session.setAttribute("cartitems", totalitems);

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