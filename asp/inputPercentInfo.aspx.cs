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

    String filepath;
    protected void Button1_Click(object sender, EventArgs e)
    {  
        
        if (FileUpload1.PostedFile.ContentLength > 0)
        {
            Label1.Text = "正在上传....";
            filepath = Server.MapPath("~/dat/") + DateTime.Now.ToString("yyyyMMddhhmmss") + "_" + Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.PostedFile.SaveAs(filepath);
            Label1.Text = "上传成功！";

            //读取文本内容
            Read(filepath);
        }
        else
        {
            Label1.Text = "ERROR:请选择正确的txt文件！";
        } 
    }


    public void Read(string path)
    {
        StreamReader sr = new StreamReader(path, Encoding.Default);
        String line;
        try
        {
            Sqlite_Battery_T.DeleteAll();
        }
        catch {
            Label1.Text = "delete数据库 battery failed !!"; 
        }
        int count = 0;
        try
        {
           
            while ((line = sr.ReadLine()) != null)
            {
                count++;
                Console.WriteLine(line.ToString());
                string[] sArray = line.Split(',');
                
                Sqlite_Battery_T.Insert(Convert.ToInt32( sArray[0]),Convert.ToInt32( sArray[1]));
            }
            Label1.Text = "文件写入数据库成功！"; 
        }
        catch (Exception e)
        {
            Label1.Text = "文件格式有误！请以逗号分隔(',')\n 错误发生在行 line:"+count +"\n "+e.Message; 
        } 
    } 
    
    
}