using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// GlobalConf 的摘要说明
/// </summary>
public class GlobalConf
{

    public static readonly string DB_PATH = "Data Source =d:/database/sqlite/wx_jianghe.db";

    //是否显示烟花页面
    public static bool VICTORY = false;


    //是否中途暂停百分比增长
    //public static bool  HALFWAY_PAUSE = true;

    //是否开始显示百分比
    //public static bool START_VOTE = false;


    //是否显示烟花页面
    public static readonly string KEY_VICTORY = "VICTORY";
    //是否中途暂停百分比增长
    public static readonly string KEY_IS_HALFWAY_PAUSE = "IS_HALFWAY_PAUSE";
    //是否开始显示百分比
    public static readonly string KEY_START_VOTE = "START_VOTE";

    public static int percent = 0;

	public GlobalConf()
	{
    
	}


}