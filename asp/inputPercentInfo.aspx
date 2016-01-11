<%@ Page Language="C#" AutoEventWireup="true" CodeFile="inputPercentInfo.aspx.cs" Inherits="inputPercentInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;"  />
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
            <hr />
            <asp:Label ID="Label3" runat="server" Text="年会上线功能区"></asp:Label>
            <br />
    </div>  
    <table style=" position: absolute; margin-left:10px; margin-right:200px; margin-top:0px; width:635px; height:106px; top: 10px; left: 10px;">  
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
                     是否打开页面3，关闭电池充电页面：
                    <asp:Label ID="victoryState" runat="server" Text="是否打开页面3，关闭电池充电页面 "></asp:Label>  <!--用于显示是否显示年会页面3-->   
                    <br />
                </ContentTemplate>                  
            </asp:UpdatePanel>     
            </td>  
        </tr>  
    </table>  





    <div>
    
        <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="注意上传文件会将数据库表（battery表）清空再上传数据！"></asp:Label>
    
    </div>
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="upload file to db" />
        <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="点击结束电池充电页面，转换江河3页面" />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <hr />
        <p>
            测试用工具区</p>
        <p>
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="切换到电池充电页面，屏蔽页面3" />
        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="设置开关暂停百分比" />
        </p>
        <p>
            <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="查看暂停设置" />
            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
        </p>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
