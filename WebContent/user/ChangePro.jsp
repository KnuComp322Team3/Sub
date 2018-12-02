<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
    
<%-- 자바빈 클래스 import --%>      
<%@ page import="jsp.member.model.MemberBean" %>  
<%-- DAO import --%>   
<%@ page import="jsp.member.model.MemberDAO" %> 
 
<html>
<head>
    <title>회원정보 수 JSP</title>
    
    <!-- css 파일 분리 -->
    <link href='../../css/join_style.css' rel='stylesheet' style='text/css'/>
    
</head>
<body>
	<jsp:useBean id="memberBean" class="jsp.member.model.MemberBean" />
	<jsp:setProperty property="*" name="memberBean" />
 	<%
		MemberDAO dao = MemberDAO.getInstance();

		// 회원정보를 담고있는 memberBean을 dao의 insertMember() 메서드로 넘긴다.
		// insertMember()는 회원 정보를 JSP_MEMBER 테이블에 저장한다.
		dao.changeData(memberBean);

	%>
	<script type="text/javascript">
	alert("수정 완료");
	</script>
	
	
</body>
</html>


