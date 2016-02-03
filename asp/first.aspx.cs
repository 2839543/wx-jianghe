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
 
    	// change by hxq 100 % only show page 3 2016/1/23
         if (GlobalConf.VICTORY == true)
         {
            Response.Redirect("third.html", false);
        }  
    }
}