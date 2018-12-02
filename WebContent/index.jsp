<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page language="java" import="java.text.*,java.sql.*"%>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>COMP322-Team3</title>

<!-- Bootstrap core CSS-->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">

<!-- Page level plugin CSS-->
<link href="vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin.css" rel="stylesheet">

</head>

<body id="page-top">
	<%
		//alert(session.getAttribute("SessionID"));
		String id = "";
		id = (String) session.getAttribute("sessionID"); // request에서 id 파라미터를 가져온다
		if (id == null || id.equals("")) { // id가 Null 이거나 없을 경우
			response.sendRedirect("/Subject/user/login.jsp"); // 로그인 페이지로 리다이렉트 한다.
		}
	%>




	<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

		<a class="navbar-brand mr-1" href="index.jsp">COMP322-Team3</a>

		<button class="btn btn-link btn-sm text-white order-1 order-sm-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>

		<!-- Navbar Search -->
		<form
			class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
			<div class="input-group">

				<div class="input-group-append">

					</button>
				</div>
			</div>
		</form>

		<!-- Navbar -->
		<ul class="navbar-nav ml-auto ml-md-0">

			<li class="nav-item dropdown no-arrow"><a
				class="nav-link dropdown-toggle" href="#" id="userDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-user-circle fa-fw"></i>
			</a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">
					<a class="dropdown-item" href="/Subject/user/change.jsp">회원정보
						수정</a>
					<%
						session.getAttribute("sessionID");
					%>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#" data-toggle="modal"
						data-target="#logoutModal">로그아웃</a>
				</div></li>
		</ul>

	</nav>

	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="sidebar navbar-nav">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>상품추천&카테고리</span>
			</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-fw fa-folder"></i> <span>쇼핑백</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<h6 class="dropdown-header">Login Screens:</h6>
					<a class="dropdown-item" href="login.jsp">Login</a> <a
						class="dropdown-item" href="register.jsp">Register</a> <a
						class="dropdown-item" href="forgot-password.jsp">Forgot
						Password</a>
					<div class="dropdown-divider"></div>
					<h6 class="dropdown-header">Other Pages:</h6>
					<a class="dropdown-item" href="404.jsp">404 Page</a> <a
						class="dropdown-item" href="blank.jsp">Blank Page</a>
				</div></li>
			<!--  
        <li class="nav-item">
          <a class="nav-link" href="charts.jsp">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>Charts</span></a>
        </li>
        -->
			<li class="nav-item"><a class="nav-link" href="tables.jsp">
					<i class="fas fa-fw fa-table"></i> <span>상품 목록</span>
			</a></li>
		</ul>

		<div id="content-wrapper">

			<div class="container-fluid">

				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<!--  <li class="breadcrumb-item">
              <a href="index.jsp">Home</a>
            </li> -->
					<!--  <li class="breadcrumb-item active">Recommendation</li> -->
					<!-- DataTables Example -->
					<div class="card mb-3">
						<div class="card-header">
							<i class="fas fa-table"></i> 추천 상품목록
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>Item name</th>
											<th>Product number</th>
											<th>Number of order</th>
										</tr>
									</thead>
									<%
										String serverIP = "localhost";
										String portNum = "3306";
										String url = "jdbc:mysql://" + serverIP + ":" + portNum + "/dbpro?useSSL=false";
										String user = "knu";
										String pass = "comp322";
										Connection conn = null;
										PreparedStatement pstmt = null;
										ResultSet rs;
										Class.forName("com.mysql.jdbc.Driver");
										conn = DriverManager.getConnection(url, user, pass);

										try {
											Class.forName("com.mysql.jdbc.Driver");//JDBC_DRIVER); 
											//Class 클래스의 forName()함수를 이용해서 해당 클래스를 메모리로 로드 하는 것입니다.
											//URL, ID, password를 입력하여 데이터베이스에 접속합니다.
											conn = DriverManager.getConnection(url, user, pass);
											conn.setAutoCommit(false);
											String query = "";
											query = "SELECT it.Item_name, it.Product_number, COUNT(ic.Product_number) AS NumberOfOrder "
													+ "FROM INCLUDE ic, ITEM it " + "WHERE ic.Product_number= it.Product_number "
													+ "AND ic.Id IN(SELECT Id FROM INCLUDE GROUP BY Id HAVING COUNT(Id) > 6) "
													+ "GROUP BY ic.Product_number " + "ORDER BY COUNT(ic.Product_number) DESC limit 0,1";
											pstmt = conn.prepareStatement(query);
											rs = pstmt.executeQuery();

											//out.println():print out given text to the current HTML doucment.

											ResultSetMetaData rsmd = rs.getMetaData();
											int cnt = rsmd.getColumnCount();
											out.println("<tbody>");
											while (rs.next()) {
												out.println("<tr>");
												out.println("<td>" + rs.getString(1) + "</td>");
												out.println("<td>" + rs.getString(2) + "</td>");
												out.println("<td>" + rs.getString(3) + "</td>");
												//out.println("<td>"+rs.getString(4)+"</td>");
												//out.println("<td>"+rs.getString(5)+"</td>");
												//out.println("<td><form class=\"td\" method=\"GET\" action=\"iteminfo.jsp\" > <input type=\"submit\" name=\"product_number\" value=\""+rs.getString(1)+"\"/></form></td>");
												out.println("</tr>");
											}
											out.println("</tbody>");
											pstmt.executeQuery();
											conn.commit();
										} catch (ClassNotFoundException | SQLException sqle) {
											// 오류시 롤백
											conn.rollback();

											throw new RuntimeException(sqle.getMessage());
										} finally {
											// Connection, PreparedStatement를 닫는다.
											try {
												if (pstmt != null) {
													pstmt.close();
													pstmt = null;
												}
												if (conn != null) {
													conn.close();
													conn = null;
												}
											} catch (Exception e) {
												throw new RuntimeException(e.getMessage());
											}
										}
									%>
								</table>
							</div>
						</div>
					</div>
				</ol>


				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<!--  <li class="breadcrumb-item">
              <a href="index.jsp">Home</a>
            </li> -->
					<div>
						<li >Category</li>
						<br><br>
					</div>

					<form action="tables.jsp" method="GET">
						<div class="btn-group dropright">
							<button type="button"
								class="btn btn-secondary btn-lg dropdown-toggle"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">철물,원예,사무용품</button>
							<div class="dropdown-menu">
								<!-- Dropdown menu links -->
								<h2 class="dropdown-header">철물(중분류)</h2>
								<input type="submit" class="dropdown-item" name="section"
									value="삽"> <input type="submit" class="dropdown-item"
									name="section" value="못"> <input type="submit"
									class="dropdown-item" name="section" value="열쇠">
								<h2 class="dropdown-header">사무,레져(중분류)</h2>
								<input type="submit" class="dropdown-item" name="section"
									value="다용도칼"> <input type="submit"
									class="dropdown-item" name="section" value="자석"> <input
									type="submit" class="dropdown-item" name="section" value="필기구">
							</div>
						</div>
					</form>

				</ol>
				<!-- Default dropright button -->
				<form action="tables.jsp" method="GET">
					<div class="btn-group dropright">
						<button type="button"
							class="btn btn-secondary btn-lg dropdown-toggle"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							철물,원예,사무용품</button>
						<div class="dropdown-menu">
							<!-- Dropdown menu links -->
							<h2 class="dropdown-header">철물(중분류)</h2>
							<input type="submit" class="dropdown-item" name="section"
								value="삽"> <input type="submit" class="dropdown-item"
								name="section" value="못"> <input type="submit"
								class="dropdown-item" name="section" value="열쇠">
							<h2 class="dropdown-header">사무,레져(중분류)</h2>
							<input type="submit" class="dropdown-item" name="section"
								value="다용도칼"> <input type="submit" class="dropdown-item"
								name="section" value="자석"> <input type="submit"
								class="dropdown-item" name="section" value="필기구">
						</div>
					</div>
				</form>
			</div>
			<!-- /.content-wrapper -->

		</div>
		<!-- /#wrapper -->

		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fas fa-angle-up"></i>
		</a>

		<!-- Logout Modal-->
		<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">경고</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">x</span>
						</button>
					</div>
					<div class="modal-body">정말 로그아웃 하시겠습니까?</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button"
							data-dismiss="modal">취소</button>
						<a class="btn btn-primary" href="/Subject/user/logout.jsp">로그아웃</a>
					</div>
				</div>
			</div>
		</div>

		<!-- Bootstrap core JavaScript-->
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

		<!-- Core plugin JavaScript-->
		<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

		<!-- Page level plugin JavaScript-->
		<script src="vendor/chart.js/Chart.min.js"></script>
		<script src="vendor/datatables/jquery.dataTables.js"></script>
		<script src="vendor/datatables/dataTables.bootstrap4.js"></script>

		<!-- Custom scripts for all pages-->
		<script src="js/sb-admin.min.js"></script>

		<!-- Demo scripts for this page-->
		<script src="js/demo/datatables-demo.js"></script>
		<script src="js/demo/chart-area-demo.js"></script>
</body>

</html>
