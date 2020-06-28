<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.4.1.js"></script>
</head>
<body>
<form action="${pageContext.request.contextPath }/course/update.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="cid" value="${course.cid }">
	课程名称:<input name="cname" value="${course.cname }"><br>
	课程价格:<input name="price" value="${course.price }"><br>
	是否有效:
		<input type="radio" name="tai" value="1" <c:if test="${course.tai.contains('1') }">checked</c:if>>是
		<input type="radio" name="tai" value="2" <c:if test="${course.tai.contains('2') }">checked</c:if>>否<br>
	课程类别:
		<select name="tid">
			<option value="">请选择</option>
			<c:forEach items="${tlist }" var="t">
				<option value="${t.yid }"<c:if test="${t.yid==course.tid }">selected</c:if>>${t.tname }</option>
			</c:forEach>
		</select><br>
	流程封面:
		<img alt="qwe" src="/photo/${course.img }" width="100px" height="100px">
		<input type="file" name="picFile">
		<input type="hidden" name="img" value="${course.img }"><br>
	<input type="submit" value="提交">
	<input type="reset" value="重置">
</form>
</body>
</html>