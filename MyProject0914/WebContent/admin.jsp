<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css?">
<link rel="stylesheet" href="CSS/admin.css" media="all" type="text/css"/>

<style>
* {
  box-sizing: border-box;
}

body {
  font-family: Arial;
  margin: 0 auto; /* Center website */
  max-width: 800px; /* Max width */
  padding: 20px;
}

.heading {
  font-size: 25px;
  margin-right: 25px;
}

.fa {
  font-size: 25px;
}

.checked {
  color: orange;
}

/* Three column layout */
.side {
  float: left;
  width: 35px;
  margin-top:10px;
}

.middle {
  margin-top:10px;
  float: left;
  width: 400px;
}

/* Place text to the right */
.right {
  text-align: right;
  float: left;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* The bar container */
.bar-container {
  width: 100%;
  background-color: #f1f1f1;
  text-align: center;
  color: white;
}

/* Individual bars */
.bar-5 {width: 60%; height: 18px; background-color: #4CAF50;}
.bar-4 {width: 30%; height: 18px; background-color: #2196F3;}
.bar-3 {width: 10%; height: 18px; background-color: #00bcd4;}
.bar-2 {width: 4%; height: 18px; background-color: #ff9800;}
.bar-1 {width: 15%; height: 18px; background-color: #f44336;}

@media (max-width: 400px) {
  .side, .middle {
    width: 100%;
  }
  .right {
    display: none;
  }
}
</style>

</head>
<body>
<jsp:include page="maintool.jsp" flush="false"/>
<script language=javascript>
var listP1Age10 = new Array();
var listP1Age20 = new Array();
var listP1Age30 = new Array();
var listP1Age40 = new Array();
var listP1Age50 = new Array();

var listP2Age10 = new Array();
var listP2Age20 = new Array();
var listP2Age30 = new Array();
var listP2Age40 = new Array();
var listP2Age50 = new Array();
<c:forEach var="l" items="${list}">
if("${l.pnumber}"==2)
	{var age=Number("${l.mage}");
	 if(age>=10&&age<20)
		{listP1Age10.push(age);
		}
	 else if(age>=20&&age<30)
		{listP1Age20.push(age);
		}
	 else if(age>=30&&age<40)
		{listP1Age30.push(age);
		}
	 else if(age>=40&&age<50)
		{listP1Age40.push(age);
		}
	 else
		{listP1Age50.push(age);
		}
	}
else if("${l.pnumber}"==3)
	{var age=Number("${l.mage}");
	 if(age>=10&&age<20)
		{listP2Age10.push(age);
		}
	 else if(age>=20&&age<30)
		{listP2Age20.push(age);
		}
	 else if(age>=30&&age<40)
		{listP2Age30.push(age);
		}
	 else if(age>=40&&age<50)
		{listP2Age40.push(age);
		}
	else
	 	{listP2Age50.push(age);
		}
		
	}

</c:forEach>

var ax = listP1Age10.length;
var bx = listP1Age20.length;
var cx = listP1Age30.length; 
var dx = listP1Age40.length; 
var ex = listP1Age50.length;

var a2x = listP2Age10.length;
var b2x = listP2Age20.length;
var c2x = listP2Age30.length; 
var d2x = listP2Age40.length; 
var e2x = listP2Age50.length;

var totalx= ax+bx+cx+dx+ex;
var total2x= a2x+b2x+c2x+d2x+e2x;

var ap = ax/totalx*100;
var bp = bx/totalx*100;
var cp = cx/totalx*100;
var dp = dx/totalx*100;
var ep = ex/totalx*100;

var a2p = a2x/total2x*100;
var b2p = b2x/total2x*100;
var c2p = c2x/total2x*100;
var d2p = d2x/total2x*100;
var e2p = e2x/total2x*100;

</script>

 <div style="width:1000px; height:1000px;float:left;margin-left:auto;margin-right:auto;">
     <button onclick="location.href='memberlistpaging'" >전체 회원보기</button>
	    <hr>
	 <button class="btn" style="width:auto;">시설등록하기</button>
	    <hr>
	 <div>
	 	<div style="width:1000px;"><button class="btn" style="float:left;">상품 등록</button></div><br>
	 	<img src="ProductFile/19937eec16.jpg" style="float:left;width:250px;height:250px">
			<div class="row" style="padding:20px;width:600px;height:250px;float:left;">
			
			<div style="float:left;">
			  <div class="side">
			    <div>10대</div>
			  </div>
			  <div class="middle">
			    <div class="bar-container">
			      <div class="bar-5" id="gra1"></div>
			    </div>
			  </div>
			  <div class="side right">
			    <div id="gra1-1"></div>
			  </div>
			</div> 
			
			
			<div style="float:left;">  
			  <div class="side">
			    <div>20대</div>
			  </div>
			  <div class="middle">
			    <div class="bar-container">
			      <div class="bar-4" id="gra2"></div>
			    </div>
			  </div>
			  <div class="side right">
			    <div id="gra2-1"></div>
				</div>
			</div>      
			    
			    
			<div style="float:left;">      
			  <div class="side">
			    <div>30대</div>
			  </div>
			  <div class="middle">
			    <div class="bar-container">
			      <div class="bar-3" id="gra3"></div>
			    </div>
			  </div>
			  <div class="side right">
			    <div id="gra3-1"></div>
			  </div>
			</div> 
			  
			
			<div style="float:left;"> 	  
			  <div class="side">
			    <div>40대</div>
			  </div>
			  <div class="middle">
			    <div class="bar-container">
			      <div class="bar-2" id="gra4"></div>
			    </div>
			  </div>
			  <div class="side right">
			    <div id="gra4-1"></div>
			</div>
			</div>
			  
			    
		   <div style="float:left;">    
			  <div class="side">
			    <div>50대</div>
			  </div>
			  <div class="middle">
			    <div class="bar-container">
			      <div class="bar-1" id="gra5"></div>
			    </div>
			  </div>
			  <div class="side right">
			    <div id="gra5-1"></div>
			  </div>
			</div>
		  </div>
	</div>
	
	
	<div style="margin-left:72px;margin-top:30px">
	  
	 	<img src="ProductFile/건강식품1.png" style="float:left;width:250px;height:250px">
			<div class="row" style="padding:20px;width:600px;height:250px;float:left;">
			
			<div style="float:left;">
			  <div class="side">
			    <div>10대</div>
			  </div>
			  <div class="middle">
			    <div class="bar-container">
			      <div class="bar-5" id="gra6"></div>
			    </div>
			  </div>
			  <div class="side right">
			    <div id="gra6-1"></div>
			  </div>
			</div> 
			
			
			<div style="float:left;">  
			  <div class="side">
			    <div>20대</div>
			  </div>
			  <div class="middle">
			    <div class="bar-container">
			      <div class="bar-4" id="gra7"></div>
			    </div>
			  </div>
			  <div class="side right">
			    <div id="gra7-1"></div>
				</div>
			</div>      
			    
			    
			<div style="float:left;">      
			  <div class="side">
			    <div>30대</div>
			  </div>
			  <div class="middle">
			    <div class="bar-container">
			      <div class="bar-3" id="gra8"></div>
			    </div>
			  </div>
			  <div class="side right">
			    <div id="gra8-1"></div>
			  </div>
			</div> 
			  
			
			<div style="float:left;"> 	  
			  <div class="side">
			    <div>40대</div>
			  </div>
			  <div class="middle">
			    <div class="bar-container">
			      <div class="bar-2" id="gra9"></div>
			    </div>
			  </div>
			  <div class="side right">
			    <div id="gra9-1"></div>
			</div>
			</div>
			  
			    
		   <div style="float:left;">    
			  <div class="side">
			    <div>50대</div>
			  </div>
			  <div class="middle">
			    <div class="bar-container">
			      <div class="bar-1" id="gra10"></div>
			    </div>
			  </div>
			  <div class="side right">
			    <div id="gra10-1"></div>
			  </div>
			</div>
		  </div>
			
	</div>
 </div>
<script>

document.getElementById("gra1").style.width=ap.toFixed(1)+"%";
document.getElementById("gra2").style.width=bp.toFixed(1)+"%";
document.getElementById("gra3").style.width=cp.toFixed(1)+"%";
document.getElementById("gra4").style.width=dp.toFixed(1)+"%";
document.getElementById("gra5").style.width=ep.toFixed(1)+"%";

document.getElementById("gra1-1").innerHTML=ap.toFixed(1)+"%";
document.getElementById("gra2-1").innerHTML=bp.toFixed(1)+"%";
document.getElementById("gra3-1").innerHTML=cp.toFixed(1)+"%";
document.getElementById("gra4-1").innerHTML=dp.toFixed(1)+"%";
document.getElementById("gra5-1").innerHTML=ep.toFixed(1)+"%";

document.getElementById("gra6").style.width=a2p.toFixed(1)+"%";
document.getElementById("gra7").style.width=b2p.toFixed(1)+"%";
document.getElementById("gra8").style.width=c2p.toFixed(1)+"%";
document.getElementById("gra9").style.width=d2p.toFixed(1)+"%";
document.getElementById("gra10").style.width=e2p.toFixed(1)+"%";

document.getElementById("gra6-1").innerHTML=a2p.toFixed(1)+"%";
document.getElementById("gra7-1").innerHTML=b2p.toFixed(1)+"%";
document.getElementById("gra8-1").innerHTML=c2p.toFixed(1)+"%";
document.getElementById("gra9-1").innerHTML=d2p.toFixed(1)+"%";
document.getElementById("gra10-1").innerHTML=e2p.toFixed(1)+"%";
</script>

 
 
    <div class="modal">
 
      <div class="modal-content">
        <span class="close">&times;</span>
        <form action="locationinput" style="width: 733px; 
  height: auto;margin-right:auto;margin-left:auto;"
        enctype="multipart/form-data" method="post" class="modal-content" name="locationform"><br>
	    	<p style="margin-left:30px">시설 이름</p>
	    	<input type="text" name="lname" id="lname"><br>
	    	<p style="margin-left:30px">시설 주소</p>
	    		<input type="text" name="location1" style="width:40%;" id="sample6_postcode" placeholder="우편번호">
				<input type="button" name="location2"  onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="width:20%; height:45px"><br>
				<input type="text"  name="location3" id="sample6_address" placeholder="주소"><br>
				<input type="text"  name="location4" id="sample6_detailAddress" placeholder="상세주소">
				<input type="text"  name="location5" id="sample6_extraAddress" placeholder="참고항목"><br>
	    	<p style="margin-left:30px">시설 전화번호</p>
	    	<input type="text" name="lpnumber" id="lpnumber"><br>
	    	<p style="margin-left:30px" >시설 사진</p>
	    	
	    	<div style="margin-top:50px">
		    	<input id="imageFile" type="file" name="lfile">
			</div>
			<div>
			    <input type="button" value="이미지 미리보기" onclick="ResizeImage()"/>
			</div>
			<div>
			    <img src="" id="output">
			</div>
      <div style="">
         <button onclick="locationsubmit()" class="button1">시설 등록</button>
      </div>
    </form>
      </div>
   </div>
   

 
    <div class="modal">
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
	    	
	    	<p style="margin-left:30px">제품 수량</p>
	    	<input type="text" name="pamount" id="pamount"><br>
	    	
	    	<p style="margin-left:30px" >제품 사진</p>
	    	
	    	<div style="margin-top:50px">
		    	<input id="imageFile" type="file" name="pfile">
			</div>
			<div>
			    <input type="button" value="이미지 미리보기" onclick="ResizeImage()"/>
			</div>
			<div>
			    <img src="" id="output">
			</div>

      <div style="">
         <button onclick="productsubmit()" class="button1">제품 등록</button>
      </div>
    </form>
      </div>
    </div>

     
    
   
<script language = "javascript">
function ResizeImage() {
var filesToUpload = document.getElementById('imageFile').files;
var file = filesToUpload[0];

var img = document.createElement("img");

// 파일을 읽을 수 있는 File Reader 를 생성합니다
var reader = new FileReader();

    // 파일이 읽혀지면 아래 함수가 실행됩니다
reader.onload = function(e) {
        img.src = e.target.result;
        
// HTML5 canvas 객체를 생성합니다
        var canvas = document.createElement("canvas");      
        var ctx = canvas.getContext("2d");
        // 캔버스에 업로드된 이미지를 그려줍니다
        ctx.drawImage(img, 0, 0);
        // 최대폭을 400 으로 정했다고 가정했을때
        // 최대폭을 넘어가는 경우 canvas 크기를 변경해 줍니다.
        var MAX_WIDTH = 400;
        var MAX_HEIGHT = 400;
        var width = img.width;
        var height = img.height;
        
        if (width > height) {
            if (width > MAX_WIDTH) {
                height *= MAX_WIDTH / width;
                width = MAX_WIDTH;
            }
        } else {
            if (height > MAX_HEIGHT) {
                width *= MAX_HEIGHT / height;
                height = MAX_HEIGHT;
            }
        }
        canvas.width = width;
        canvas.height = height;
        // canvas에 변경된 크기의 이미지를 다시 그려줍니다.
        var ctx = canvas.getContext("2d");
        ctx.drawImage(img, 0, 0, width, height);
        
// canvas 에 있는 이미지를 img 태그로 넣어줍니다
        var dataurl = canvas.toDataURL("image/png");
        document.getElementById('output').src = dataurl;
    }
    
reader.readAsDataURL(file);
}
</script>

<script language = "javascript">
function ResizeImage() {
var filesToUpload = document.getElementById('imageFile').files;
var file = filesToUpload[0];
// 문서내에 img 객체를 생성합니다
var img = document.createElement("img");

// 파일을 읽을 수 있는 File Reader 를 생성합니다
var reader = new FileReader();

    // 파일이 읽혀지면 아래 함수가 실행됩니다
reader.onload = function(e) {
        img.src = e.target.result;
        
// HTML5 canvas 객체를 생성합니다
        var canvas = document.createElement("canvas");      
        var ctx = canvas.getContext("2d");
        // 캔버스에 업로드된 이미지를 그려줍니다
        ctx.drawImage(img, 0, 0);
        // 최대폭을 400 으로 정했다고 가정했을때
        // 최대폭을 넘어가는 경우 canvas 크기를 변경해 줍니다.
        var MAX_WIDTH = 400;
        var MAX_HEIGHT = 400;
        var width = img.width;
        var height = img.height;
        
        if (width > height) {
            if (width > MAX_WIDTH) {
                height *= MAX_WIDTH / width;
                width = MAX_WIDTH;
            }
        } else {
            if (height > MAX_HEIGHT) {
                width *= MAX_HEIGHT / height;
                height = MAX_HEIGHT;
            }
        }
        canvas.width = width;
        canvas.height = height;
        // canvas에 변경된 크기의 이미지를 다시 그려줍니다.
        var ctx = canvas.getContext("2d");
        ctx.drawImage(img, 0, 0, width, height);
        
// canvas 에 있는 이미지를 img 태그로 넣어줍니다
        var dataurl = canvas.toDataURL("image/png");
        document.getElementById('output').src = dataurl;
    }
    
reader.readAsDataURL(file);
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