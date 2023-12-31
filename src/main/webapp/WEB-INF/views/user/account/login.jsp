<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<s:message code="acc.id" var="acc_id"/>
<s:message code="acc.pw" var="acc_pw"/>
<s:message code="acc.rm" var="acc_rm"/>
<s:message code="acc.btn" var="acc_btn"/>

<form class="col-sm-8 col-sm-offset-2" action="/account/login" method="post">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">
                <i class="glyphicon glyphicon-user"></i>
                <b>LOGIN</b>
            </h3>
        </div>
        <div class="panel-body">
            <div class="form-group">
                <label><i class="glyphicon glyphicon-user"></i> ${acc_id}:</label>
                <input value="${form.username}" name="username" placeholder="Username?" class="form-control">
            </div>
            <div class="form-group">
                <label><i class="glyphicon glyphicon-lock"></i> ${acc_pw}:</label>
                <input value="${form.password}" name="password" placeholder="Password?" type="password" class="form-control">
            </div>
            <div class="form-group">
                <label class="checkbox-inline">
                    <input name="remember" value="true" type="checkbox"> 
                    <i class="glyphicon glyphicon-save"></i> ${acc_rm}?
                </label>
            </div>
        </div>
        <div class="panel-footer text-right">
            <button class="btn btn-default">
                <i class="glyphicon glyphicon-ok"></i> ${acc_btn}
            </button>
            <b class="pull-left text-danger"><i>${message}${param.message}</i></b>
        </div>
    </div>    
</form>