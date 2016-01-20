<%@ Page Language="C#" AutoEventWireup="true" CodeFile="second.aspx.cs" Inherits="second" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <meta content="target-densitydpi=device-dpi,width=750" name="viewport">
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no,email=no" name="format-detection" />
    <title>江河向前冲</title>
    <link href="css/common.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <body style="width:100%;height:100%;overflow:hidden;position:relative;font-size:0;">
        <form id="form2" runat="server">
            <div class="secound_container">
                <img src="images/bg_2.jpg" alt="" class="img_bg2">
                <div class="header_go"></div>
                <div class="description">
                    <p>操作说明:</p>
                    <p>快速点击白色按纽，即可为江河充电加油</p>
                </div>
                <div class="circleBtn">
                    <div class="otercir_bor"></div>
                    <div class="inercir_bor"></div>
                    <img src="images/line_after.png" alt="" class="line_before" id="pics" data-stade='0'>
                    <div class="rotate" id='box'>
                        <div style="position: relative; width=332px; height: 332px">
                            <img id="img" src="images/outer_circle.png" class="outer_circle" style="-webkit-transition: 2s all ease;" />
                            <img src="images/color_circle.png" class="color_circle icon-play" id="img2" alt="">
                            <span id="btn" class="click">
                                <img id="middlecir" src="images/inner_btn.png" alt="">
                            </span>
                        </div>
                        <span class="elect" id='span1'></span>
                    </div>
                </div>
                <div>
                    <asp:ScriptManager ID="ScriptManager1" runat="Server"></asp:ScriptManager><!--必须包含这个控件，否则UpdatePanel无法使用-->
                </div>

                <div class="battery_box" id="battery_shine">
                    <img src="images/battery.png" alt="" id="pic" data-status='0'>


                    <em class="pecent_num">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <contenttemplate>
            <!--Lable和Timer控件必须都包含在UpdatePanel控件中 -->  
                    <asp:Label ID="result" runat="server" Text="Label">%</asp:Label>  <!--用于显示时间-->  
                    <asp:Label ID="lbl_none" Text="Label">%</asp:Label> 
                    <asp:Timer ID="Timer1" runat="server" Interval="5000"></asp:Timer><!-- 用于更新时间，每1秒更新一次-->  
                </contenttemplate>
                        </asp:UpdatePanel>
                    </em>
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

        <script type="text/javascript">
            window.onload = function () {
                var oSpan = document.getElementById('span1');
                // var a=90; // 角度
                var oDiv = document.getElementById('box');
                var oChangeImg = document.getElementById('pic');
                var oChangeImg1 = document.getElementById('pics');
                var middlecirTimer = null;
                var electtop = null;
                var electbottom = null;
                var spantimer = null;
                var sourceTimer1 = null;
                var sourceTimer2 = null;
                var addtwinkletimer = null;
                var removetwinkletimer = null;
                var falg = true;
                //手指滑动
                var oImg = document.getElementById('img');
                // var ocolorcir=document.getElementById('colorcir');
                var imgdeg = 0;

                window.setInterval(function () { battery_inc() }, 1500);


                //手指点击中间部分
                var omiddlecir = document.getElementById('middlecir');
                omiddlecir.addEventListener('touchstart', function (e) {
                    e.preventDefault();
                    clearTimeout(electtop);
                    clearTimeout(electbottom);
                    clearTimeout(sourceTimer1);
                    clearTimeout(sourceTimer2);
                    clearTimeout(addtwinkletimer);
                    clearTimeout(removetwinkletimer);
                    imgdeg += 720;
                    console.log(imgdeg)
                    oImg.style['-webkit-transform'] = 'rotate(' + imgdeg + 'deg)';
                    // drowLine()
                    //电池变化
                    electtop = setTimeout(function change() {
                        oChangeImg.src = 'images/shine_battery.png';
                        sourceTimer1 = setTimeout(function () {
                            oChangeImg.src = 'images/battery.png';
                        }, 50);
                    }, 25);
                    //电流图片
                    electbottom = setTimeout(function () {
                        oChangeImg1.src = 'images/line_before.png';
                        sourceTimer2 = setTimeout(function () {
                            oChangeImg1.src = 'images/line_after.png';
                        }, 50);
                    }, 25);


                    //电池内部电量变化
                    addtwinkle = function () {
                        for (var i = 0; i < spanLength; i++) {
                            $('.electric_box span').eq(i).addClass('twinkleName');
                        }
                    }
                    removetwinkle = function () {
                        for (var i = 0; i < spanLength; i++) {
                            $('.electric_box span').eq(i).removeClass('twinkleName');
                        }
                    }

                    addtwinkletimer = setTimeout(function () {
                        addtwinkle();
                        removetwinkletimer = setTimeout(function () {
                            removetwinkle()
                        }, 1000);
                    }, 500)
                });
            };

            //改变电量变化
            var oDivelect = document.getElementById('electric_btn')
            var aSpan = oDivelect.getElementsByTagName('span');   // 获取标签为span的数组
            var spanLength = aSpan.length;                       //获取数组长度
            var index = spanLength - 1;                // 游标,因为数组是从0开始  这里减去1
            var _percent = '<%= percent %>';
            var max = 3;

            function battery_inc() {
                var electlenght = $('.electric').length
                console.log(electlenght);

                _percent = document.getElementById('result').textContent;
                max = Math.ceil(_percent / 10);

                // alert( "percent->"+_percent +" index->" + index + "max->" + max + " spanlength->" + spanLength + " electlenght->"+ electlenght );
                if (index >= spanLength - max) {
                    $('.electric_box span').eq(index).addClass('electric');
                    index--;                  //游标减一，给下一次跳进这个函数的下一个span赋值
                } else if (electlenght == max) {
                    index = spanLength - 1;
                    clearall();
                } else {
                    index = spanLength - 1;
                    clearall();
                }
            }

            function clearall() {

                for (var i = 0; i < aSpan.length; i++) {

                    if (aSpan[i].className == "electric") {
                        aSpan[i].className = '';

                        console.log(aSpan[i].className);
                    }
                }
            }

        </script>

        <script type="text/javascript" src="js/zepto.js"></script>
        <script type="text/javascript" src="js/MetaHandler.js"></script>
    </body>
</html>





















