<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>

  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>회원가입</title>

    <!-- Bootstrap core CSS-->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template-->
    <link href="../css/sb-admin.css" rel="stylesheet">

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
        
          <form method="POST" action="./JoinPro.jsp" name="userInfo" onsubmit ="return checkValue()">
            <div class="form-group">
              <label>*는 필수 입력 사항입니다.</label>
              <div class="form-row">
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input type="text" name="id" id="id" maxlength="9" class="form-control" placeholder="ID" required="required" autofocus="autofocus">
                    <label for="id">ID*</label>
                  </div>
                </div>
                 <div class="col-md-6">
                  <div class="form-label-group">
                    <input type="text" name="phone" id="phone" maxlength="20" class="form-control" placeholder="Phone number" required="required">
                    <label for="phone">Phone number*</label>
                  </div>
                </div>
              </div>
            </div>
             <div class="form-group">
              <div class="form-row">
                <div class="col-md-6">
                  <div class="form-label-group">
                    <input type="text" name="name" id="name" maxlength="15" class="form-control" placeholder="Name" required="required" >
                    <label for="name">Name</label>
                  </div>
                </div>
                 <div class="col-md-6">
                  <div class="form-label-group">
                    <input type="text" name="job" id="job" maxlength="15" class="form-control" placeholder="Job" required="required">
                    <label for="job">Job</label>
                  </div>
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
            <div class="form-group">
              <div class="form-row">
                 <div class="col-md-4">
               		<select class="custom-select custom-select-lg mb-3">
						  <option selected value="Null">Sex</option>
						  <option value="M">Male</option>
						  <option value="F">Female</option>
					</select>
                  </div>
                  <div class="col-md-4">
               		<select class="custom-select custom-select-lg mb-3">
						  <option selected value="Null">Age</option>
						  <option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option>
						  <option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option>
						  <option value="30">30</option><option value="31">31</option><option value="33">33</option><option value="33">33</option><option value="34">34</option><option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option>
						  <option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option><option value="44">44</option><option value="45">45</option><option value="46">46</option><option value="47">47</option><option value="48">48</option><option value="49">49</option>
						  <option value="50">50</option><option value="51">51</option><option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option>
						  <option value="60">60</option><option value="61">61</option><option value="62">62</option><option value="63">63</option><option value="64">64</option><option value="65">65</option><option value="66">66</option><option value="67">67</option><option value="68">68</option><option value="69">69</option>
						  <option value="70">70</option><option value="71">71</option><option value="72">72</option><option value="73">73</option><option value="74">74</option><option value="75">75</option><option value="76">76</option><option value="77">77</option><option value="78">78</option><option value="79">79</option>
						  <option value="80">80</option><option value="81">81</option><option value="82">82</option><option value="83">83</option><option value="84">84</option><option value="85">85</option><option value="86">86</option><option value="87">87</option><option value="88">88</option><option value="89">89</option>
						  <option value="90">90</option><option value="91">91</option><option value="92">92</option><option value="93">93</option><option value="94">94</option><option value="95">95</option><option value="96">96</option><option value="97">97</option><option value="98">98</option><option value="99">99</option>
						  <option value="100">100</option>
					</select>
                  </div>
                  <div class="col-md-4">
               		<select class="custom-select custom-select-lg mb-3">
						  <option selected value="NULL">Type</option>
						  <option value="retailer">Retailer</option>
						  <option value="wholesaler">Wholesaler</option>
					</select>
                  </div>
                </div>
              </div>
              <a class="btn btn-primary btn-block" href="JoinPro.jsp">Register</a>
               <div class="text-center" >
	            <a class="d-block small mt-3" href="LoginForm.jsp">Login Page</a>
	            <a class="d-block small" href="forgot-password.jsp">Forgot Password?</a>
            </div> 
           </form> 
          </div>
        </div>
      </div>
               
    

    <!-- Bootstrap core JavaScript-->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

  </body>

</html>
