using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Common;
using System.Data.SQLite;

/// <summary>
/// 任务配置表
/// </summary>
public class Sqlite_Task_T
{

    public static readonly string KEY_HALFWAY_PAUSE = "halfway_pause";

 
      //是否显示烟花页面
   // public static readonly string KEY_VICTORY = "VICTORY";
    //是否中途暂停百分比增长
    //public static readonly string KEY_IS_HALFWAY_PAUSE = "IS_HALFWAY_PAUSE";
      //是否开始显示百分比
    //public static readonly string KEY_START_VOTE = "START_VOTE";



        public Sqlite_Task_T()   //无参数构造函数
        {
           SQLiteConnection conn = null;
           conn = new SQLiteConnection(GlobalConf.DB_PATH);//创建数据库实例，指定文件位置  
           conn.Open();//打开数据库，若文件不存在会自动创建  
        }  

          public static void Select()
        {

            using (SQLiteConnection con = new SQLiteConnection(GlobalConf.DB_PATH))
            {
                con.Open();
                string sqlStr = @"SELECT *
                                    FROM battery";
                using (SQLiteCommand cmd = new SQLiteCommand(sqlStr, con))
                {
                    using (SQLiteDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            Console.WriteLine(dr["hero_id"].ToString() + dr["hero_name"]);
                        }
                    }
                }
            }
        } 

        //获取中途暂停的百分比
         public static int getHalfwayPause(){
             int _result = 0;
             using (SQLiteConnection con = new SQLiteConnection(GlobalConf.DB_PATH))
             {
                 con.Open();
                 string sqlStr = @"SELECT *
                                    FROM task_conf  where key = '"+ KEY_HALFWAY_PAUSE + "' ; ";
                 using (SQLiteCommand cmd = new SQLiteCommand(sqlStr, con))
                 {
                     using (SQLiteDataReader dr = cmd.ExecuteReader())
                     {
                         while (dr.Read())
                         {
                             Console.WriteLine(dr["key"].ToString() + dr["value"]);
                            _result = Convert.ToInt32( dr["value"]);
                         }
                     }
                 }
             }
             return _result;
         }

         public static bool GetCurrStatus(String  key)
         {
             bool tmp = false;
             using (SQLiteConnection con = new SQLiteConnection(GlobalConf.DB_PATH))
             {
                 con.Open();
                 string sqlStr = @"SELECT *
                                    FROM task_conf  where key = '" + key + "' ; ";
                 using (SQLiteCommand cmd = new SQLiteCommand(sqlStr, con))
                 {
                     using (SQLiteDataReader dr = cmd.ExecuteReader())
                     {
                         while (dr.Read())
                         { 
                             Console.WriteLine(dr["key"].ToString() + dr["value"]); 
                             tmp = Convert.ToBoolean(dr["value"]);
                         }
                     }
                 }
             }
                  return tmp;
         } 


          public static void Insert(int showtime,int percent)
        {
            using (SQLiteConnection con = new SQLiteConnection(GlobalConf.DB_PATH))
            {
                con.Open();
                string sqlStr = @"INSERT INTO battery
                                  VALUES
                                  (
                                      "+showtime+","+percent+
                                  ")";
                using (SQLiteCommand cmd = new SQLiteCommand(sqlStr, con))
                {
                    cmd.ExecuteNonQuery();
                }
            }
        }

       public static void Update()
        {
            using (SQLiteConnection con = new SQLiteConnection(GlobalConf.DB_PATH))
            {
                con.Open();
                string sqlStr = @"UPDATE battery
                                     SET showtime = '盗贼'
                                   WHERE percent = 1";
                using (SQLiteCommand cmd = new SQLiteCommand(sqlStr, con))
                {
                    cmd.ExecuteNonQuery();
                }
            }
        }

       public static void Update(string key, string value)
       {
           using (SQLiteConnection con = new SQLiteConnection(GlobalConf.DB_PATH))
           {
               con.Open();
               string sqlStr = @"UPDATE task_conf
                                     SET value = '"+value+"'" +
                                   " WHERE key  = '"+key+"'";
               using (SQLiteCommand cmd = new SQLiteCommand(sqlStr, con))
               {
                   cmd.ExecuteNonQuery();
               }
           }
       } 

       public static void UpdateShowVictory()
       {
           using (SQLiteConnection con = new SQLiteConnection(GlobalConf.DB_PATH))
           {
               con.Open();
               string sqlStr = @"UPDATE task_conf
                                     SET value = 'true'" +
                                   " WHERE key  = '" + GlobalConf.KEY_VICTORY + "'";
               using (SQLiteCommand cmd = new SQLiteCommand(sqlStr, con))
               {
                   cmd.ExecuteNonQuery();
               }
           }
       }

       public static void UpdateVisibleVictory()
       {
           using (SQLiteConnection con = new SQLiteConnection(GlobalConf.DB_PATH))
           {
               con.Open();
               string sqlStr = @"UPDATE task_conf
                                     SET value = 'false'" +
                                   " WHERE key  = '" + GlobalConf.KEY_VICTORY + "'";
               using (SQLiteCommand cmd = new SQLiteCommand(sqlStr, con))
               {
                   cmd.ExecuteNonQuery();
               }
           }
       }

       public static void Delete()
        {
            using (SQLiteConnection con = new SQLiteConnection(GlobalConf.DB_PATH))
            {
                con.Open();
                string sqlStr = @"DELETE FROM battery";
                using (SQLiteCommand cmd = new SQLiteCommand(sqlStr, con))
                {
                    cmd.ExecuteNonQuery();
                }
            }
        }

       public static void DeleteAll()
       {
           using (SQLiteConnection con = new SQLiteConnection(GlobalConf.DB_PATH))
           {
               con.Open();
               string sqlStr = @"DELETE FROM battery";
               using (SQLiteCommand cmd = new SQLiteCommand(sqlStr, con))
               {
                   cmd.ExecuteNonQuery();
               }
           }
       }
	
}