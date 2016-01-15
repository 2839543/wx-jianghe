/**
 *
 * @authors zhangjingyun (you@example.org)
 * @date    2016-01-15 22:45:48
 * @version $Id$
 */
 window.onload=function(){
      var oSpan=document.getElementById('span1');
      // var a=90; // 角度
      var oDiv=document.getElementById('box');
       var oChangeImg = document.getElementById('pic');
      var oChangeImg1 = document.getElementById('pics');
      var middlecirTimer=null;
      var electtop=null;
      var electbottom=null;
      var spantimer=null;
      var sourceTimer1=null;
      var sourceTimer2=null;
      var addtwinkletimer=null;
      var removetwinkletimer=null;
      var falg=true;
  //手指滑动
    var oImg=document.getElementById('img');
    // var ocolorcir=document.getElementById('colorcir');
    var imgdeg=0;

  //手指点击中间部分
    var omiddlecir=document.getElementById('middlecir');
      omiddlecir.addEventListener('touchstart',function(e){
      e.preventDefault();
      clearTimeout(electtop);
      clearTimeout(electbottom);
      clearTimeout(sourceTimer1);
      clearTimeout(sourceTimer2);
      clearTimeout(addtwinkletimer);
      clearTimeout(removetwinkletimer);
      imgdeg+=720;
      console.log(imgdeg)
      oImg.style['-webkit-transform']='rotate('+imgdeg+'deg)';
      // drowLine()
      //电池变化
      electtop=setTimeout(function change(){
          oChangeImg.src = 'images/shine_battery.png';
          sourceTimer1=setTimeout(function(){
            oChangeImg.src = 'images/battery.png';
          },50);
      },25);
    //电流图片
      electbottom=setTimeout(function(){
        oChangeImg1.src='images/line_before.png';
          sourceTimer2=setTimeout(function(){
            oChangeImg1.src ='images/line_after.png';
          },50);
      },25);

   //改变电量变化
      var oDivelect=document.getElementById('electric_btn')
      var aSpan=oDivelect.getElementsByTagName('span');   // 获取标签为span的数组
      var spanLength=aSpan.length;                       //获取数组长度
      var index=spanLength-1;                // 游标,因为数组是从0开始  这里减去1

      var max = 3;
      if(falg){
        falg=false;
        abc();
      }
      function abc(){

        spantimer=setInterval(function(){
            var electlenght=$('.electric').length
            console.log(electlenght);
          if(index >= spanLength - max )
          {
            $('.electric_box span').eq(index).addClass('electric');
            index--;                  //游标减一，给下一次跳进这个函数的下一个span赋值
          }else if(electlenght==max){
                falg=true;
                addtwinkle()
                // alert('充电完成')
                clearInterval(spantimer);
          }else{
            alert(1)
            index = spanLength-1;
            clearall();
            //abc()
             //当游标小于0时可以在此处终止计时器,充满电后的处理
            //alert("hello   world!");

          }

        },2000);
      }

      function clearall(){

          for(var i=0;i<aSpan.length;i++){

            if(aSpan[i].className=="electric"){
              aSpan[i].className='';

              console.log(aSpan[i].className);
            }
          }
        }
      //电池内部电量变化
      addtwinkle=function(){
        for(var i=0;i<spanLength;i++){
          $('.electric_box span').eq(i).addClass('twinkleName');
        }
      }
      removetwinkle=function(){
        for(var i=0;i<spanLength;i++){
          $('.electric_box span').eq(i).removeClass('twinkleName');
        }
      }

      addtwinkletimer=setTimeout(function(){
        addtwinkle();
        removetwinkletimer=setTimeout(function(){
          removetwinkle()
        },1000);
      },500)
    });
 };

