<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
body {font-family: Arial, Helvetica, sans-serif;}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 90%;
  padding: 15px;
  margin: 5px 20px 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
  margin-left:30px;
}

/* Add a background color when the inputs get focus */
input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for all buttons */
.button1 {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  border: none;
  cursor: pointer;
  width: 50%;
  opacity: 0.9;
  float: left;
}

.button1:hover {
  opacity:1;
}

/* Extra styles for the cancel button */
.cancelbtn {
  padding: 14px 20px;
  background-color: #f44336;
  outline: none;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
  float: left;
  width: 50%;
  outline: none;
}

/* Add padding to container elements */
.container {
  padding: 10px;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 733px; /* Full width */
  height: auto; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: #474e5d;
  padding-top: 50px;
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 733px; 
  height: auto; 

/* Style the horizontal ruler */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}
 
/* The Close Button (x) */
.close {
  position: absolute;
  right: 35px;
  top: 15px;
  font-size: 40px;
  font-weight: bold;
  color: #f1f1f1;
}

.close:hover,
.close:focus {
  color: #f44336;
  cursor: pointer;
}



</style>
</head>
<body>
<jsp:include page="maintool.jsp" flush="false"/>


	
	<!-- 첫 번째 Modal을 여는 클래스 -->
    <button class="btn" onclick="memberlistpaging" >전체 회원보기</button>
 	
    
 
    <hr>
    <!-- 두 번째 Modal을 여는 클래스 -->
 <button class="btn" style="width:auto;">시설등록하기</button>
    <!-- 두 번째 Modal -->
    <div class="modal">
 
      <!-- 두 번째 Modal의 내용 -->
      <div class="modal-content">
        <span class="close">&times;</span>
        <form action="locationinput" style="width: 733px; 
  height: auto;margin-right:auto;margin-left:auto;"
        enctype="multipart/form-data" method="post" class="modal-content" name="locationform"><br>
	    	<p style="margin-left:30px">시설 이름</p>
	    	<input type="text" name="lname" id="lname"><br>
	    	<p style="margin-left:30px">시설 주소</p>
	    		<input type="text" style="width:40%;" id="sample6_postcode" placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="width:20%; height:45px"><br>
				<input type="text" id="sample6_address" placeholder="주소"><br>
				<input type="text" id="sample6_detailAddress" placeholder="상세주소">
				<input type="text" id="sample6_extraAddress" placeholder="참고항목"><br>
	    	<p style="margin-left:30px">시설 전화번호</p>
	    	<input type="text" name="lpnumber" id="lpnumber"><br>
	    	<p style="margin-left:30px" >시설 사진</p>
	    	<input style="width:40%; height:60px;margin-left:30px" type="file" name="lfile" id="lfile"><br>
      <div style="">
         <button onclick="locationsubmit()" class="button1">시설 등록</button>
      </div>
    </form>
      </div>
   </div>
 
    <hr>
    <!-- 세 번째 Modal을 여는 클래스 -->
 <button class="btn">상품 등록</button>
    <!-- 세 번째 Modal -->
    <div class="modal">
 
      <!-- 세 번째 Modal의 내용 -->
      <div class="modal-content">
        <span class="close">&times;</span>
           <form action="productinput" style="width: 733px; 
  height: auto;"
        enctype="multipart/form-data" method="post" class="modal-content" name="productform"><br>
	    	<p style="margin-left:30px">제품 이름</p>
	    	<input type="text" name="pname" id="pname"><br>
	    	
	    	<p style="margin-left:30px">제품 정보</p>
	    	<input type="text" name="pcontents" id="pcontents"><br>
	    	
	    	<p style="margin-left:30px">제품 가격</p>
	    	<input type="text" name="pprice" id="pprice"><br>
	    	
	    	<p style="margin-left:30px" >제품 사진</p>
	    	<input style="width:40%; height:60px;margin-left:30px" type="file" name="pfile" id="pfile"><br>
      <div style="">
         <button onclick="productsubmit()" class="button1">제품 등록</button>
      </div>
    </form>
      </div>
    </div>
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
 for(var i = 0; i < btns.length; i++) {
   funcs[i] = Modal(i);
 }
  
 // 원하는 Modal 수만큼 funcs 함수를 호출합니다.
 for(var j = 0; j < btns.length; j++) {
   funcs[j]();
 }
  
 // Modal 영역 밖을 클릭하면 Modal을 닫습니다.
 window.onclick = function(event) {
   if (event.target.className == "modal") {
       event.target.style.display = "none";
   }
 };
 
 </script>
		
	<script>
	function locationsubmit(){
		locationform.submit();
	}
	function productsubmit(){
		productform.submit();
	}
	
	
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


</body>
</html>