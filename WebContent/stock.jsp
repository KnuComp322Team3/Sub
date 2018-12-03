<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page language="java" import="java.text.*,java.sql.*"%>
<html>

<head>
<%
	//alert(session.getAttribute("SessionID"));
	String id = "";
	id = (String) session.getAttribute("sessionID"); // request에서 id 파라미터를 가져온다
	if (id == null || id.equals("")) { // id가 Null 이거나 없을 경우
		response.sendRedirect("/Subject/user/login.jsp"); // 로그인 페이지로 리다이렉트 한다.
	}
%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Stock Manager</title>

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

	<nav class="navbar navbar-expand navbar-dark bg-dark static-top">


		<a class="navbar-brand mr-1" href="indexAdmin.jsp">관리자</a>

		<button class="btn btn-link btn-sm text-white order-1 order-sm-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>

		<!-- Navbar Search -->
		<form
			class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="Search for..."
					aria-label="Search" aria-describedby="basic-addon2">
				<div class="input-group-append">
					<button class="btn btn-primary" type="button">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
		</form>

		<!-- Navbar -->
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item dropdown no-arrow mx-1"><a
				class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <span
					class="badge badge-danger">9+</span>
			</a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="alertsDropdown">
					<a class="dropdown-item" href="#">Action</a> <a
						class="dropdown-item" href="#">Another action</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Something else here</a>
				</div></li>
			<li class="nav-item dropdown no-arrow mx-1"><a
				class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-envelope fa-fw"></i> <span
					class="badge badge-danger">7</span>
			</a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="messagesDropdown">
					<a class="dropdown-item" href="#">Action</a> <a
						class="dropdown-item" href="#">Another action</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Something else here</a>
				</div></li>
			<li class="nav-item dropdown no-arrow"><a
				class="nav-link dropdown-toggle" href="#" id="userDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-user-circle fa-fw"></i>
			</a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">
					<a class="dropdown-item" href="#">Settings</a> <a
						class="dropdown-item" href="#">Activity Log</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#" data-toggle="modal"
						data-target="#logoutModal">Logout</a>
				</div></li>
		</ul>

	</nav>

	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="sidebar navbar-nav">
			<li class="nav-item"><a class="nav-link" href="indexAdmin.jsp">
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>관리자</span>
			</a></li>
			<!-- <li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-fw fa-folder"></i> <span>Pages</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<h6 class="dropdown-header">Login Screens:</h6>
					<a class="dropdown-item" href="/Subject/user/login.jsp">Login</a> <a
						class="dropdown-item" href="register.jsp">Register</a> <a
						class="dropdown-item" href="forgot-password.jsp">Forgot
						Password</a>
					<div class="dropdown-divider"></div>
					<h6 class="dropdown-header">Other Pages:</h6>
					<a class="dropdown-item" href="404.jsp">404 Page</a> <a
						class="dropdown-item" href="blank.jsp">Blank Page</a>
				</div></li> -->
			<li class="nav-item active"><a class="nav-link" href="stock.jsp">
					<i class="fas fa-fw fa-table"></i> <span>재고관리</span>
			</a></li>
		</ul>

		<div id="content-wrapper">

			<div class="container-fluid">

				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> 재고현황
					</div>

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

							String stockMethod = (request.getParameter("stockMethod") == null) ? ""
									: request.getParameter("stockMethod");
							String itemAmount = (request.getParameter("itemAmount") == null) ? ""
									: request.getParameter("itemAmount");
							if (stockMethod.equals("add") && (!itemAmount.equals(""))) {
								//이 물품이 장바구니에 있을때
								if (Integer.parseInt(request.getParameter("itemAmount")) != 0) {
									pstmt = conn
											.prepareStatement("update ITEM set Item_amount=Item_amount + ? WHERE Product_number=?");
									pstmt.setString(1, request.getParameter("itemAmount"));
									pstmt.setString(2, request.getParameter("product_number"));
									System.out.println("add");
									pstmt.executeUpdate();
								}
							}
							if (stockMethod.equals("sub") && (!itemAmount.equals(""))) {
								//이 물품이 장바구니에 없을때				        
								pstmt = conn.prepareStatement("update ITEM set Item_amount=Item_amount - ? WHERE Product_number=?");
								pstmt.setString(1, request.getParameter("itemAmount"));
								pstmt.setString(2, request.getParameter("product_number"));
								System.out.println("sub");
								pstmt.executeUpdate();
							}

							//conn.commit();

							conn.commit();
						} catch (ClassNotFoundException | SQLException sqle) {
							// 오류시 롤백
							conn.rollback();
							out.println(
									"<script type=\"text/javascript\">alert(\"재고 추가 실패 - 재고 등을 확인해주세요\");location.href = \"./stock.jsp\";</script>");
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
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>Product Number</th>
										<th>Item Name</th>
										<th>Item Spec</th>
										<th>Item Price</th>
										<th>Stock Amount</th>
										<th>Brand</th>
										<th>주문 수량 변경</th>
									</tr>
								</thead>
								<%
									try {
										Class.forName("com.mysql.jdbc.Driver");//JDBC_DRIVER); 
										//Class 클래스의 forName()함수를 이용해서 해당 클래스를 메모리로 로드 하는 것입니다.
										//URL, ID, password를 입력하여 데이터베이스에 접속합니다.
										conn = DriverManager.getConnection(url, user, pass);
										conn.setAutoCommit(false);
										String query = "";

										query = "select I.Product_number,I.Item_name,I.Item_spec, I.Item_price, I.Item_amount, B.Brand_name "
												+ "		from ITEM I, BRAND B " + "		where I.Brand_number = B.Brand_number "
												+ "		ORDER BY I.Product_number ASC ";

										pstmt = conn.prepareStatement(query);

										rs = pstmt.executeQuery();

										//out.println():print out given text to the current HTML doucment.

										ResultSetMetaData rsmd = rs.getMetaData();
										int cnt = rsmd.getColumnCount();
										out.println("<tbody>");
										while (rs.next()) {
											out.println("<tr><form class=\"tr\" method=\"GET\" action=\"stock.jsp\" >");
											out.println("<td><input class=\"badge badge-pill badge-light\" name = \"product_number\" value=\""
													+ rs.getString(1) + "\"/>" + rs.getString(1) + "</td>");
											out.println("<td>" + rs.getString(2) + "</td>");
											out.println("<td>" + rs.getString(3) + "</td>");
											out.println("<td>" + rs.getString(4) + "</td>");
											out.println("<td>" + rs.getString(5) + "</td>");
											out.println("<td>" + rs.getString(6) + "</td>");
											//수정 버튼
											out.println("<td>");
											out.println(
													"<input class=\"form-control\" type=\"number\" name=\"itemAmount\"  value=\"0\" min=\"0\" max=\"10000000\">");

											out.println(
													"<input class=\"btn btn-primary\" type=\"submit\" name=\"stockMethod\" value=\"add\"/>");
											out.println(
													"<input class=\"btn btn-primary\" type=\"submit\" name=\"stockMethod\" value=\"sub\"/></td></form>");

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
			</div>
			<!-- /.container-fluid -->



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
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">로그아웃</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="/Subject/user/login.jsp">Logout</a>
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
	<script src="vendor/datatables/jquery.dataTables.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin.min.js"></script>

	<!-- Demo scripts for this page-->
	<script src="js/demo/datatables-demo.js"></script>

</body>

</html>
