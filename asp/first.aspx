﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="first.aspx.cs" Inherits="first" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
 <head runat="server">
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta content="target-densitydpi=device-dpi,width=750" name="viewport">
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<meta content="telephone=no,email=no" name="format-detection" />
<title>第一页</title>
<link href="css/common.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/style.css"/>
</head>
<body>
    <form id="form1" runat="server"> 
         
    <div class="index_container">
    	<img src="images/bg_1.jpg" alt="" class="img_bg1">
    	<div class="people_box">
			<!-- <img src="images/people.png" alt=""> -->
		</div>
		<div class="company_logo">
			<!-- <img src="images/company_logo.jpg" alt=""> -->
		</div>
		<div class="start" id="start-btn">
            <a href="second.aspx"><img src="images/start_btn.png" alt="" id="star-img"></a>
			
		</div>
    </div>
<script>
    var oBtn = document.getElementById('start-btn');
    var oImg = document.getElementById('star-img');
    oBtn.addEventListener('touchstart', function () {
        oImg.src = 'images/strat_btn_click.jpg';
    });

    oBtn.addEventListener('touchend', function () {
        oImg.src = 'images/start_btn.jpg';
    });
</script>
<script type="text/javascript" src="js/MetaHandler.js"></script>
 
 </form>
</body>
</html>
