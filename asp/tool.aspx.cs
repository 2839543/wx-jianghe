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

        if (GlobalConf.START_VOTE)
        {
            btn_start.BackColor = System.Drawing.Color.GreenYellow;
        }
        else
        {
            btn_start.BackColor = System.Drawing.Color.Red;
        }

        if (GlobalConf.HALFWAY_PAUSE)
        {
            Button4.BackColor = System.Drawing.Color.Red; 
        }
        else
        { 
            Button4.BackColor = System.Drawing.Color.GreenYellow;
        }

        if(GlobalConf.VICTORY){
            Button2.BackColor = System.Drawing.Color.GreenYellow ;
        }
        else
        {
            Button2.BackColor = System.Drawing.Color.Red;
        }
    } 

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (GlobalConf.VICTORY)
        {
            GlobalConf.VICTORY = false;
            Button2.Text = "点击结束电池充电页面，转换至江河3页面";
            Button2.BackColor = System.Drawing.Color.Red;
           
        }else{ 
            GlobalConf.VICTORY = true;
            Button2.Text = "点击切换到电池充电页面，屏蔽页面3 ";
            Button2.BackColor = System.Drawing.Color.GreenYellow;
        }
        
    }
    
    protected void Button4_Click(object sender, EventArgs e)
    {
        if (GlobalConf.HALFWAY_PAUSE)
        {
            GlobalConf.HALFWAY_PAUSE = false;
            Button4.Text = "点击切换为最高显示66%";
            Button4.BackColor = System.Drawing.Color.GreenYellow;

        }
        else
        {
            GlobalConf.HALFWAY_PAUSE = true;

            Button4.Text = "点击切换为正常投票计数";
            Button4.BackColor = System.Drawing.Color.Red;
        }
    }
    protected void btn_start_Click(object sender, EventArgs e)
    {
        if (GlobalConf.START_VOTE)
        {
            GlobalConf.START_VOTE = false;
            btn_start.Text = "点击开始投票计数";
            btn_start.BackColor = System.Drawing.Color.Red;

        }
        else
        {
            GlobalConf.START_VOTE = true;
            btn_start.Text = "点击停止投票计数";
            btn_start.BackColor = System.Drawing.Color.GreenYellow;
        }
    }
}