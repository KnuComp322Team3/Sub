<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page language="java" import="java.text.*,java.sql.*"%>
<html>

  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>아이템 상세정보</title>

    <!-- Bootstrap core CSS-->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Page level plugin CSS-->
    <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet">

  </head>
  
	
  <body id="page-top">

    <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

      <a class="navbar-brand mr-1" href="index.jsp">물품 상세보기</a>

      <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      </button>

      <!-- Navbar Search -->
      <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
        
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
						<a class="dropdown-item" href="stock.jsp">구매내역</a>
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
			<li class="nav-item"><a class="nav-link" href="shoppingbag.jsp">
					<i class="fas fa-fw fa-folder"></i> <span>장바구니</span>
			</a></li>

			<li class="nav-item"><a class="nav-link" href="tables.jsp">
					<i class="fas fa-fw fa-table"></i> <span>상품 목록</span>
			</a></li>
		</ul>

      <div id="content-wrapper">

        <div class="container-fluid">

<%
			String serverIP="localhost";
			String portNum = "3306";
			String url = "jdbc:mysql://"+serverIP+":"+portNum+"/dbpro?useSSL=false";
			String user = "knu";
			String pass = "comp322";
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs;
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, pass);
			String product_number = "";
			try {
				Class.forName("com.mysql.jdbc.Driver");//JDBC_DRIVER); 
				//Class 클래스의 forName()함수를 이용해서 해당 클래스를 메모리로 로드 하는 것입니다.
				//URL, ID, password를 입력하여 데이터베이스에 접속합니다.
				conn = DriverManager.getConnection(url, user, pass);
				conn.setAutoCommit(false);
				
			 	product_number = (request.getParameter("product_number") == null) ? "" : request.getParameter("product_number");
			 	//section = request.getParameter("section");
			 	String query="";
		 		query = "select I.Product_number,I.Item_name,I.Item_spec, I.Item_price, B.Brand_name, C.Section " + 
					"		from ITEM I, BRAND B, CATEGORY C "+
					"		where I.Brand_number = B.Brand_number "+
					"		AND C.Category_number = I.Category_number " +
					" 		AND I.Product_number = ? " +
					"		ORDER BY I.Product_number ASC";        		
		 	        		
       			pstmt = conn.prepareStatement(query);
           		pstmt.setString(1,product_number);
            	rs = pstmt.executeQuery(); 		

		

		//out.println():print out given text to the current HTML doucment.
	
				ResultSetMetaData rsmd = rs.getMetaData();
				int cnt = rsmd.getColumnCount();
				out.println("<tbody>");
				while (rs.next()){%>
		<!-- Default dropright button -->
		<div  class="card text-center" style="width: 30rem;" >
		  <img class="card-img-top" src="item01.png" ><!-- src="/Subject/img/item01.png" ><!--alt="Card image cap"-->
		  <div class="card-body">
		    <h5 class="card-title"><% out.println(rs.getString(2));%></h5>
		    <p class="card-text">이 상품은 <% out.println(rs.getString(2));%>입니다</p>
		  </div>
		  <ul class="list-group list-group-flush">
		    <li class="list-group-item">상품코드 <% out.println(rs.getString(1));%></li>
		    <li class="list-group-item">상품규격 <% out.println(rs.getString(3));%></li>
		    <li class="list-group-item">가격 <% out.println(rs.getString(4));%>원</li>
		    <li class="list-group-item">브랜드 <% out.println(rs.getString(5));%></li>
		  </ul>
		  <%
				}
		        pstmt.executeQuery();
	            conn.commit(); 
		      	} catch (ClassNotFoundException | SQLException sqle) {
		             // 오류시 롤백
		             conn.rollback(); 
		             
		             throw new RuntimeException(sqle.getMessage());
		        } finally {
		             // Connection, PreparedStatement를 닫는다.
			        try{
			             if ( pstmt != null ){ pstmt.close(); pstmt=null; }
			             if ( conn != null ){ conn.close(); conn=null;    }
			        }catch(Exception e){
			        throw new RuntimeException(e.getMessage());
			        }
		        }
         
		%>
		<form method="GET" action="shoppingbag.jsp" name="userInfo" onsubmit ="return checkValue()"  >
          <div class="card-body">
            <div class="form-group">
              <div class="form-row">
                <div class="col-md-4">
               		<select class="custom-select custom-select mb-2" name="product_number">
					  <option selected value=<% out.println(product_number); %>><% out.println(product_number); %></option>
					</select>
				</div>
				
				<div class="col-md-4">
				
		      		<input class="form-control" type="number" name="orderAmount" min="1" max="10000000" placeholder="수량 입력">
		      	</div>
		      	<div class="col-md-4">
		      	  <div class="input-group-append">
		      		<input type="submit" name="amountMethod" style="height:40px" value="add">
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		</form> 
		  
		</div>
					
      </div>
      <!-- /.content-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">��</span>
            </button>
          </div>
          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="login.jsp">Logout</a>
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
