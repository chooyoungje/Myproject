<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
	<!-- 첫 번째 Modal을 여는 클래스 -->
    <h1 class="btn">MODAL_1</h1>
 
    <!-- 첫 번째 Modal -->
    <div class="modal">
 
      <!-- 첫 번째 Modal의 내용 -->
      <div class="modal-content">
        <span class="close">&times;</span>                         
        <p>첫 번째 Modal</p>
      </div>
    </div>
 
    <hr>
    <!-- 두 번째 Modal을 여는 클래스 -->
    <h1 class="btn">MODAL_2</h1>
 
    <!-- 두 번째 Modal -->
    <div class="modal">
 
      <!-- 두 번째 Modal의 내용 -->
      <div class="modal-content">
        <span class="close">&times;</span>
        <p>두 번째 Modal</p>
      </div>
    </div>
 
    <hr>
    <!-- 세 번째 Modal을 여는 클래스 -->
    <h1 class="btn">MODAL_3</h1>
 
    <!-- 세 번째 Modal -->
    <div class="modal">
 
      <!-- 세 번째 Modal의 내용 -->
      <div class="modal-content">
        <span class="close">&times;</span>
        <p>세 번째 Modal</p>
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
</body>
</html>