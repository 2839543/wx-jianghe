<%@ Page Language="C#" AutoEventWireup="true" CodeFile="first.aspx.cs" Inherits="first" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;"  />
    <title></title>
 <link type="text/css" rel="stylesheet" href="css/stylesheet.css" />
</head>
<body>
    <form id="form1" runat="server">
  
    
<div class="div1"> 
</div>



    <div>  
        <asp:ScriptManager ID="ScriptManager1" runat="Server" ></asp:ScriptManager><!--必须包含这个控件，否则UpdatePanel无法使用-->  
    </div>  
    <table style=" position: absolute; margin-left:200px; margin-right:200px; margin-top:100px; width:270px; height:78px; top: 15px; left: 10px;">  
        <tr>  
           <td>动态显示实时时间</td>  
        </tr>  
        <tr>  
            <td style="height:100px;">  
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">  
                <ContentTemplate>当前时间是：  
            <!--Lable和Timer控件必须都包含在UpdatePanel控件中 -->  
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>  <!--用于显示时间-->  
                    <asp:Timer ID="Timer1" runat="server" Interval="1000"></asp:Timer><!-- 用于更新时间，每1秒更新一次-->  
                </ContentTemplate>                  
            </asp:UpdatePanel>     
            </td>  
        </tr>  
    </table>  
    </form>
</body>
</html>
