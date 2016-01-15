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
<link rel="stylesheet" type="text/css" href="css/second.css"/>
<body>
     <form id="form2" runat="server">
    <div class="secound_container">
	<img src="images/bg_2.jpg" alt="" class="img_bg2">
	<div class="header_go"></div>
	<div class="description">
		<p>操作说明</p>
		<p>点击充电，即可为江河充电加油</p>
	</div>
	<div class="circleBtn">
    <div class="otercir_bor"></div>
    <div class="inercir_bor"></div>
		<img src="images/line_after.png" alt="" class="line_before" id="pics" data-stade='0'>
		<div class="rotate" id='box'>
 			<div style="position: relative;width=332px;height: 332px">
			<img id="img" src="images/outer_circle.png" class="outer_circle" style="-webkit-transition:2s all ease;"/>
			<img src="images/color_circle.png" class="color_circle icon-play" id="img2" alt="">
			<span id="btn" class="click"><img id="middlecir" src="images/inner_btn.png" alt="" > </span>
		</div>
		<span class="elect" id='span1'></span>
	</div>
    </div>
    <div>  
        <asp:ScriptManager ID="ScriptManager1" runat="Server" ></asp:ScriptManager><!--必须包含这个控件，否则UpdatePanel无法使用-->  
    </div>  

	<div class="battery_box" id="battery_shine">
    	<img src="images/battery.png" alt="" id="pic" data-status='0'>

        
          <em class="pecent_num"> <asp:UpdatePanel ID="UpdatePanel1" runat="server">  
                <ContentTemplate>
            <!--Lable和Timer控件必须都包含在UpdatePanel控件中 -->  
                    <asp:Label ID="result" runat="server" Text="Label">%</asp:Label>  <!--用于显示时间-->  
                    <asp:Label ID="lbl_none" Text="Label">%</asp:Label> 
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
<script type="text/javascript" src="js/zepto.js"></script>
<script type="text/javascript" src="js/second.js"></script>
<script type="text/javascript" src="js/MetaHandler.js"></script>
</body>
</html>





















 