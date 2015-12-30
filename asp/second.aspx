<%@ Page Language="C#" AutoEventWireup="true" CodeFile="second.aspx.cs" Inherits="second" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<!-- 自动刷新页面 隔10秒刷一次
<meta http-equiv="refresh" content="10">
 -->
<title>battery</title>
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;"  />
<link href="" rel="stylesheet">
<style>
	.battery_box{position: relative;margin:5px auto;}
	.electric_box{position: absolute;left:13px;top:35px;}
	.electric_box span{display: block; height: 8px;margin: 5px auto;width: 66px;}
	.electric{width: 66px;height: 8px;background: orange;display: block;margin:5px auto;}
</style>
</head>
<script>  

    window.onload = function () {


        var aSpan = document.getElementsByTagName('span');   // 获取标签为span的数组
        var spanLength = aSpan.length;                       //获取数组长度
        // alert("spanlenght-> " + spanLength );
        var index = spanLength - 1;							   // 游标,因为数组是从0开始  这里减去1					
        var _percent = 0;
        var max = 3;
       
         _percent = '<%= percent %>' ;

        
        //alert("percent=" + max);
       
        index = 9;
       // alert("percent2 =" + max);
        setInterval(function () {
            _percent = document.getElementById('result').textContent;
            max = Math.ceil(_percent / 10);

            // alert("max -> " + max + " _percent -> " + _percent + " spanLength -> " + spanLength + " spanLength - max -> " + (spanLength - max));
            
            // if (index >= spanLength - max)                                    //如果游标大于等于0给位于aSpan数组第Index处的span对象className赋值
            if (index >= 10 - max)
            {

                var objSpan = aSpan[index];                   //得到要赋值的span对象

                objSpan.className = 'electric';              //给该span的className赋值

                index--;								  //游标减一，给下一次跳进这个函数的下一个span赋值	
            } else if (_percent >= 100) {
                
                document.getElementById('show3').textContent = "完成充电"; 
                setTimeout(" window.location = 'thrid.html';", 5000);
               
            } else {
                //index = spanLength - 1;
                index = 9;
                clearall();
                //当游标小于0时可以在此处终止计时器,充满电后的处理
                //alert("hello   world!");
                
            }
            document.getElementById('l_percent').textContent = _percent;

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
<body>
    <form id="form1" runat="server">
    <div class="div2"> 
    </div>
    <div class="battery_box">
    	<img src="images/battery.jpg" alt="">
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

    <label id="l_percent"  > test info </label> 

    <label id="show3"  > 充电中 </label> 


    <div>  
        <asp:ScriptManager ID="ScriptManager1" runat="Server" ></asp:ScriptManager><!--必须包含这个控件，否则UpdatePanel无法使用-->  
    </div>  
    <table style=" position: absolute; margin-left:200px; margin-right:200px; margin-top:100px; width:270px; height:78px; top: 15px; left: 10px;">  
        <tr>  
           <td>电池百分比</td>  
        </tr>  
        <tr>  
            <td style="height:100px;">  
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">  
                <ContentTemplate>当前数值为：  
            <!--Lable和Timer控件必须都包含在UpdatePanel控件中 -->  
                    <asp:Label ID="result" runat="server" Text="Label"></asp:Label>  <!--用于显示时间-->  
                    <asp:Timer ID="Timer1" runat="server" Interval="1000"></asp:Timer><!-- 用于更新时间，每1秒更新一次-->  
                </ContentTemplate>                  
            </asp:UpdatePanel>     
            </td>  
        </tr>  
    </table>  
        </form>
</body>
</html>