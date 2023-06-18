<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--1 使用标签设置Locale信息--%>
	<fmt:setLocale value="${param.locale}" />
	<%--2 使用标签设置baseName--%>
	<fmt:setBundle basename="i18n"/>


	<a href="i18n_fmt.jsp?locale=zh_CN">中文</a>|
	<a href="i18n_fmt.jsp?locale=en_US">english</a>
	<center>
		<h1><fmt:message key="regist" /></h1>
		<table>
		<form>
			<tr>
				<td><fmt:message key="username" /></td>
				<td><input name="username" type="text" /></td>
			</tr>
			<tr>
				<td><fmt:message key="password" /></td>
				<td><input type="password" /></td>
			</tr>
			<tr>
				<td><fmt:message key="sex" /></td>
				<td>
					<input type="radio" /><fmt:message key="boy" />
					<input type="radio" /><fmt:message key="girl" />
				</td>
			</tr>
			<tr>
				<td><fmt:message key="email" /></td>
				<td><input type="text" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="reset" value="<fmt:message key="reset" />" />&nbsp;&nbsp;
				<input type="submit" value="<fmt:message key="submit" />" /></td>
			</tr>
			</form>
		</table>
		<br /> <br /> <br /> <br />
	</center>
	<script type="text/javascript">
		$("#username").blur(function () {
			//1 获取用户名
			var username = this.value;
			$.getJSON("http://localhost:8080/book/userServlet","action=ajaxExistsUsername&username=" +
					username,function (data) {
				if (data.existsUsername) {
					$("span.errorMsg").text("用户名已存在！");
				} else {
					$("span.errorMsg").text("用户名可用！");
				}
			});
		});
	</script>
</body>
</html>