<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*"%>
<%@page import="website.*"%>

<%  Customer cus =(Customer)session.getAttribute("loggedin"); 


%>

<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">

    <a class="navbar-brand" href="index.jsp">Παραδοσιακα Ζυμαρικα Μεγαλoπολης</a>
    <div class="container">
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="oi oi-menu"></span> Menu
      </button>
      <div class="collapse navbar-collapse" id="ftco-nav">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item"><a href="index.jsp" class="nav-link">Αρχικη</a></li>
          <li class="nav-item"><a href="about.jsp" class="nav-link">Η επιχειρηση </a></li>
          <li class="nav-item"><a href="shop.jsp?id=all" class="nav-link">Τα Προϊοντα</a></li>
          <li class="nav-item"><a href="contact.jsp" class="nav-link">Γινε ο δημιουργος</a></li>
          <li class="nav-item"><a href="partners.jsp" class="nav-link">Συνεργαζομενα Καταστηματα</a></li>
          <li class="nav-item cta cta-colored"><a href="cart.jsp" class="nav-link"><span class="icon-shopping_cart"></span></a></li>
          <li class="nav-item"><a href="cuProfile.jsp" class="nav-link"><% out.println(cus.getName()); %></a></li>
          <li class="nav-item"><a href="logout.jsp" class="nav-link"> Έξοδος</a></li>
        </ul>
      </div>
    </div>
  </nav>
