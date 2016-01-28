using log4net.Config;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

[assembly: log4net.Config.XmlConfigurator(Watch = true)]  

public partial class inputPercentInfo : System.Web.UI.Page
{
    //log4net.ILog log = log4net.LogManager.GetLogger("loginfo");
    public static readonly log4net.ILog log = log4net.LogManager.GetLogger("loginfo");
     
    protected void Page_Load(object sender, EventArgs e)
    {
         
        showTime.Text = DateTime.Now.ToString();
        // victoryState.Text = GlobalConf.VICTORY.ToString();
       


        if ( Sqlite_Task_T.GetCurrStatus(GlobalConf.KEY_START_VOTE)== true)
        {
            //log.Info(" [Page_Load] in START_VOTE->" + GlobalConf.START_VOTE + " Green  
            this.lbl_vote.BackColor = System.Drawing.Color.GreenYellow;
        }
        else
        {
            //log.Info(" [Page_Load] in START_VOTE->" + GlobalConf.START_VOTE + " Red"); 
            this.lbl_vote.BackColor = System.Drawing.Color.Red;
        }

        if (Sqlite_Task_T.GetCurrStatus(GlobalConf.KEY_IS_HALFWAY_PAUSE) == true )
        {
            //log.Info(" [Page_Load] in HALFWAY_PAUSE->" + GlobalConf.HALFWAY_PAUSE + " Red"); 
            this.lbl_66.BackColor = System.Drawing.Color.GreenYellow;
        }
        else
        {
            //log.Info(" [Page_Load] in HALFWAY_PAUSE->" + GlobalConf.HALFWAY_PAUSE + " GreenYellow");
            this.lbl_66.BackColor = System.Drawing.Color.Red;
        }

        if (Sqlite_Task_T.GetCurrStatus(GlobalConf.KEY_VICTORY) == true)
        { 
           // log.Info(" [Page_Load] in VICTORY->" + GlobalConf.VICTORY + " GreenYellow");
            this.lbl_fire.BackColor = System.Drawing.Color.GreenYellow;
        }
        else
        {
           // log.Info(" [Page_Load] in VICTORY->" + GlobalConf.VICTORY + " Red");
            this.lbl_fire.BackColor = System.Drawing.Color.Red;
        }
    }

    //开始投票 绿色
    protected void btn_start_vote_Click(object sender, EventArgs e)
    {
        if (!IsPageRefreshed)
        {
            Sqlite_Task_T.Update(GlobalConf.KEY_START_VOTE, "true");
            this.lbl_vote.BackColor = System.Drawing.Color.GreenYellow;
        }
    }

    //停止投票 红色
    protected void btn_stop_vote_Click(object sender, EventArgs e)
    {
        if (!IsPageRefreshed)
        {
            Sqlite_Task_T.Update(GlobalConf.KEY_START_VOTE, "false");
            this.lbl_vote.BackColor = System.Drawing.Color.Red;
        }
    }

    //66% 控制无效   绿色
    protected void btn_visible_66_Click(object sender, EventArgs e)
    {
        if (!IsPageRefreshed)
        {
            Sqlite_Task_T.Update(GlobalConf.KEY_IS_HALFWAY_PAUSE, "true");
            this.lbl_66.BackColor = System.Drawing.Color.GreenYellow;
        }
    }

    //仅显示到 66%  红色
    protected void btn_only_66_Click(object sender, EventArgs e)
    {
        if (!IsPageRefreshed)
        {
            Sqlite_Task_T.Update(GlobalConf.KEY_IS_HALFWAY_PAUSE, "false");
            this.lbl_66.BackColor = System.Drawing.Color.Red;
        }
    }

    //仅显示烟花页面 绿色 
    protected void btn_show_3_Click(object sender, EventArgs e)
    {
        if (!IsPageRefreshed)
        {
            Sqlite_Task_T.Update(GlobalConf.KEY_VICTORY, "true");
            GlobalConf.VICTORY = true;
            this.lbl_fire.BackColor = System.Drawing.Color.GreenYellow;
        }
    }

    //不显示烟花页面 红色 
    protected void btn_visible_3_Click(object sender, EventArgs e)
    {
        if (!IsPageRefreshed)
        {
            Sqlite_Task_T.Update(GlobalConf.KEY_VICTORY, "false");
            GlobalConf.VICTORY = false;
            this.lbl_fire.BackColor = System.Drawing.Color.Red;
        }
    } 


    //private static ILog log = LogManager.GetLogger(typeof(RefreshServe));

    private readonly string REFRESH_TICKET_NAME = "__RefreshTicketArray";
    private readonly string HIDDEN_FIELD_NAME = "__RefreshHiddenField";
    private readonly string HIDDEN_PAGE_GUID = "__RefreshPageGuid";

    /// <summary>
    /// 为True表示页面刷新,False为正常提交
    /// </summary>
    public bool IsPageRefreshed
    {
        get
        {
            if (IsPostBack && !CheckRefreshFlag())
            {
                //log.Debug("刷新了页面");
                return true;
            }
            else
            {
                //log.Debug("正常提交");
                return false;
            }
        }
    }

    /// <summary>
    /// 呈现前更新标识
    /// </summary>
    /// <param name="e"></param>
    protected override void OnPreRender(EventArgs e)
    {
        //log.Debug("执行OnPreRender");
        base.OnPreRender(e);
        UpdateRefreshFlag();
    }


    /// <summary>
    /// 更新标识,正常提交都删除该次提交的时间,并生产当前新的时间
    /// </summary>
    private void UpdateRefreshFlag()
    {

        #region Cookie模式

        //注册页面唯一标识并返回
        string pageGuid = SetCurPageGuid();

        HttpCookie cookie = GetRefreshTicket();

        if (cookie.Values.Count > 0)
        {
            cookie.Values.Remove(pageGuid);
            //log.Debug("当前清除的cookie变是:" + pageGuid);
        }

        //string submitTime = DateTime.Now.ToString("hhmmss.fffff");
        string submitTime = DateTime.Now.ToString("hhmmss");
        //当前提交时间保存到隐藏域
        ClientScript.RegisterHiddenField(HIDDEN_FIELD_NAME, submitTime);


        // log.Debug("即将要新增的时间:submitTime:" + submitTime + "  Guid:" + pageGuid.ToString());
        cookie.Values.Add(pageGuid, submitTime);

        // log.Debug("UpdateRefreshFlag中当前Cookie中存在的记录数为:" + cookie.Values.Count);
        for (int i = 0; i < cookie.Values.Count; i++)
            //log.Info("cookie[" + cookie.Values.GetKey(i) + "]:" + cookie.Values[i]);

            Response.AppendCookie(cookie);

        #endregion

    }


    /// <summary>
    /// 验证是否刷新
    /// </summary>
    /// <returns></returns>
    private bool CheckRefreshFlag()
    {
        HttpCookie cookie = GetRefreshTicket();
        string pageGuid = GetCurPageGuid();
        if (cookie.Values.Count > 0)
        {
            bool flag = false ;
            if (cookie.Values[pageGuid] != null)
            {
                // flag = cookie.Values[pageGuid].IndexOf(GetCurSubmitTime()) > -1;

                DateTime dt = DateTime.ParseExact(cookie.Values[pageGuid], "HHmmss", CultureInfo.InvariantCulture);


                String currtime = GetCurSubmitTime();

                DateTime currDt = DateTime.ParseExact(currtime, "HHmmss", CultureInfo.InvariantCulture);
                TimeSpan ts = dt.Subtract(currDt);
                if (ts.Seconds < 5)
                {
                    flag = true;
                }
         
            }
            else
                flag = true;//防止出现异常,总是可以提交
            if (flag)
            {
                //log.Debug("提交时间存在,可以提交");
            }
            else
            {
                // log.Debug("无效的提交时间");
            }
            return flag;
        }
        return true;
    }


    /// <summary>
    /// 得到已保存的提交时间,没有新建,有返回
    /// </summary>
    /// <returns></returns>
    private HttpCookie GetRefreshTicket()
    {
        #region Cookie模式,返回值为Cookie

        HttpCookie cookie;
        if (Request.Cookies[REFRESH_TICKET_NAME] == null)
        {
            cookie = new HttpCookie(REFRESH_TICKET_NAME);
            Response.AppendCookie(cookie);
            // log.Debug("Cookie不存在，初始化");
        }
        else
        {
            cookie = Request.Cookies[REFRESH_TICKET_NAME];

            //  log.Debug("读取已存在的Cookie,当前Cookie中存在的记录数为:" + cookie.Values.Count + "具体有如下几条:");

            for (int i = 0; i < cookie.Values.Count; i++)
            {
                //  log.Info("cookie[" + cookie.Values.GetKey(i) + "]:" + cookie.Values[i]);
            }
        }
        return cookie;
        #endregion
    }


    /// <summary>
    /// 获取当前提交时间
    /// </summary>
    /// <returns></returns>
    private string GetCurSubmitTime()
    {
        string submitTime = Request.Params[HIDDEN_FIELD_NAME] == null ? "" : Request.Params[HIDDEN_FIELD_NAME].ToString();
        // log.Debug("执行GetCurSubmitTime:submitTime为:" + submitTime);
        return submitTime;
    }


    /// <summary>
    /// 设置页面唯一标识,通过Guid标识来区分每个页面自己的提交时间
    /// </summary>
    private string SetCurPageGuid()
    {
        string guid;
        if (!IsPostBack)
        {
            if (Request.Params[HIDDEN_PAGE_GUID] == null)
            {
                guid = System.Guid.NewGuid().ToString();
                // log.Debug("SetCurPageGuid注册了一个新的标识:" + guid);
            }
            else
                guid = GetCurPageGuid();

        }
        else
        {
            guid = GetCurPageGuid();
        }

        ClientScript.RegisterHiddenField(HIDDEN_PAGE_GUID, guid);
        return guid;
    }



    /// <summary>
    /// 得到当前页面的唯一标识
    /// </summary>
    /// <returns></returns>
    private string GetCurPageGuid()
    {
        string pageGuid = Request.Params[HIDDEN_PAGE_GUID] == null ? "none" : Request.Params[HIDDEN_PAGE_GUID].ToString();
        // log.Debug("执行GetCurPageGuid()后Page_GUID为:" + pageGuid);
        return pageGuid;
    }


   
}