<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
    
<%-- �ڹٺ� Ŭ���� import --%>      
<%@ page import="jsp.member.model.MemberBean" %>  
<%-- DAO import --%>   
<%@ page import="jsp.member.model.MemberDAO" %> 
 
<html>
<head>
    <title>ȸ������ �� JSP</title>
    
    <!-- css ���� �и� -->
    <link href='../../css/join_style.css' rel='stylesheet' style='text/css'/>
    
</head>
<body>
	<jsp:useBean id="memberBean" class="jsp.member.model.MemberBean" />
	<jsp:setProperty property="*" name="memberBean" />
 	<%
		MemberDAO dao = MemberDAO.getInstance();

		// ȸ�������� ����ִ� memberBean�� dao�� insertMember() �޼���� �ѱ��.
		// insertMember()�� ȸ�� ������ JSP_MEMBER ���̺� �����Ѵ�.
		dao.changeData(memberBean);

	%>
	<script type="text/javascript">
	alert("���� �Ϸ�");
	</script>
	
	
</body>
</html>


