<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://kit.fontawesome.com/cc658ecbd6.js" crossorigin="anonymous"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3fb5a3b00f6c3e99f36852eb9c9e615b"></script>
<script>
      function sample6_execDaumPostcode() {
          new daum.Postcode({
              oncomplete: function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
  
                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var addr = ''; // 주소 변수
                  var extraAddr = ''; // 참고항목 변수
  
                  //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                      addr = data.roadAddress;
                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                      addr = data.jibunAddress;
                  }
  
                  // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                  if(data.userSelectedType === 'R'){
                      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                          extraAddr += data.bname;
                      }
                      // 건물명이 있고, 공동주택일 경우 추가한다.
                      if(data.buildingName !== '' && data.apartment === 'Y'){
                          extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                      }
                      // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                      if(extraAddr !== ''){
                          extraAddr = ' (' + extraAddr + ')';
                      }
                      // 조합된 참고항목을 해당 필드에 넣는다.
                      document.getElementById("sample6_extraAddress").value = extraAddr;
                  
                  } else {
                      document.getElementById("sample6_extraAddress").value = '';
                  }
  
                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('sample6_postcode').value = data.zonecode;
                  document.getElementById("sample6_address").value = addr;
                  // 커서를 상세주소 필드로 이동한다.
                  document.getElementById("sample6_detailAddress").focus();
              }
          }).open();
      }
  </script>
    <style>
        * {box-sizing: border-box}
        body {font-family: Verdana, sans-serif; margin:0}
        .mySlides {display: none}
        img {vertical-align: middle;}
        
        /* Slideshow container */
        .slideshow-container {
          width: 100%;
          height: 500px;
          float: left;
         
        }
        .main_img{
          width: 100%;
          height: 500px;
        }
        
        /* Next & previous buttons */
        .prev, .next {
          cursor: pointer;
          position: absolute;
          top: 50%;
          width: auto;
          padding: 16px;
          margin-top: -22px;
          color: white;
          font-weight: bold;
          font-size: 18px;
          transition: 0.6s ease;
          border-radius: 0 3px 3px 0;
          user-select: none;
        }
        
        /* Position the "next button" to the right */
        .next {
          right: 0;
          border-radius: 3px 0 0 3px;
        }
        
        /* On hover, add a black background color with a little bit see-through */
        .prev:hover, .next:hover {
          background-color: rgba(0,0,0,0.8);
        }
        
        /* Caption text */
        .text {
          color: #f2f2f2;
          font-size: 15px;
          padding: 8px 12px;
          position: absolute;
          bottom: 8px;
          width: 100%;
          text-align: center;
        }
        
        /* Number text (1/3 etc) */
        .numbertext {
          color: #f2f2f2;
          font-size: 12px;
          padding: 8px 12px;
          position: absolute;
          top: 0;
        }
        
        /* The dots/bullets/indicators */
        .dot {
          cursor: pointer;
          height: 15px;
          width: 15px;
          margin: 0 2px;
          background-color: #bbb;
          border-radius: 50%;
          display: inline-block;
          transition: background-color 0.6s ease;
        }
        
        .active, .dot:hover {
          background-color: #717171;
        }
        
        /* Fading animation */
        .fade {
          -webkit-animation-name: fade;
          -webkit-animation-duration: 1.5s;
          animation-name: fade;
          animation-duration: 1.5s;
        }
        
        @-webkit-keyframes fade {
          from {opacity: .4} 
          to {opacity: 1}
        }
        
        @keyframes fade {
          from {opacity: .4} 
          to {opacity: 1}
        }
        
        /* On smaller screens, decrease text size */
        @media only screen and (max-width: 300px) {
          .prev, .next,.text {font-size: 11px}
        }
        #search01   {box-sizing: border-box;
                     width: 70%;
                     height: 45px;
                     font-size: 20px ;
                     background-color: white;
                     border: none;
                    }
                    
        #search02   {box-sizing: border-box;
                     width: 40%;
                     height: 45px;
                     font-size: 20px ;
                    }
                    
        #main_search{box-sizing: border-box;
                     width: 80%;
                     height: 45px;
                     float: left;
                     margin-left: 25px;
                    }
                  
        </style>
  <script>
    var slideIndex = 1;
    showSlides(slideIndex);
    
    function plusSlides(n) {
      showSlides(slideIndex += n);
    }
    
    function currentSlide(n) {
      showSlides(slideIndex = n);
    }
    
    function showSlides(n) {
      var i;
      var slides = document.getElementsByClassName("mySlides");
      var dots = document.getElementsByClassName("dot");
      if (n > slides.length) {slideIndex = 1}    
      if (n < 1) {slideIndex = slides.length}
      for (i = 0; i < slides.length; i++) {
          slides[i].style.display = "none";  
      }
      slideIndex++;
      for (i = 0; i < dots.length; i++) {
          dots[i].className = dots[i].className.replace(" active", "");
      }
      if(slideIndex>slides.length)
      {slideIndex=1
      }
      slides[slideIndex-1].style.display = "block";  
      dots[slideIndex-1].className += " active";
      setTimeout(showSlides,5000);
    }

    function openNav() {
        document.getElementById("mySidenav").style.width = "250px";
        document.getElementById("main").style.marginLeft = "250px";
    }

    function closeNav() {
        document.getElementById("mySidenav").style.width = "0";
        document.getElementById("main").style.marginLeft= "0";
    }

    </script>
    <style>
        #loginbox{box-sizing: border-box;
                 display: block;
                 padding: 10px;
                 height: 300px;
                 float: left;
                }
        .inbox  {width: 240px;
                 height: 40px;
                 font-size: 18px;
                }
    </style>
    <style>
        .button {
          border-radius: 4px;
          background-color: #f4511e;
          border: none;
          color: #FFFFFF;
          text-align: center;
          font-size: 20px;
          padding: 5px;
          width: 240px;
          height: 40px;
          transition: all 0.5s;
          cursor: pointer;
          
        }
        
        .button span {
          cursor: pointer;
          display: inline-block;
          position: relative;
          transition: 0.5s;
        }
        
        .button span:after {
          content: '\00bb';
          position: absolute;
          opacity: 0;
          top: 0;
          right: -20px;
          transition: 0.5s;
        }
        
        .button:hover span {
          padding-right: 25px;
        }
        
        .button:hover span:after {
          opacity: 1;
          right: 0;
        }
        body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

/* Full-width input fields */
.input1,input[type=date],input[type=email], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}
.input2{padding: 15px;
        margin: 5px 0 22px 0;
        display: inline-block;
        border: none;
        background: #f1f1f1;

}

/* Add a background color when the inputs get focus */
input[type=email]:focus,.input1,:focus,input[type=date]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for all buttons */
.button_01 {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.button_01:hover {
  opacity:1;
}

/* Extra styles for the cancel button */
.cancelbtn {
  padding: 14px 20px;
  background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
  float: left;
  width: 50%;
}

/* Add padding to container elements */
.container {
  padding: 16px;
}




/* -----------------------중단 이미지----------------------------- */
html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

.column {
  float: left;
  width: 33.3%;
  margin-bottom: 16px;
  padding: 0 8px;
}

.column2 {
  float: left;
  width: 25%;
  margin-bottom: 16px;
  padding: 0 8px;
}

@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

.container {
  padding: 0 16px;
}

.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.title {
  color: grey;
}

.button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
}

.button:hover {
  background-color: #555;
}
* {box-sizing: border-box;}

body { 
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.header {
  overflow: hidden;
  background-color: #f1f1f1;
  padding: 20px 10px;
}

.header a {
  float: left;
  color: black;
  text-align: center;
  padding: 12px;
  text-decoration: none;
  font-size: 18px; 
  line-height: 25px;
  border-radius: 4px;
}

.header a.logo {
  font-size: 25px;
  font-weight: bold;
}

.header a:hover {
  background-color: #ddd;
  color: black;
}

.header a.active {
  background-color: dodgerblue;
  color: white;
}

.header-right {
  float: right;
}

@media screen and (max-width: 500px) {
  .header a {
    float: none;
    display: block;
    text-align: left;
  }
  
  .header-right {
    float: none;
  }
}
.product_img{
  width: 100%;
  height: 160px;
}

.sidebar {
  margin: 0;
  padding: 0;
  width: 200px;
  background-color: #f1f1f1;
  position: fixed;
  height: 100%;
  overflow: auto;
}

.sidebar a {
  display: block;
  color: black;
  padding: 16px;
  text-decoration: none;
}
 
.sidebar a.active {
  background-color: #4CAF50;
  color: white;
}

.sidebar a:hover:not(.active) {
  background-color: #555;
  color: white;
}

div.content {
  margin-left: 200px;
  padding: 1px 16px;
  height: 1000px;
}

@media screen and (max-width: 700px) {
  .sidebar {
    width: 100%;
    height: auto;
    position: relative;
  }
  .sidebar a {float: left;}
  div.content {margin-left: 0;}
}

@media screen and (max-width: 400px) {
  .sidebar a {
    text-align: center;
    float: none;
  }
}
/* ---------------------------------------- */
#mySidenav1	 a {
  position: absolute;
  left: -80px;
  transition: 0.3s;
  padding: 15px;
  width: 110px;
  text-decoration: none;
  font-size: 15px;
  color: white;
  border-radius: 0 5px 5px 0;
}

#mySidenav1 a:hover {
  left: 0;
}

#about1 {
  top: 575px;
  background-color: #4CAF50;
}

#blog1 {
  top: 635px;
  background-color: #2196F3;
}

#projects1 {
  top: 695px;
  background-color: #f44336;
}

#contact1 {
  top: 755px;
  background-color: #555
}

/* ---------------------공지사항 스타일 시작----------------- */

body {font-family: Arial;}

/* Style the tab */
.tab1 {
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab1 button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab1 button:hover {
  background-color: #ddd;
}

/* Create an active/current tablink class */
.tab1 button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
  border: 1px solid #ccc;
  border-top: none;
}

/* ---------------------------공지사항 스타일 끝 */

	.inner_button{
		width : 50%;
		height :60px;
		float:left;
		font-size:30px;
	}
	.inner_font{
	float:left;
	width : 100%;
	background-color:white;
	font-size:20px;
	}

/* 시설 모달 끝------------------------------------------ */
  .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        </style>
        
</head>
<body>
    
      <script>
      function locationsearch(){
    	  locationsearchform.submit();
      }
      
   
      </script>
      
      <div id="main">
        <a href="Main.jsp"><i class="far fa-building" style="font-size: 43px;float: left;"></i></a>
            <div id="main_search">
            	<form action="locationsearch" method="post" name="locationsearchform">	
              		<input id=search01 name="lsearch" type="text">
              	</form>
            </div>
              <button onclick="locationsearch()" style="float:left;">시설검색</button>
           <a href="https://map.kakao.com/link/search/헬스"><i class="fas fa-street-view" style="font-size: 43px; float: left; "></i></a>
      </div>
      
      
      
<!-- --------------------------------------------------------------------상단 그림 -->
<div>
    <div class="slideshow-container">

      <div class="container mySlides fade">
        <img src="메인이미지.jpg" alt="Notebook" class="main_img">
        <div class="content">
        </div>
      </div>
      
        
      <div class="container mySlides fade">
        <img src="/w3images/notebook.jpg" alt="Notebook" class="main_img">
        <div class="content">
        </div>
      </div>
        
      <div class="container mySlides fade">
        <img src="/w3images/notebook.jpg" alt="Notebook" class="main_img">
        <div class="content">
        </div>
      </div>
        
        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
        <a class="next" onclick="plusSlides(1)">&#10095;</a>
    </div>
</div>


  <!-- ------------------------공지사항------------------- -->
<div style="width: 100%; float: left; padding: 20px;">


  
  <div id="mySidenav1" class="sidenav1" style="float: left;">
    <a href="boardlistpaging" id="about1">게시판</a>
    <a href="mypage" id="blog1">마이페이지</a>
    <c:if test="${sessionScope.loginid eq 'admin'}">
    <a href="admin" id="projects1">관리자 전용</a>
    </c:if>
  </div>
  <div style="width: 60%; float: left; margin-left: 95px;">  
      <div class="tab1">
        <button class="tablinks" onclick="openCity(event, 'London')">공지사항</button>
        <button class="tablinks" onclick="openCity(event, 'Paris')">Q&A</button>
        <button class="tablinks" onclick="openCity(event, 'Tokyo')">자료실</button>
      </div>
      
      <div id="London" class="tabcontent">
        <h3>공지사항</h3>
        <p>London is the capital city of England.</p>
      </div>
      
      <div id="Paris" class="tabcontent">
        <h3>Q&A</h3>
        <p>Paris is the capital of France.</p> 
      </div>
      
      <div id="Tokyo" class="tabcontent">
        <h3>자료실</h3>
        <p>Tokyo is the capital of Japan.</p>
      </div>
  </div>
        <!--  로그인 창---------------------------------------------------------------------------->

      <div style="width:300px;height:220px; float: left; padding:15px; margin-left: 10px; background-color: rgb(54, 116, 231);">
      <c:if test="${sessionScope.loginid eq null}">
      	<form action="memberlogin" name="loginform" method="post">
        <div id="idpwbox">
            <input type="text" name="mid" class="inbox" placeholder="아이디를 입력하세요" style="width: 270px;"><br>
            <input type="text" name="mpassword" class="inbox" placeholder="비밀번호를 입력하세요" style="width: 270px;"><br>
            <span><a href="FindId.jsp" style="color:white">아이디 찾기</a></span>
            <span style="margin-left:80px;"><a href="FindPw.jsp" style="color:white">비밀번호 찾기</a></span><br>
        </div>
        </form>
        <div style="margin-top: 20px;">
            <button class="button" style="width: 100%;" onclick="loginformf()"><span>로그인 </span></button><br>
        </div>
       </c:if>
       <c:if test="${sessionScope.loginid ne null}">
       	${sessionScope.loginid}님이 로그인 중
            <button class="button" onclick="location.href='memberlogout'">로그아웃</button>
       </c:if>
            <button class="button btn" style="background-color: rgb(10, 216, 171);">회원가입</button>
      </div>
</div>

<script>
function loginformf(){
	loginform.submit();
}


</script>


    <!-- --------------------------------------------체육시설 시작---------------- -->
        
        
  <div style="float: left;">
          <h3 style="font-size: 30px;">체육 시설</h3>
          <div class="row">
            <div class="column">
              <div class="card">
                <img src="LocationFile/헬스1.jpg" alt="Jane" style="width:100%">
                <div class="container">
                  <h2>Jane Doe</h2>
                  <p class="title">CEO & Founder</p>
                  <p>Some text that describes me lorem ipsum ipsum lorem.</p>
                  <p>example@example.com</p>
                  <p><button class="button btn" id="myBtn1" onclick="location.href='locationview?lnumber='+1">상세보기</button></p>
                </div>
              </div>
            </div>
          
            <div class="column">
              <div class="card">
                <img src="LocationFile/헬스2.jpg" alt="Mike" style="width:100%">
                <div class="container">
                  <h2>Mike Ross</h2>
                  <p class="title">Art Director</p>
                  <p>Some text that describes me lorem ipsum ipsum lorem.</p>
                  <p>example@example.com</p>
                  <p><button class="button btn" id="myBtn2">상세보기</button></p>
                </div>
              </div>
            </div>
            
            <div class="column">
              <div class="card">
                <img src="LocationFile/헬스3.jpg" alt="John" style="width:100%">
                <div class="container">
                  <h2>John Doe</h2>
                  <p class="title">Designer</p>
                  <p>Some text that describes me lorem ipsum ipsum lorem.</p>
                  <p>example@example.com</p>
                  <p><button class="button btn" id="myBtn3">상세보기</button></p>
                </div>
              </div>
            </div>
          </div>


          <div class="row">
            <div class="column">
              <div class="card">
                <img src="LocationFile/헬스4.jpg" alt="Jane" style="width:100%">
                <div class="container">
                  <h2>Jane Doe</h2>
                  <p class="title">CEO & Founder</p>
                  <p>Some text that describes me lorem ipsum ipsum lorem.</p>
                  <p>example@example.com</p>
                  <p><button class="button btn" id="myBtn4">상세보기</button></p>
                </div>
              </div>
            </div>
          
            <div class="column">
              <div class="card">
                <img src="LocationFile/헬스5.jpg" alt="Mike" style="width:100%">
                <div class="container">
                  <h2>Mike Ross</h2>
                  <p class="title">Art Director</p>
                  <p>Some text that describes me lorem ipsum ipsum lorem.</p>
                  <p>example@example.com</p>
                  <p><button class="button btn" id="myBtn5">상세보기</button></p>
                </div>
              </div>
            </div>
            
            <div class="column">
              <div class="card">
                <img src="LocationFile/헬스6.jpg" alt="John" style="width:100%">
                <div class="container">
                  <h2>John Doe</h2>
                  <p class="title">Designer</p>
                  <p>Some text that describes me lorem ipsum ipsum lorem.</p>
                  <p>example@example.com</p>
                  <p><button class="button btn" id="myBtn6">상세보기</button></p>
                </div>
              </div>
            </div>
          </div>
  </div>
  
  
  
  
      <!-- 첫 번째 Modal을 여는 클래스 -->
    <!-- 첫 번째 Modal -->
    <div class="modal">
      <!-- 첫 번째 Modal의 내용 -->
      <div class="modal-content">
        <span class="close">&times;</span>                         
        <form class="modal-content" action="memberjoin" name="memberform" method="post">
              <div class="container">
                <h1>회원가입</h1>
                <hr>
                <label ><b>이메일</b></label>
                <input type="text" name="mid" id="mid" placeholder="이메일을 입력하세요" name="email" required>
          
                <label ><b>비밀번호</b></label>
                <input type="password" onkeyup="pwdCheck1()" name="mpassword" id="mpassword" placeholder="비밀번호를 입력하세요" required><br>
                <span id="pwdch"></span><br>

                <label ><b>비밀번호 확인</b></label>
                <input type="password" onkeyup="pwdEqFn1()" name="mpassword" id="mpasswordch"placeholder="비밀번호를 입력하세요" required><br>
                <span id="pwdEq"></span><br>

                <label ><b>이름</b></label>
                <input type="text" class="input1" name="mname" id="mname" placeholder="이름" required>

                <label ><b>주소</b></label><br>
                <input type="text" id="sample6_postcode" class="input2"placeholder="우편번호" name="maddress1">
                <input type="button" class="input2" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" name="maddress2"><br>
                <input type="text" style="width: 100%;" id="sample6_address" class="input2" placeholder="주소" name="maddress3"><br>
                <input type="text" style="width: 55%;" id="sample6_detailAddress" class="input2"placeholder="상세주소" name="maddress4">
                <input type="text" id="sample6_extraAddress" class="input2"placeholder="참고항목" name="maddress5"><br>

                <label><b>전화번호</b></label>
                <input type="text" class="input1" name="mphone" id="mphone" onkeyup="phonech()" placeholder="전화번호를 입력하세요" required><br>
                <span id="pch"></span><br>

                <label><b>생년월일</b></label>
                <input type="date" class="input1" name="mbirth" id="mbirth" placeholder="생년월일을 입력하세요" required>

          
          
                <div class="clearfix">
                  <button onclick="memberin()"  class="button" style="margin-bottom: 10px;">회원가입</button>
                </div>
              </div>
            </form>
      </div>
    </div>
 <script>
	 function memberin(){
		 memberform.submit();
	 }
	 
	 function productsearch(){
		 productsearchform.submit();
	 }
 </script>
  
           <div style="margin-left: 10px;float:left;width:100%">        
          <h3 style="font-size: 30px;" style="float: left;">건강식품</h3>
          </div>
  <div style="float:left;width:100%">    
      
              <div> 
	              <form action="productsearch" method="post" name="productsearchform">
		              <input id=search02 name="psearch" type="text" style="float: left; border:none;">
	              </form>
		            <a onclick="productsearch()" style="float: left;margin:5px;"><i class="fas fa-search" style="font-size: 30px;"></i></a>
              </div>
        
    </div>
          
    <div style="width:100">
          <div class="row">
            <div class="column2">
              <div class="card">
                <img src="ProductFile/19937eec16.jpg" class="product_img"alt="Jane" >
                <div class="container">
                  <h2>Jane Doe</h2>
                  <p class="title">CEO & Founder</p>
                  <p>Some text that describes me lorem ipsum ipsum lorem.</p>
                  <p>example@example.com</p>
                  <p><button class="button btn">제품보기</button></p>
                </div>
              </div>
            </div>

            <div class="row">
              <div class="column2">
                <div class="card">
                  <img src="ProductFile/건강식품1.png" class="product_img"alt="Jane" >
                  <div class="container">
                    <h2>Jane Doe</h2>
                    <p class="title">CEO & Founder</p>
                    <p>Some text that describes me lorem ipsum ipsum lorem.</p>
                    <p>example@example.com</p>
                    <p><button class="button btn">제품보기</button></p>
                  </div>
                </div>
              </div>
          
            <div class="column2">
              <div class="card">
                <img src="ProductFile/건강식품2.png" alt="Mike" class="product_img" style="width:100%">
                <div class="container">
                  <h2>Mike Ross</h2>
                  <p class="title">Art Director</p>
                  <p>Some text that describes me lorem ipsum ipsum lorem.</p>
                  <p>example@example.com</p>
                  <p><button class="button btn">제품보기</button></p>
                </div>
              </div>
            </div>
            
            <div class="column2">
              <div class="card">
                <img src="ProductFile/다운로드.jpg" alt="John" class="product_img" style="width:100%">
                <div class="container">
                  <h2>John Doe</h2>
                  <p class="title">Designer</p>
                  <p>Some text that describes me lorem ipsum ipsum lorem.</p>
                  <p>example@example.com</p>
                  <p><button class="button btn">제품보기</button></p>
                </div>
              </div>
            </div>
          </div>
          
     </div>
  </div>

        
        
        
        <hr>
 
    <!-- 첫번째 시설 Modal -->
    <div class="modal">
 
      <!-- 첫번째 시설 Modal의 내용 -->
      <div class="modal-content">
        <span class="close">&times;</span>
        <img src="LocationFile/헬스1.jpg" alt="Jane" style="width:100%">
        	59.99$
        
        <div id="map" style="display:hidden"></div>
		<button onclick="location.href='locationggym?lnumber='+1">찜하기</button>
      </div>
    </div>
 
    <hr>
 
    <!-- 두번째 시설 Modal -->
    <div class="modal">
      <!-- 두번째 시설 Modal의 내용 -->
      <div class="modal-content">
        <span class="close">&times;</span>
       <img src="LocationFile/헬스2.jpg" alt="Jane" style="width:100%">
        	59.99$
        
        <div id="map" style="display:hidden"></div>
		<button onclick="location.href='locationggym?lnumber='+2">찜하기</button>
      </div>
    </div>
    
    
     <hr>
     <!-- 세번째 시설 Modal -->
    <div class="modal">
      <!-- 세번째  시설 Modal의 내용 -->
      <div class="modal-content">
        <span class="close">&times;</span>
       <img src="LocationFile/헬스3.jpg" alt="Jane" style="width:100%">
        	59.99$
        
        <div id="map" style="display:hidden"></div>
		<button onclick="location.href='locationggym?lnumber='+3">찜하기</button>
      </div>
    </div>
    
    
     <hr>
     <!-- 네 번째 시설 Modal -->
    <div class="modal">
      <!--네 번째 시설 Modal의 내용 -->
      <div class="modal-content">
        <span class="close">&times;</span>
       <img src="LocationFile/헬스4.jpg" alt="Jane" style="width:100%">
        	59.99$
        
        <div id="map" style="display:hidden"></div>
		<button onclick="location.href='locationggym?lnumber='+4">찜하기</button>
      </div>
    </div>
    
    
     <hr>
     <!-- 다섯 번째 시설 Modal -->
    <div class="modal">
      <!-- 다섯 번째 시설 Modal의 내용 -->
      <div class="modal-content">
        <span class="close">&times;</span>
       <img src="LocationFile/헬스5.jpg" alt="Jane" style="width:100%">
        	59.99$
        
        <div id="map" style="display:hidden"></div>
		<button onclick="location.href='locationggym?lnumber='+5">찜하기</button>
      </div>
    </div>
    
    
     <hr>
     <!-- 여섯 번째 시설 Modal -->
    <div class="modal">
      <!-- 여섯 번째 시설 Modal의 내용 -->
      <div class="modal-content">
        <span class="close">&times;</span>
       <img src="LocationFile/헬스6.jpg" alt="Jane" style="width:100%">
        	59.99$
        
        <div id="map" style="display:hidden"></div>
		<button onclick="location.href='locationggym?lnumber='+6">찜하기</button>
      </div>
    </div>
        
        
        <hr>

     <!-- 첫번째 상품 Modal -->
    <div class="modal">
      <!--첫번째 상품  Modal의 내용 -->
      <div class="modal-content">
        <span class="close">&times;</span>
       <img src="ProductFile/19937eec16.jpg" class="product_img"alt="Jane" >
        	59.99$<br>
        	<form name="bas1" method="post" action="basketinput">
        	수량 결정<input type="text" name="pbamount" id="pbamount">
        	<input type="hidden" name="pnumber" value="2">
        	</form>
        <button onclick="basket1()">장바구니 담기</button>
      </div>
    </div>
    
    
     <hr>
     <!-- 두번째 상품  Modal -->
    <div class="modal">
      <!--두번째 상품  Modal의 내용 -->
      <div class="modal-content">
        <span class="close">&times;</span>
      <img src="ProductFile/건강식품1.png" class="product_img"alt="Jane" >
        	59.99$<br>
        	<form name="bas2" method="post" action="basketinput">
        	수량 결정<input type="text" name="pbamount" id="pbamount">
        	<input type="hidden" name="pnumber" value="3">
        	</form>
        <button onclick="basket2()">장바구니 담기</button>
      </div>
    </div>
    
     <hr>
     <!-- 세번째 상품  Modal -->
    <div class="modal">
      <!-- 세번째 상품 Modal의 내용 -->
      <div class="modal-content">
        <span class="close">&times;</span>
        <img src="ProductFile/건강식품2.png" class="product_img"alt="Jane" >
        	59.99$<br>
        	<form name="bas3" method="post" action="basketinput">
        	수량 결정<input type="text" name="pbamount" id="pbamount">
        	<input type="hidden" name="pnumber" value="4">
        	</form>
        <button onclick="basket3()">장바구니 담기</button>
      </div>
    </div>
    
    
     <hr>
     <!-- 네번째 상품 Modal -->
    <div class="modal">
      <!-- 네 번째 상품Modal의 내용 -->
      <div class="modal-content">
        <span class="close">&times;</span>
        <img src="ProductFile/다운로드.jpg" alt="John" class="product_img" style="width:100%">
        	59.99$<br>
        	<form name="bas4" method="post" action="basketinput">
        	수량 결정<input type="text" name="pbamount" id="pbamount">
        	<input type="hidden" name="pnumber" value="5">
        	</form>
        <button onclick="basket4()">장바구니 담기</button>
      </div>
    </div>
        
        <script>
        function basket1(){
        	bas1.submit();
        }
        function basket2(){
        	bas2.submit();
        }
        function basket3(){
        	bas3.submit();
        }
        function basket4(){
        	bas4.submit();
        }
        </script>
        
        
        
        <script>
//Modal을 가져옵니다.
  var modals = document.getElementsByClassName("modal");
  // Modal을 띄우는 클래스 이름을 가져옵니다.
  var btns = document.getElementsByClassName("btn");
  // Modal을 닫는 close 클래스를 가져옵니다.
  var spanes = document.getElementsByClassName("close");
  var funcs = [];
   
  // Modal을 띄우고 닫는 클릭 이벤트를 정의한 함수
  function Modal(num) {
    return function() {
      // 해당 클래스의 내용을 클릭하면 Modal을 띄웁니다.
      btns[num].onclick =  function() {
          modals[num].style.display = "block";
          console.log(num);
      };
   
      // <span> 태그(X 버튼)를 클릭하면 Modal이 닫습니다.
      spanes[num].onclick = function() {
          modals[num].style.display = "none";
      };
    };
  }
   
  // 원하는 Modal 수만큼 Modal 함수를 호출해서 funcs 함수에 정의합니다.
  for(var i = 0; i < 12; i++) {
    funcs[i] = Modal(i);
  }
   
  // 원하는 Modal 수만큼 funcs 함수를 호출합니다.
  for(var j = 0; j < 12; j++) {
    funcs[j]();
  }
   
  // Modal 영역 밖을 클릭하면 Modal을 닫습니다.
  window.onclick = function(event) {
    if (event.target.className == "modal") {
        event.target.style.display = "none";
    }
  };
  
  
  
  </script>
	
  
        

          <!-- -------------------------- 하단 시작 -------------------------------- -->

      <div style="height: 100px; background-color: rgb(204, 230, 222);">
        <div style="margin-left: auto; margin-right: auto;">
          <div style="float: left; margin-left: 10px; ">
          이용약관<i class="fas fa-angle-up"></i>
          </div>
          <div style="float: left; margin-left: 10px;">
          위치기반서비스이용약관<i class="fas fa-angle-up"></i>
          </div>
          <div style="float: left; margin-left: 10px;">
          개인정보처리방침<i class="fas fa-angle-up"></i>
          </div>
          <div style="float: left; margin-left: 10px;">
          운영정책<i class="fas fa-angle-up"></i>
          </div>
          <div style="float: left; margin-left: 10px;;">
          청소년보호정책<i class="fas fa-angle-up"></i>
          </div>
          <div style="float: left; margin-left: 10px;">
          권리침해신고안내<i class="fas fa-angle-up"></i>
          </div>
        </div>
      </div>
          
          <script>
            function openCity(evt, cityName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
              tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks");
            for (i = 0; i < tablinks.length; i++) {
              tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(cityName).style.display = "block";
            evt.currentTarget.className += " active";
          }


// ------------------------------------------공지사항 끝-----------------
          
		
		function pwdEqFn1()  {var pwd = document.getElementById("mpassword").value;
		 var pwdch = document.getElementById("mpasswordch").value;
		 var eqmsg = document.getElementById("pwdEq");
		 if(pwd==pwdch)
		    {eqmsg.style.color = "green";
		    eqmsg.style.fontSize= "12px";
		    eqmsg.innerHTML="일치";
		    }
		 else
		    {eqmsg.style.color = "red";
		    eqmsg.style.fontSize= "12px";
		    eqmsg.innerHTML="불일치";
		    }
		}
		
		function pwdCheck1() {var exp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%#?&])[A-Za-z\d$@$!%#?&]{8,16}$/;
		 //비밀번호 검증을 위한 정규식(어떠한 것이 들어가야만 한다)
		 // 소문자,대문자,숫자,특수문자가 포함되고 자릿수는 8~16[]   
		 var pwd = document.getElementById("mpassword").value;
		 var pwdch=document.getElementById("pwdch");
		 if(pwd.match(exp))
		    {pwdch.style.color="green";
		     pwdch.i
		     nnerHTML="비밀번호 형식 맞음";
		     pwdch.style.fontSize= "12px";
		    }
		 else
		    {pwdch.style.color="red";
		     pwdch.innerHTML="소문자,대문자,숫자,특수문자가 포함되고 자릿수는 8~16";
		     pwdch.style.fontSize= "12px";
		    }
		}
		
		function phonech()  {var pnum=document.getElementById("mphone").value;
		 var exp = /^\d{3}-\d{4}-\d{4}$/;
		 var num=document.getElementById("pch");
		 if(pnum.match(exp))
		    {num.style.color="green";
		     num.innerHTML="전화번호 형식 맞음";
		     num.style.fontSize= "12px";
		    }
		 else
		    {num.style.color="red";
		     num.style.fontSize= "12px";
		     num.innerHTML="전화번호 형식 안맞음";
		    }
		}
		
		  function emailselFn(emailvalue)  {console.log(emailvalue);
          document.getElementById("memailsel").value=emailvalue;
         }
          </script>
</body>
</html>