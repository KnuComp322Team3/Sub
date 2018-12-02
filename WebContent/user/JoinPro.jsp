<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%-- 자바빈 클래스 import --%>
<%@ page import="jsp.member.model.MemberBean"%>
<%-- DAO import --%>
<%@ page import="jsp.member.model.MemberDAO"%>

<html>
<head>
<title>회원가입 처리 JSP</title>

<!-- css 파일 분리 -->
<link href='../../css/join_style.css' rel='stylesheet' style='text/css' />

</head>
<body>
	<%
		// 한글 깨짐을 방지하기 위한 인코딩 처리
		request.setCharacterEncoding("utf-8");
	%>

	<jsp:useBean id="memberBean" class="jsp.member.model.MemberBean" />
	<jsp:setProperty property="*" name="memberBean" />

	<%
		MemberDAO dao = MemberDAO.getInstance();

		String id= request.getParameter("id");
		 int check = dao.duplicateCheck(id);
	        
	        // URL 및 로그인관련 전달 메시지
	        String msg = "";
	        
	        if(check == 1)    // 로그인 성공
	        { 
	            // 중복된 아이디가 있을 경우
	            msg="duplicate.jsp";
	            response.sendRedirect(msg);

	        }
	        else    // 중복된 아이디가 없을 경우
	        {
	        	dao.insertMember(memberBean);
	        }
	         
	        // sendRedirect(String URL) : 해당 URL로 이동
	        // URL뒤에 get방식 처럼 데이터를 전달가능
	        
		// 회원정보를 담고있는 memberBean을 dao의 insertMember() 메서드로 넘긴다.
		// insertMember()는 회원 정보를 JSP_MEMBER 테이블에 저장한다.
	%>
	<script type="text/javascript">
		alert("회원가입 완료");
		location.href = "../index.jsp";
	</script>

</body>
</html>


