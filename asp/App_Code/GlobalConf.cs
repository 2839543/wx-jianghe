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
    public static bool  HALFWAY_PAUSE = false;

    public static int percent = 1;

	public GlobalConf()
	{
    
	}


}