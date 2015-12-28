<%@ Application Language="C#" %> 

<script runat="server">


    
    void Application_Start(object sender, EventArgs e) 
    {
        // 在应用程序启动时运行的代码 
        System.Timers.Timer myTimer = new System.Timers.Timer(2000); // 每个一分钟判断一下 
        myTimer.Elapsed += new System.Timers.ElapsedEventHandler(OnTimedEvent); //执行需要操作的代码，OnTimedEvent是要执行的方法名称 
        myTimer.Interval = 2000;
        myTimer.Enabled = true; 

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  在应用程序关闭时运行的代码

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // 在出现未处理的错误时运行的代码

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // 在新会话启动时运行的代码

    }

    void Session_End(object sender, EventArgs e) 
    {
        // 在会话结束时运行的代码。 
        // 注意: 只有在 Web.config 文件中的 sessionstate 模式设置为
        // InProc 时，才会引发 Session_End 事件。如果会话模式设置为 StateServer
        // 或 SQLServer，则不引发该事件。

    }

    private static void OnTimedEvent(object source, System.Timers.ElapsedEventArgs e)
    {
        //需要的操作写在这个方法中 
        //获取电池的百分比数字
        // count++;
        // Console.WriteLine("show message ..." + count);

        new Time_Task().countNum();
      int  _count =  Time_Task.count;
      Console.WriteLine("show message ..." + _count);
    }
       
</script>
