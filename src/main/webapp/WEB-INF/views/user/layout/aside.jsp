<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!--Shopping Cart-->
<jsp:include page="_aside-cart.jsp"/>

<!--Search-->
<jsp:include page="_aside-search.jsp"/>

<!--Favorite Items-->
<div id="favos">
	<c:import url="/layout/aside/favorite"/>
</div>

<!--Categories-->
<c:import url="/layout/aside/category"/>

<!--Specials-->
<jsp:include page="_aside-special.jsp"/>

