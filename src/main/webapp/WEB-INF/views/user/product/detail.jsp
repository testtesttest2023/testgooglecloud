<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<div class="panel panel-default nn-prod-detail">
	<div class="panel-heading">
		<h3 class="panel-title"><strong>CHI TIẾT HÀNG HÓA</strong></h3>
	</div>
    <div class="panel-body">
        <div class="row">
            <div class="col-sm-6 text-center">
                <img class="nn-prod-detail-img" src="/static/images/items/${prod.image}">
            </div>
            <div class="col-sm-6">
                <ul>
                    <li><b>Id</b>: <i>${prod.id}</i></li>
                    <li><b>Name</b>: <i>${prod.name}</i></li>
                    <li><b>Unit Price</b>: <i>${prod.unitPrice} USD</i></li>
                    <li><b>Discount</b>: <i>${prod.discount*100}%</i></li>
                    <li><b>Quantity</b>: <i>${prod.quantity}</i></li>
                    <li><b>Product Date</b>: <i>${prod.productDate}</i></li>
                    <li><b>Category</b>: <i>${prod.category.nameVN}</i></li>
                    <li><b>Special?</b>: <i>${prod.special?'Yes':'No'}</i></li>
                    <li><b>Latest?</b>: <i>${prod.latest?'Yes':'No'}</i></li>
                    <li><b>View Count?</b>: <i>${prod.clickCount}</i></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="panel-body text-justify">
        ${prod.description}
    </div>
    <div class="panel-footer text-right" data-item="${prod.id}">
        <jsp:include page="_actions.jsp"/>
    </div>
</div>

<div class="nn-prod-detail">
    <ul class="nav nav-tabs">
        <li class="active">
            <a data-toggle="tab" href="#tab1">
                <i class="glyphicon glyphicon-th-list"></i> Same Category Items
            </a>
        </li>
        <li>
            <a data-toggle="tab" href="#tab2">
                <i class="glyphicon glyphicon-edit"></i> Visited Items
            </a>
        </li>
    </ul>
    
    <div class="tab-content">
        <div id="tab1" class="tab-pane fade in active">
        	<c:set scope="request" var="prods" value="${prod.category.products}"/>
            <jsp:include page="_thumb.jsp"/>
        </div>
        <div id="tab2" class="tab-pane fade">
        	<c:set scope="request" var="prods" value="${visits}"/>
            <jsp:include page="_thumb.jsp"/>
        </div>
    </div>
</div>

<jsp:include page="_send-dialog.jsp"/>