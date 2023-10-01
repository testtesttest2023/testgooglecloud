<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title"><b>ORDER INFORMATION</b></h3>
    </div>
    <form:form class="panel-body" modelAttribute="order">
        <div class="row">
            <div class="form-group col-sm-4">
                <label>Order Id:</label>
                <form:input path="id" readonly="true" class="form-control"/>
            </div>
            <div class="form-group col-sm-4">
                <label>Purchaser:</label>
                <form:input path="customer.id" readonly="true" class="form-control"/>
            </div>
            <div class="form-group col-sm-4">
                <label>Order Date:</label>
                <form:input path="orderDate" readonly="true" class="form-control"/>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-sm-4">
                <label>Total Amount:</label>
                <form:input path="amount" readonly="true" class="form-control"/>
            </div>
            <div class="form-group col-sm-4">
                <label>Order Status:</label>
                <form:input path="status" readonly="true" class="form-control"/>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-sm-12">
                <label>Shipping Address:</label>
                <form:input path="address" readonly="true" class="form-control"/>
            </div>
            <div class="form-group col-sm-12">
                <label>Notes:</label>
                <form:textarea path="notes" readonly="true" rows="3" class="form-control"></form:textarea>
            </div>
        </div>
    </form:form>
</div>

<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title"><b>ORDER DETAILS</b></h3>
    </div>
    <table class="table table-hover">
        <thead>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Unit Price</th>
                <th>Quantity</th>
                <th>Discount</th>
                <th>Amount</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="d" items="${order.orderDetails}">
            <tr>
                <td>${d.product.id}</td>
                <td>${d.product.name}</td>
                <td>${d.unitPrice}</td>
                <td>${d.discount}</td>
                <td>${d.quantity}</td>
                <td>${d.unitPrice * d.quantity * (1 - d.discount)}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<c:if test="${order.status == 0}">
<div class="panel panel-default">
    <div class="panel-heading">
        <a href="/order/cancel/${order.id}" class="btn btn-default">Cancel</a>
    </div>
</div>
</c:if>