<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
    
<%-- 자바빈 클래스 import --%>      
<%@ page import="jsp.member.model.MemberBean" %>  
<%-- DAO import --%>   
<%@ page import="jsp.member.model.MemberDAO" %> 
 
<html>
<head>
    <title>회원가입 처리 JSP</title>
    
    <!-- css 파일 분리 -->
    <link href='../../css/join_style.css' rel='stylesheet' style='text/css'/>
    
</head>
<body>
    <%-- JoinForm.jsp에서 입력한 정보를 넘겨 받아 처리한다. --%>
    <% 
        // 한글 깨짐을 방지하기 위한 인코딩 처리
        request.setCharacterEncoding("euc-kr"); 
    %>
    
    <%-- 자바빈 관련 액션태그 사용 --%>
    <jsp:useBean id="memberBean" class="jsp.member.model.MemberBean" />
    <jsp:setProperty property="*" name="memberBean"/>    
    
    <%
        MemberDAO dao = MemberDAO.getInstance();
    
        // 회원정보를 담고있는 memberBean을 dao의 insertMember() 메서드로 넘긴다.
        // insertMember()는 회원 정보를 JSP_MEMBER 테이블에 저장한다.
        dao.insertMember(memberBean);
    %>
    <script type="text/javascript">
    
    
        //버튼 클릭시 회원정보 수정 화면으로 이동
        function goChangeForm() {
            location.href="ChangeForm.jsp";
        }    
    </script>
    <div id="wrap">
        <br><br>
        <b><font size="5" color="gray">회원가입 정보를 확인하세요.</font></b>
        <br><br>
        <font color="blue"><%=memberBean.getId() %></font>님 가입을 축하드립니다.
        <br><br>
        
        <%-- 자바빈에서 입력된 값을 추출한다. --%>
        <table>
            <tr>
                <td id="title">아이디</td>
                <td><%=memberBean.getId() %></td>
            </tr>
                        
            <tr>
                <td id="title">비밀번호</td>
                <td><%=memberBean.getPassword() %></td>
            </tr>
                    

            <tr>
                <td id="title">주소</td>
                <td>
                    <%=memberBean.getAddress() %>
                </td>
            </tr>
                    
            <tr>
                <td id="title">휴대전화</td>
                <td><%=memberBean.getPhone() %></td>
            </tr>
            
            <tr>
                <td id="title">성별</td>
                <td><%=memberBean.getGender()%></td>
            </tr>
            
            <tr>
                <td id="title">나이</td>
                <td>
                    <%=memberBean.getAge() %>
                </td>
            </tr>
            <tr>
                <td id="title">이름</td>
                <td>
                    <%=memberBean.getName() %>
                </td>
            </tr>
            
            <tr>름
                <td id="title">직업</td>
                <td>
                    <%=memberBean.getJob() %>
                </td>
            </tr>                       
            <tr>
                <td id="title">타입</td>
                <td>
                    <%=memberBean.getType() %>
                </td>
            </tr>
            <tr>
                <td id="title">배송회사</td>
                <td>
                    <%=memberBean.getShipcom_number() %>
                </td>
            </tr>                  
                    
                    
                    

        </table>
        
        <br>
        <input type="button" value="확인"> <input type="button" value="회원정보 수정" onclick="goChangeForm()">
    </div>
</body>
</html>


