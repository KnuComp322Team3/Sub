<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>

  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin - Register</title>

    <!-- Bootstrap core CSS-->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet">

	<script type="text/javascript">
    
        // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
        function checkValue()
        {
            if(!document.userInfo.id.value){
                alert("아이디를 입력하세요.");
                return false;
            }
            
            if(!document.userInfo.password.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
            
            // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
            if(document.userInfo.password.value != document.userInfo.passwordcheck.value ){
                alert("비밀번호를 동일하게 입력하세요.");
                return false;
            }
        }
    </script>

  </head>

  <body class="bg-dark">

    <div class="container">
      <div class="card card-register mx-auto mt-5">
        <div class="card-header">Register an Account</div>
        <div class="card-body">
          <form method="POST" action="/user/JoinPro.jsp" name="userInfo" onsubmit ="return checkValue()">
            <div class="form-group">
              <div class="form-row">
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input type="text" name="id" id="id" maxlength="9" class="form-control" placeholder="ID" required="required" autofocus="autofocus">
                    <label for="id">ID*</label>
                  </div>
                </div>
                <div class="btn-group btn-group-toggle" data-toggle="buttons">
				  <label class="btn btn-secondary active">
				    <input type="radio" name="options" id="option1" autocomplete="off" checked> NULL
				  </label>
				  <label class="btn btn-secondary">
				    <input type="radio" name="options" id="option2" autocomplete="off"> MALE
				  </label>	
				  <label class="btn btn-secondary">
				    <input type="radio" name="options" id="option3" autocomplete="off"> FEMALE
				  </label>
				</div>
              </div>
            </div>
            <div class="form-group">
              <div class="form-row">
                <div class="col-md-12">
                  <div class="form-label-group">
                    <input type="password" name = "password" id="inputPassword" maxlength = "20" class="form-control" placeholder="Password" required="required">
                    <label for="inputPassword">Password*</label>
                  </div>
                </div>
               </div>
            </div>
             <div class="form-group">
              <div class="form-row">
                <div class="col-md-12">
                  <div class="form-label-group">
                    <input type="password" name="passwordcheck" id="confirmPassword" maxlength = "20" class="form-control" placeholder="Confirm password" required="required">
                    <label for="confirmPassword">Confirm password*</label>
                  </div>
                </div>
              </div>
            </div>
            <div class="form-group">
              <div class="form-row">
                 <div class="col-md-12">
                  <div class="form-label-group">
                    <input type="text" name="address" id="address" maxlength="30" class="form-control" placeholder="Address" required="required">
                    <label for="address">Address*</label>
                  </div>
                </div>
              </div>
            </div>
            <a class="btn btn-primary btn-block" href="login.jsp">Register</a>
          </form>
          <div class="text-center">
            <a class="d-block small mt-3" href="login.jsp">Login Page</a>
            <a class="d-block small" href="forgot-password.jsp">Forgot Password?</a>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  </body>

</html>
