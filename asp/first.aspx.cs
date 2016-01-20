using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class first : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

       //change by hxq 第一页始终显示
       // if (GlobalConf.VICTORY == true)
       // {
       //     Response.Redirect("third.html", false);
       // }  
    }
}