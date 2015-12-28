using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    /*
    private static string name="yang"; 

     public static string Name 
     { 
        get{return name;} 
     }

     * */
  public static int count = 0;
  public String Counts
    {
        get { return Time_Task.count.ToString(); }
} 


  string msg = "this is message";
    public String Messages
{
        set{ msg = value; } 
        get{ return msg ;}
} 

    protected void Page_Load(object sender, EventArgs e)
    {
        Console.WriteLine("this is message !");
    }

    //定時器隔一段時間執行一次，修改百分數的值
    protected void Timer1_Tick(object sender, EventArgs e)
    {
       // Console.WriteLine("this is message timer !");
    //这里可以操作你想做的事情，比如定时查询数据库
    ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('Hello‘);", true);
     
    count++;
    Console.WriteLine("this is message !"+count);

    
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //   Response.Write(count);


        Response.Write("<h2>" + Time_Task.count + "</h2>");

        HiddenField1.Value = Time_Task.count.ToString();
    }
     
    protected void HiddenField1_ValueChanged(object sender, EventArgs e)
    {
        Response.Write("<h2>hidden -> " + count + "</h2>");
    }


    public static string getUrl()  
    {   
        return  "http://www.hao123.com/logo.gif";  
    } 
}