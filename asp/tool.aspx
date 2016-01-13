<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tool.aspx.cs" Inherits="inputPercentInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta content="target-densitydpi=device-dpi,width=750" name="viewport">
<!--
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;"  />
    
    -->
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <div>  
        <asp:ScriptManager ID="ScriptManager1" runat="Server" ></asp:ScriptManager>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <hr />
            <asp:Label ID="Label3" runat="server" Text="年会上线功能区"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Font-Size="XX-Large" style="text-align: center" Text="︾启动从0开始计数︾" Width="100%"></asp:Label>
            <br />





            <asp:Button ID="btn_start" runat="server" OnClientClick="return confirm('Are u sure?');" OnClick="btn_start_Click" Text="点击开始投票计数" Height="250px" Width="100%" BackColor="Red" Font-Size="XX-Large"/>
            <br />
            <br />
            <br />
            <asp:Label ID="Label6" runat="server" Font-Size="XX-Large" style="text-align: center" Text="︾66%计数管理︾" Width="100%"></asp:Label>
            <br />
            <br />
    </div>  
    <table style=" position: absolute; margin-left:10px; margin-right:200px; margin-top:0px; width:1282px; height:212px; top: 10px; left: 10px;">  
        <tr>  
           <td>动态显示实时时间</td>  
        </tr>  
        <tr>  
            <td style="height:20px;">  
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">  
                <ContentTemplate>当前时间是：  
            <!--Lable和Timer控件必须都包含在UpdatePanel控件中 -->  
                    <asp:Label ID="showTime" runat="server" Text="date Time "></asp:Label>  <!--用于显示时间-->  
                    <asp:Timer ID="Timer1" runat="server" Interval="1000"></asp:Timer>
                    <br />
                     <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="是否打开页面3，关闭电池充电页面："></asp:Label>
                    &nbsp;<asp:Label ID="victoryState" runat="server" Text="是否打开页面3，关闭电池充电页面 " Font-Size="XX-Large"></asp:Label>  <!--用于显示是否显示年会页面3-->   
                    <br />
                </ContentTemplate>                  
            </asp:UpdatePanel>     
            </td>  
        </tr>  
    </table>  





            <asp:Button ID="Button4" runat="server" OnClientClick="return confirm('Are u sure?');" OnClick="Button4_Click" Text="点击切换为正常投票计数" Height="250px" Width="100%" BackColor="Red" Font-Size="XX-Large"/>
        <br />
        <br />
        <asp:Label ID="Label7" runat="server" Font-Size="XX-Large" style="text-align: center" Text="︾启用烟花页面管理︾" Width="100%"></asp:Label>
        <br />





        <br />
        <asp:Button ID="Button2" runat="server" OnClientClick="return confirm('Are u sure?');"  OnClick="Button2_Click" Text="点击结束电池充电页面，转换江河3页面" Height="250px" Width="100%" BackColor="Red" Font-Size="XX-Large" />
        <br />
        <br />
        <hr />
        <p>
            测试用工具区</p>
        <p>
            &nbsp;</p>
    </form>
    <script type="text/javascript" src="js/MetaHandler.js"></script>
</body>
</html>
