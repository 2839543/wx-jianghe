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

public partial class inputPercentInfo : System.Web.UI.Page
{
    //log4net.ILog log = log4net.LogManager.GetLogger("loginfo");
    public static readonly log4net.ILog log = log4net.LogManager.GetLogger("loginfo");
     
    protected void Page_Load(object sender, EventArgs e)
    {
         
        showTime.Text = DateTime.Now.ToString();
        victoryState.Text = GlobalConf.VICTORY.ToString();

        if (GlobalConf.START_VOTE)
        {
            log.Info(" [Page_Load] in START_VOTE->" + GlobalConf.START_VOTE + " GreenYellow");
            btn_start.BackColor = System.Drawing.Color.GreenYellow;
            btn_start.Text = "点击停止投票计数";
        }
        else
        {
            log.Info(" [Page_Load] in START_VOTE->" + GlobalConf.START_VOTE + " Red");
            btn_start.BackColor = System.Drawing.Color.Red;
            btn_start.Text = "点击开始投票计数";
        }

        if (GlobalConf.HALFWAY_PAUSE)
        {
            log.Info(" [Page_Load] in HALFWAY_PAUSE->" + GlobalConf.HALFWAY_PAUSE + " Red");
            Button4.BackColor = System.Drawing.Color.Red;
            Button4.Text = "点击切换为正常投票计数";
        }
        else
        {
            log.Info(" [Page_Load] in HALFWAY_PAUSE->" + GlobalConf.HALFWAY_PAUSE + " GreenYellow");
            Button4.BackColor = System.Drawing.Color.GreenYellow;
            Button4.Text = "点击切换为最高显示66%";
        }

        if (GlobalConf.VICTORY)
        {
            
            Button2.BackColor = System.Drawing.Color.GreenYellow;
            Button2.Text = "点击切换到电池充电页面，屏蔽页面3 ";
            log.Info(" [Page_Load] in VICTORY->" + GlobalConf.VICTORY + " GreenYellow");
        }
        else
        {
            log.Info(" [Page_Load] in VICTORY->" + GlobalConf.VICTORY + " Red");
            Button2.BackColor = System.Drawing.Color.Red;
            Button2.Text = "点击结束电池充电页面，转换至江河3页面";
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (!IsPageRefreshed)
        {
            //数据库操作
            if (GlobalConf.VICTORY)
            {
                GlobalConf.VICTORY = false;
                Button2.Text = "点击结束电池充电页面，转换至江河3页面";
                Button2.BackColor = System.Drawing.Color.Red;
                log.Info(" [Button_Click] in VICTORY->" + GlobalConf.VICTORY + " Red");
            }
            else
            {
                GlobalConf.VICTORY = true;
                Button2.Text = "点击切换到电池充电页面，屏蔽页面3 ";
                Button2.BackColor = System.Drawing.Color.GreenYellow;
                log.Info(" [Button_Click] in VICTORY->" + GlobalConf.VICTORY + " GreenYellow");
            }
        } 
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        if (!IsPageRefreshed)
        {
            if (GlobalConf.HALFWAY_PAUSE)
            {
                GlobalConf.HALFWAY_PAUSE = false;
                Button4.Text = "点击切换为最高显示66%";
                Button4.BackColor = System.Drawing.Color.GreenYellow;
                log.Info(" [Button_Click] in HALFWAY_PAUSE->" + GlobalConf.HALFWAY_PAUSE + " GreenYellow");

            }
            else
            {
                GlobalConf.HALFWAY_PAUSE = true;

                Button4.Text = "点击切换为正常投票计数";
                Button4.BackColor = System.Drawing.Color.Red;
                log.Info(" [Button_Click] in HALFWAY_PAUSE->" + GlobalConf.HALFWAY_PAUSE + " Red");
            }
        }
    }
    protected void btn_start_Click(object sender, EventArgs e)
    {
        if (!IsPageRefreshed)
        {
            if (GlobalConf.START_VOTE)
            {
                GlobalConf.START_VOTE = false;
                btn_start.Text = "点击开始投票计数";
                btn_start.BackColor = System.Drawing.Color.Red;
                log.Info(" [Button_Click] in START_VOTE->" + GlobalConf.START_VOTE + " Red");

            }
            else
            {
                GlobalConf.START_VOTE = true;
                btn_start.Text = "点击停止投票计数";
                btn_start.BackColor = System.Drawing.Color.GreenYellow;
                log.Info(" [Button_Click] in START_VOTE->" + GlobalConf.START_VOTE + " GreenYellow");
            }
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