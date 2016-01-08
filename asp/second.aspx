<%@ Page Language="C#" AutoEventWireup="true" CodeFile="second.aspx.cs" Inherits="second" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta content="target-densitydpi=device-dpi,width=750" name="viewport">
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<meta content="telephone=no,email=no" name="format-detection" />
<title>江河2016年会</title>
<link href="css/common.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/style.css"/>   
<!-- 自动刷新页面 隔10秒刷一次
<meta http-equiv="refresh" content="10">
 -->     
</head>
<body>
     <form id="form2" runat="server">
    <div class="secound_container">
	<img src="images/bg_2.jpg" alt="" class="img_bg2">
	<div class="header_go"></div>
	<div class="description">
		<p>操作说明</p>
		<p>旋动下方圆形按钮，从左向右顺时针旋转，即可为江河充电加油</p>
	</div>
	<div class="circleBtn">
		<div class="otercir_bor"></div>
		<div class="inercir_bor"></div>
		<div class="rotate" id='box'>
			<img id="img" src="images/outer_circle.png" class="outer_circle" /> 
			<span id="btn" class="click"><img id="middlecir" src="images/inner_btn.png" alt=""> </span>
			<span class="elect" id='span1'></span>
		</div>
	</div>

    <div>  
        <asp:ScriptManager ID="ScriptManager1" runat="Server" ></asp:ScriptManager><!--必须包含这个控件，否则UpdatePanel无法使用-->  
    </div>  

	<div class="battery_box">
    	<img src="images/battery.png" alt="">
        
    	  <em class="pecent_num"> <asp:UpdatePanel ID="UpdatePanel1" runat="server">  
                <ContentTemplate>
            <!--Lable和Timer控件必须都包含在UpdatePanel控件中 -->  
                    <asp:Label ID="result" runat="server" Text="Label">%</asp:Label>  <!--用于显示时间-->  
                    <asp:Timer ID="Timer1" runat="server" Interval="1000"></asp:Timer><!-- 用于更新时间，每1秒更新一次-->  
                </ContentTemplate>                  
            </asp:UpdatePanel>     </em>   
    	<div class="electric_box" id="electric_btn">
    		<span></span>
	    	<span></span>
	    	<span></span>
	    	<span></span>
	    	<span></span>
			<span></span>
	    	<span></span>
			<span></span>
	    	<span></span>
			<span></span>
    	</div>	
    </div>

    
   
</div> 
         </form>
<script>
    window.onload = function () {
        var oBtn = document.getElementById('btn');
        var oImg = document.getElementById('img');
        oBtn.onclick = function () {
            oImg.className = 'icon-play';

            setTimeout(function () {
                oImg.className = ' ';
            }, 5000);
        }
    }

</script>
  <script type="text/javascript">
      var oSpan = document.getElementById('span1');
      var a = 90; // 角度
      var oDiv = document.getElementById('box');
	  var sourceLeft=oSpan.offsetLeft;
      var sourceTop=oSpan.offsetTop;
      var R=oDiv.offsetWidth/2;
      var Bigtimer = null;
      var smalltimer = null;
      var b=160;
	  var c=0;
	  var op=0;
      var middlecirTimer=null;
//手指滑动
	var oImg=document.getElementById('img');
	// var ocolorcir=document.getElementById('colorcir');
	var imgdeg=0;
	oImg.addEventListener("touchmove", function(){
		clearInterval(middlecirTimer);
		
		imgdeg+=2;
		console.log(imgdeg);
		oImg.style['-webkit-transform']='rotate('+imgdeg+'deg)';
	});
//手指点击中间部分
	var omiddlecir=document.getElementById('middlecir');
	omiddlecir.addEventListener('touchstart',function(){
		clearInterval(Bigtimer);
		clearInterval(middlecirTimer);
		middlecirTimer=setInterval(function(){
			imgdeg+=2;
			oImg.style['-webkit-transform']='rotate('+imgdeg+'deg)';
		},1);
      drowLine()

	})
  function drowLine(){
      Bigtimer=setInterval(function (){
        a+=0.5;
        c+=0.5;
        op+=0.01;
       // console.log(c)
        if(a>=270){
          var x=0;
          b--;
          if(b<=-200){
            b=160;
            a=90;
            c=0;
            clearInterval(Bigtimer);
            oSpan.style.top=sourceTop+'px';
            oSpan.style.left=sourceLeft+'px';
          	oSpan.style.opacity=0;
            drowLine()
          }else {
            oSpan.style.left=(x-4)+'px';
            oSpan.style.top=b+'px';
          }
        }else{
          var x=R+R*Math.sin(d2a(a));
          var y=R-R*Math.cos(d2a(a));
          oSpan.style.transform='rotate('+c+'deg)'
          oSpan.style.opacity=op;
          oSpan.style.left=(x-4)+'px';
          oSpan.style.top=y+'px';
        }

      }, 1);
  };
  function d2a(n)
  {
    return n*Math.PI/180;
  }
</script>
<script>
    window.onload = function () { 
        var oDivelect = document.getElementById('electric_btn')
        var aSpan = oDivelect.getElementsByTagName('span');   // 获取标签为span的数组
        var spanLength = aSpan.length;                       //获取数组长度
        var index = spanLength - 1;							   // 游标,因为数组是从0开始  这里减去1					

        var _percent = 0;
        var max = 3;

        _percent = '<%= percent %>';
       

        index = 9;
         
        setInterval(function(){
            _percent = document.getElementById('result').textContent;
            max = Math.ceil(_percent / 10);
             
            if (index >= 10 - max)                                    //如果游标大于等于0给位于aSpan数组第Index处的span对象className赋值
            {

                var objSpan = aSpan[index];                   //得到要赋值的span对象

                objSpan.className = 'electric';              //给该span的className赋值

                index--;								  //游标减一，给下一次跳进这个函数的下一个span赋值	
            } else if (_percent >= 100) {
                
                document.getElementById('show3').textContent = "完成充电"; 
                setTimeout(" window.location = 'thrid.html';", 5000);
               
            }
            else {
                //index = spanLength - 1;
                index = 9;
                clearall();
                //当游标小于0时可以在此处终止计时器,充满电后的处理
                //alert("hello   world!");

            }
            document.getElementById('l_percent').textContent = _percent;
            document.getElementById('pecent_num').textContent = _percent+ "%";
            timedCount();

        }, 800);

        /*
            var oEbtn=document.getElementById('electric_btn');
            var aSpan=document.getElementsByTagName('span');
            function add(){
                
                for(var i=0;i<aSpan.length;i++){
                    
                    if(aSpan[i].className==""){
                        aSpan[i].className='electric';
                        
                        console.log(aSpan[i].className);
                    }
                }
            }
            add();
        */

        function clearall() {

            for (var i = 0; i < aSpan.length; i++) {

                if (aSpan[i].className == "electric") {
                    aSpan[i].className = '';

                    console.log(aSpan[i].className);
                }
            }
        }
        function timedCount() {
            // alert("timecount->"+_percent);
            document.getElementById("l_percent").innerHTML = "timedCount->" + _percent; 
            
            //  setTimeout("timedCount()", 3000);
        }

    }
</script>
<script type="text/javascript" src="js/MetaHandler.js"></script>
</body>
</html>





















 