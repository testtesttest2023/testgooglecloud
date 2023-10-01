<%@ page  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<div class="panel panel-warning">
    <div class="panel-heading">
        <h3 class="panel-title"><b>YOUR SHOPPING CART</b></h3>
    </div>
    <table class="table table-hover">
        <thead>
            <tr>
                <th>No.</th>
                <th>Name</th>
                <th>Unit Price</th>
                <th>Discount</th>
                <th>Quantity</th>
                <th>Amount</th>
                <th></th>
            </tr>
        </thead>
        <tbody class="nn-cart-items">
        <c:forEach var="item" items="${cart.items}" varStatus="st">
            <tr data-item='{"id":${item.id}, "price":${item.price}, "disc":${item.disc}}'>
                <td>${st.index + 1}</td>
                <td><a href="/product/detail/${item.id}">${item.name}</a></td>
                <td>$${item.price}</td>
                <td>${item.disc * 100}%</td>
                <td>
                	<input class="nn-cart-change" value="${item.qty}" type="number" min="1" style="width:50px">
                </td>
                <td class="nn-item-amt">$${item.amount}</td>
                <td class="text-center">
                    <button class="btn btn-xs btn-danger glyphicon glyphicon-trash nn-cart-remove"></button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="panel-footer text-right">
        <a href="/product/x" class="btn btn-sm btn-info">
            <i class="glyphicon glyphicon-hand-left"></i> Add More
        </a>
        <button class="btn btn-sm btn-warning nn-cart-clear">
            <i class="glyphicon glyphicon-trash"></i> Clear All
        </button>
        <c:if test="${empty sessionScope.user }">
        <a href="/order/checkout" class="btn btn-sm btn-success">
            <i class="glyphicon glyphicon-ok"></i> Checkout
        </a>
        </c:if>
        <b class="pull-left">Total Amount: <i class="cart-amt">?</i></b>
    </div>
</div>

<c:if test="${!empty sessionScope.user }">
<form action="/order/purchase" method="post">
<div class="panel panel-danger">
    <div class="panel-heading">
        <h3 class="panel-title"><b>ORDER INFORMATION</b></h3>
    </div>
    <div class="panel-body">
        <div class="form-group">
            <label>Shipping Address:</label>
            <input name="address" placeholder="Shipping Address?" class="form-control">
        </div>
        <div class="form-group">
            <label>Notes:</label>
            <textarea name="notes" placeholder="Write something here?" rows="3" class="form-control"></textarea>
        </div>
	</div>
    <div class="panel-footer text-right">
        <button class="btn btn-danger">
            <i class="glyphicon glyphicon-gbp"></i>
            Purchase
        </button>
    </div>
</div>
    </form>
</c:if>