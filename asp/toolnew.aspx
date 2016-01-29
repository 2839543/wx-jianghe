<%@ Page Language="C#" AutoEventWireup="true" CodeFile="toolnew.aspx.cs" Inherits="inputPercentInfo" %>

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
            <asp:Label ID="lbl_vote" runat="server" Font-Size="XX-Large" style="text-align: center" Text="︾启动从0开始计数︾" Width="100%" BackColor="Red" Height="200px"></asp:Label>
            <br />
            <br />





            <asp:Button ID="btn_start_vote" runat="server" OnClientClick="return confirm('Are u sure?');" OnClick="btn_start_vote_Click" Text="开始投票计数" Height="250px" Width="35%" BackColor="GreenYellow" Font-Size="XX-Large"/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;





            <asp:Button ID="btn_stop_vote" runat="server" OnClientClick="return confirm('Are u sure?');" OnClick="btn_stop_vote_Click" Text="关闭投票计数" Height="250px" Width="35%" BackColor="Red" Font-Size="XX-Large"/>
            <br />
            <br />
            <br />
            <asp:Label ID="lbl_66" runat="server" Font-Size="XX-Large" style="text-align: center" Text="︾66%计数管理︾" Width="100%" BackColor="Red" Height="200px"></asp:Label>
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





            <asp:Button ID="btn_visible_66" runat="server" OnClientClick="return confirm('Are u sure?');" OnClick="btn_visible_66_Click" Text="切换为正常投票计数" Height="250px" Width="35%" BackColor="GreenYellow" Font-Size="XX-Large"/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  





            <asp:Button ID="btn_only_66" runat="server" OnClientClick="return confirm('Are u sure?');" OnClick="btn_only_66_Click" Text="切换为最高显示66%" Height="250px" Width="35%" BackColor="Red" Font-Size="XX-Large"/>
        &nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <asp:Label ID="lbl_fire" runat="server" Font-Size="XX-Large" style="text-align: center" Text="︾启用烟花页面管理︾" Width="100%" BackColor="Red" Height="200px"></asp:Label>
        <br />





        <br />
        <asp:Button ID="btn_show_3" runat="server" OnClientClick="return confirm('Are u sure?');"  OnClick="btn_show_3_Click" Text="切换为仅江河3页面" Height="250px" Width="35%" BackColor="GreenYellow" Font-Size="XX-Large" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btn_visible_3" runat="server" OnClientClick="return confirm('Are u sure?');"  OnClick="btn_visible_3_Click" Text="切换到电池充电页面，屏蔽页面3" Height="250px" Width="35%" BackColor="Red" Font-Size="XX-Large" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <hr />
        <p>
            测试用工具区<asp:Button ID="Button1" runat="server" Text="Button" />
        </p>
        <p>
            &nbsp;</p>
    </form>
    <script type="text/javascript" src="js/MetaHandler.js"></script>
</body>
</html>
