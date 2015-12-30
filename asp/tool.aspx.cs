using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class inputPercentInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        showTime.Text = DateTime.Now.ToString();
        victoryState.Text = GlobalConf.VICTORY.ToString();
    }
     

    
    protected void Button2_Click(object sender, EventArgs e)
    {
        GlobalConf.VICTORY = true;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        GlobalConf.VICTORY = false;
    }
}