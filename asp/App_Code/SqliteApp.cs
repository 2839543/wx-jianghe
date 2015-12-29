using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Common;
using System.Data.SQLite;
 

namespace SqliteApp
{
   public class Program
    {
        //static readonly string DB_PATH = "Data Source=d:/database/sqlite/test.db";
       static readonly string DB_PATH = "Data Source =d:/database/sqlite/test.db";  

        public Program()   //无参数构造函数
        {
           SQLiteConnection conn = null;   
           conn = new SQLiteConnection(DB_PATH);//创建数据库实例，指定文件位置  
           conn.Open();//打开数据库，若文件不存在会自动创建  
        } 

       public static void Select()
        {

            using (SQLiteConnection con = new SQLiteConnection(DB_PATH))
            {
                con.Open();
                string sqlStr = @"SELECT *
                                    FROM hero";
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

       public static void Insert()
        {
            using (SQLiteConnection con = new SQLiteConnection(DB_PATH))
            {
                con.Open();
                string sqlStr = @"INSERT INTO hero
                                  VALUES
                                  (
                                      1,
                                      '萨满'
                                  )";
                using (SQLiteCommand cmd = new SQLiteCommand(sqlStr, con))
                {
                    cmd.ExecuteNonQuery();
                }
            }
        }

       public static void Update()
        {
            using (SQLiteConnection con = new SQLiteConnection(DB_PATH))
            {
                con.Open();
                string sqlStr = @"UPDATE hero
                                     SET hero_name = '盗贼'
                                   WHERE hero_id = 1";
                using (SQLiteCommand cmd = new SQLiteCommand(sqlStr, con))
                {
                    cmd.ExecuteNonQuery();
                }
            }
        }

       public static void Delete()
        {
            using (SQLiteConnection con = new SQLiteConnection(DB_PATH))
            {
                con.Open();
                string sqlStr = @"DELETE FROM hero";
                using (SQLiteCommand cmd = new SQLiteCommand(sqlStr, con))
                {
                    cmd.ExecuteNonQuery();
                }
            }
        }

       public static void Main(string[] args)
        {
            Insert();
            Select();
            Update();
            Select();
            Delete();
        }
    }
}