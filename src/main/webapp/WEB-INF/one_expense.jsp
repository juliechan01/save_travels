<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix= "form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %> 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit "<c:out value="${expense.cost}"></c:out>"</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
	<div class="container">
		<div class="head1">
			<h1>Edit "<c:out value="${expense.cost}"></c:out>"</h1>	
			<a class="lead" href ="/expenses">Go back</a>
		</div>
		
		<div class="content">
			<div class="cost1">
				<h3>Expense:</h3>
				<p class="lead"><c:out value="${expense.cost}"></c:out></p>			
			</div>
			
			<div class="vendor1">
				<h3>Vendor:</h3>
				<p class="lead">${expense.vendor}</p>			
			</div>
			
			<div class="amnt1">
				<h3>Amount:</h3>
				<p class="lead">${expense.amount}</p>			
			</div>
			
			<div class="describe1">
				<h3>Description:</h3>
				<p class="lead">${expense.description}</p>			
			</div>
		</div>
		
		<div class="form">
			<h3>Update:</h3>
			<form:form action='/expenses/${expense.id}' method='PUT' modelAttribute='expense'>
				<div class="cost">
					<form:label path="cost">Expense Name:</form:label>
					<form:errors path="cost" class="text-danger"></form:errors>
					<form:input class="form-control" type='text' path="cost" placeholder="${expense.cost} }"></form:input>	
				</div>
					
				<div class="vendor">
					<form:label path="vendor">Vendor:</form:label>
					<form:errors path="vendor" class="text-danger"></form:errors>
					<form:input class="form-control" type='text' path="vendor" placeholder="${expense.vendor}"></form:input>
				</div>
					
				<div class="amnt">
					<form:label path="amount">Amount (based in US Dollars):</form:label>
					<form:errors path="amount" class="text-danger"></form:errors>
					<form:input class="form-control" type='number' path="amount" placeholder="${expense.amount}"></form:input>
				</div>
					
				<div class="describe">
					<form:label path ="description">Description:</form:label>
					<form:errors path ="description" class="text-danger"></form:errors>
					<form:textarea class="form-control" path="description" id='floatingTextarea' placeholder="${expense.description}"></form:textarea>
				</div>
					
				<div class="submit">
    					<button type='submit' class="btn btn-info">Submit</button>    				
	    			</div> 					
			</form:form>
		</div>	
	</div>
</body>
</html>