<%@ Page Language="C#" AutoEventWireup="true" CodeFile="first.aspx.cs" Inherits="first" %>

<!DOCTYPE html>

<html style="width:100%;height:100%;overflow:hidden;position:relative;" xmlns="http://www.w3.org/1999/xhtml">
 <head runat="server">
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta content="target-densitydpi=device-dpi,width=750" name="viewport">
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<meta content="telephone=no,email=no" name="format-detection" />
<title>江河向前冲</title>
<link href="css/common.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/firstth.css"/>
</head>
<body style="width:100%;height:100%;overflow:hidden;position:relative;font-size:0;">
    <form id="form1" runat="server"> 
         
    <div class="index_container">
    	<img src="images/bg_1.jpg" alt="" class="img_bg1">
    	<div class="people_box">
			<!-- <img src="images/people.png" alt=""> -->
		</div>
		<div class="company_logo" id='start-logo'>
			<!-- <img src="images/company_logo.jpg" alt=""> -->
		</div>
		<div class="start" id="start-btn">
			<img src="images/sbtn1.png" alt="" id="star-img">
		</div>
    </div>
<script>
	var oImg=document.getElementById('star-img');
    var oDiv=document.getElementById('start-btn');
    var oDivLogo=document.getElementById('start-logo');
		var i=1;
		setInterval(function(){
			i++;
			oImg.src='images/sbtn'+i+'.png';
			if(i==2){
				i=0;
			}
		},500);
    oImg.addEventListener('touchstart',function(){
      window.location.href='second.aspx';
    });
</script>
<script type="text/javascript" src="js/MetaHandler.js"></script>
 
 </form>
</body>
</html>
