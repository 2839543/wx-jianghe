<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
 
</head>
    
<body  onload="myfunction()">
   

   <script type="text/javascript">
        
       //   var value = "<%=Messages%>";
       var counts = "<%=Counts%>";
        //  var srcUrl = "http://baidu.com";

       function myfunction() {
         //  alert(value);
          // document.getElementById("test").innerHTML ="src->"+ srcUrl;
           document.getElementById("test").innerHTML ="src->"+ counts;
       }
     </script> 


    <form id="form1" runat="server">
        <div id="test">
</div>

  <asp:ScriptManager ID="ScriptManager1" runat="server">
  </asp:ScriptManager>
      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
      <ContentTemplate>
        <asp:Timer ID="Timer1" runat="server" Interval="6000" ontick="Timer1_Tick">
        </asp:Timer>
      </ContentTemplate>
      </asp:UpdatePanel>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <asp:HiddenField ID="HiddenField1" runat="server" OnValueChanged="HiddenField1_ValueChanged" />
       



<p>Count numbers: <output id="result1"></output></p>
<button onclick="startWorker()">Start Worker</button>
<button onclick="stopWorker()">Stop Worker</button>
<br />
        <asp:Button ID="sqlite" runat="server" OnClick="sqlite_Click" Text="sqlite-test" />
        <br />
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="select" />
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="insert" />
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="update" />
        <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="delete" />
        <br />

<script type="text/javascript">
    var w;

    function startWorker()
    {
        if(typeof(Worker)!=="undefined")
        {
            if(typeof(w)=="undefined")
            {
                w=new Worker("demo_workers.js");
            }
            w.onmessage = function (event) {
                document.getElementById("result1").innerHTML=event.data;
            };
        }
        else
        {
            document.getElementById("result1").innerHTML="Sorry, your browser does not support Web Workers...";
        }
    }

    function stopWorker()
    {
        w.terminate();
    }
</script>
  
         
</form> 
</body>
</html>
