﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Common;
using System.Data.SQLite;

/// <summary>
/// Class1 的摘要说明
/// </summary>
public class Sqlite_Battery_T
{ 

        public Sqlite_Battery_T()   //无参数构造函数
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

          public static int GetPercent()
          {
              int rPercent = 0;

             string _currentTime = DateTime.Now.ToString("HHmm");

             using (SQLiteConnection con = new SQLiteConnection(GlobalConf.DB_PATH))
              {
                  con.Open();
                  string sqlStr = @"SELECT *
                                    FROM battery where showtime > " + _currentTime + " order by showtime  limit 1;";
                  using (SQLiteCommand cmd = new SQLiteCommand(sqlStr, con))
                  {
                      using (SQLiteDataReader dr = cmd.ExecuteReader())
                      {
                          while (dr.Read())
                          {
                              Console.WriteLine(dr["showtime"].ToString() + dr["percent"]);
                              rPercent = Convert.ToInt32( dr["percent"]);
                          }
                      }
                  }

                  if(rPercent == 0 && DateTime.Now.Hour > 12 ){
                      rPercent = 99;
                  }
                  return rPercent;
              }
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