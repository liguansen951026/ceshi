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
<script type="text/javascript">
	function jump(page) {
		var pages= ${page.pages};
		if (page>=1 && page<=pages) {
			document.getElementById("pn").value=page;
			document.getElementById("form").submit();
		}
	}
</script>
</head>
<body>
<a href="${pageContext.request.contextPath }/course/toadd.do">添加</a>
<form action="${pageContext.request.contextPath }/course/findAll.do" method="post" id="form">
	<input type="hidden" name="pageNum" id="pn">

课程名称:<input name="cname" value="${course.cname }"><input type="submit" value="查询">


	<table border="1" cellspacing="0">
		<tr>
			<td>ID</td>
			<td>课程名称</td>
			<td>课程价格</td>
			<td>课程类别</td>
			<td>课程封面</td>
			<td>课程状态</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${page.list }" var="c">
			<tr>
				<td>${c.cid }</td>
				<td>${c.cname }</td>
				<td>${c.price }</td>
				<td>${c.type.tname }</td>
				<td>
					<img alt="qwe" src="/photo/${c.img }" width="100px" height="100px">
				</td>
				<td>
					<c:if test="${c.tai.contains('1') }">有效</c:if>
					<c:if test="${c.tai.contains('2') }">无效</c:if>
				</td>
				<td>
					<a href="${pageContext.request.contextPath }/course/findById.do?cid=${c.cid}">修改</a>
					<a onclick="return confirm('确定将此记录删除属?')" href="${pageContext.request.contextPath }/course/deleteById.do?cid=${c.cid}">删除</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	<input type="button" onclick="jump(${page.firstPage})" value="首页">
	<input type="button" onclick="jump(${page.prePage})" value="上一页">
	<input type="button" onclick="jump(${page.nextPage})" value="下一页">
	<input type="button" onclick="jump(${page.lastPage})" value="尾页">
	当前页/共：${page.pageNum }/${page.pages }
</form>
</body>
</html>