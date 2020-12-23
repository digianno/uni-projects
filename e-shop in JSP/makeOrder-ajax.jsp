<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, website.*"%>
<%@ page errorPage="ajaxerror.jsp"%>
<%

String customercode = request.getParameter("code");
String date = request.getParameter("date");
String sum = request.getParameter("total");
String choice = request.getParameter("paymentchoice");
String terms = request.getParameter("terms");


double totalSum = 0;
int code = 0;

try {
	
	if(request.getHeader("X-Request-page") == null || !request.getHeader("X-Request-page").equals( "makeOrder_ajax_script" ) ) {
		throw new Exception("Η σελίδα δεν επιτρέπει την απευθείας κλίση");
	}
	if(  choice == null || choice.length() == 0) {
		throw new Exception("Παρακαλώ επιλέξτε τρόπο πληρωμής.");	
	}	
	if(  terms.equals("false")) {
		throw new Exception("Παρακαλώ επιλέξτε οτι συναινείτε στους όρους και στις προϋποθέσεις.");	
	}	
	if( customercode == null || customercode.length() == 0
		|| date == null || date.length() == 0
		|| sum == null || sum.length() == 0 ) {
		throw new Exception("Μη έγκυρο αίτημα");	
	}	
	
} catch(Exception e) {
	throw new Exception(e.getMessage() );	
}

code = Integer.parseInt(customercode);
totalSum = Double.parseDouble(sum);

OrderDAO temp = new OrderDAO();
try {
    temp.createOrder(code,date,totalSum,choice);
} catch (Exception e) {
    throw new Exception(e.getMessage() );	
}

List<Product> productlist = null;
productlist = (List)session.getAttribute("cart");
Order newOrder = null;
try {
	 newOrder = temp.findOrder(code,totalSum,"new",date);
} catch (Exception e) {
    throw new Exception(e.getMessage() );	
}

for (Product prd:productlist) {
	temp.insertProducts(newOrder.getOrder_id(),prd.getCode(),prd.getQuantity());
}
temp.closeOrder(newOrder.getOrder_id());
session.removeAttribute("cart");
%>