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
        if (GlobalConf.VICTORY)
        {
            GlobalConf.VICTORY = false;
            Button2.Text = "点击结束电池充电页面，转换江河3页面"; 
            Button2.BackColor = System.Drawing.Color.Red; 
           
        }else{ 
            GlobalConf.VICTORY = true;
            Button2.Text = "点击切换到电池充电页面，屏蔽页面3 ";
            Button2.BackColor = System.Drawing.Color.GreenYellow;
        }
        
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        GlobalConf.VICTORY = false;
    }
}