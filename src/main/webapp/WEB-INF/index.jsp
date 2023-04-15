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
<title>All Expenses</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
	<div class="container">
		<div class="head">
			<h1>All Expenses</h1>		
		</div>
		
		<div class="content">
			<table class="table">
				<thead>
					<tr>
						<th class="lead">Expenses</th>
						<th class="lead">Vendor</th>
						<th class="lead">Amount (USD)</th>
						<th class="lead">Actions</th>
					</tr>
				</thead>
			
				<tbody>
					<c:forEach var="c" items="${expenses}">
						<tr>
							<td><a href ="/expenses/${c.id}"><c:out value="${c.cost}"></c:out></a></td>
							<td><c:out value="${c.vendor}"></c:out></td>
							<td><c:out value="${c.amount}"></c:out></td>
							<td>
								<form action="/expenses/${c.id}" method="POST">
    									<input type="hidden" name="_method" value="delete">
    									<button type="submit" class="btn btn-danger">Delete</button>
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<!-- var forms = document.querySelectorAll('.needs-validation')
			Array.prototype.slice.call(forms)
  				.forEach(function (form) {
    				form.addEventListener('submit', function (event) {
      				if (!form.checkValidity()) {
        					event.preventDefault()
        					event.stopPropagation()
      				}

      				form.classList.add('was-validated')
    					}, false)
  				}) -->
			
			<div class="form">
				<h2>Add an expense:</h2>
				<form:form action='/expenses/new' method='POST' modelAttribute='expense'>
					<div class="cost">
						<form:label path="cost">Expense Name:</form:label>
						<form:errors path="cost" class="text-danger"></form:errors>
						<form:input class="form-control" type='text' path="cost" placeholder="e.g. Flight tickets"></form:input>	
					</div>
					
					<div class="vendor">
						<form:label path="vendor">Vendor:</form:label>
						<form:errors path="vendor" class="text-danger"></form:errors>
						<form:input class="form-control" type='text' path="vendor" placeholder="e.g. Delta Airlines"></form:input>
					</div>
					
					<div class="amnt">
						<form:label path="amount">Amount (based in US Dollars):</form:label>
						<form:errors path="amount" class="text-danger"></form:errors>
						<form:input class="form-control" type='number' path="amount" placeholder="e.g. 324"></form:input>
					</div>
					
					<div class="describe">
						<form:label path ="description">Description:</form:label>
						<form:errors path ="description" class="text-danger"></form:errors>
						<form:textarea class="form-control" path="description" id='floatingTextarea'></form:textarea>
					</div>
					
					<div class="submit">
    						<button type='submit' class="btn btn-info">Submit</button>    				
	    				</div> 					
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>