<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %> <!-- login 함수를 사용하여 로그인 처리를 하기 위해 user패키지의 UserDAO를 불러온다 -->
<%@ page import="java.io.PrintWriter" %> <!-- 자바 스크립트 문장을 작성하기 위해 사용-->
<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 모든 데이터를 UTF-8으로 받을 수 있도록 함 -->
<jsp:useBean id="currentuserdao" class="OtherUser.OtherUserDAO" scope="page"/> <!-- 한명의 회원 정보를 담는 User클래스를 자바 빈즈로 사용하며 현재 page안에서만 빈즈를 사용 -->
<jsp:setProperty name="currentuserdao" property="userPhoneNumber" />
<jsp:setProperty name="currentuserdao" property="userChargedFee" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>chargeFeeAction</title>
</head>
<body>
	<% 
		System.out.println("in chargeFeeAction.jsp");
		System.out.println(currentuserdao.getUserPhoneNumber());
		currentuserdao.chargeFee(currentuserdao.getUserPhoneNumber(), currentuserdao.getUserChargedFee());
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Successfully charge fee')");
		script.println("history.back()");
		script.println("</script>");
	%>

</body>
</html>