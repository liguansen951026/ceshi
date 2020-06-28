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
	function checkName() {
		var cname = $("#cname").val();
		if (cname==null || cname=='') {
			$("#msg_cname").html("用户名不能为空");
			return false;
		} else {
			$.ajax({
				type:'post',
				url:'${pageContext.request.contextPath }/course/checkName.do',
				data:'cname='+cname,
				success:function(data){
					$("#msg_cname").html(data);
				}
			});
		}
	}
	function checkForm() {
		var cname = $("#cname").val();
		if (cname==null || cname=='') {
			return false;
		}
		var price = $("#price").val();
		if (price==null || price=='') {
			return false;
		}
		var tai = $("#tai").val();
		if (tai==null || tai=='') {
			return false;
		}
		var tid = $("#tid").val();
		if (tid==null || tid=='') {
			return false;
		}
		var picFile = $("#picFile").val();
		if (picFile==null || picFile=='') {
			return false;
		}
	}
</script>
</head>
<body>
<form action="${pageContext.request.contextPath }/course/add.do" method="post" enctype="multipart/form-data" onsubmit="return checkForm()">
	课程名称:<input name="cname" id="cname" onblur="checkName()"><span id="msg_cname"></span><br>
	课程价格:<input name="price" id="price"><br>
	是否有效:
		<input type="radio" name="tai" value="1" id="tai">是
		<input type="radio" name="tai" value="2" id="tai">否<br>
	课程类别:
		<select name="tid" id="tid">
			<option value="">请选择</option>
			<c:forEach items="${tlist }" var="t">
				<option value="${t.yid }">${t.tname }</option>
			</c:forEach>
		</select><br>
	流程封面:
		<input type="file" name="picFile" id="picFile"><br>
	<input type="submit" value="提交">
	<input type="reset" value="重置">
</form>
</body>
</html>