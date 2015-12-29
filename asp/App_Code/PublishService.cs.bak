using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Class1 的摘要说明
/// </summary>


public class PublishService
    {
        private static IDictionary<string, HttpResponseBase> contexts = new Dictionary<string, HttpResponseBase>();
        public static void AddHttpContext(HttpContextBase context)
        {
         //   var token = context.GetToken(”CookieName“);
          //  if (!contexts.Keys.Contains(token))
          //      contexts.Add(token, context.Response);
        }

        private static void Publish()
        {
            foreach (var context in contexts.Values)
            {
                context.ContentType = "text/event-stream";
                context.CacheControl = "no-cache";
                // string        msg = GetData(context.GetToken("CookieName"));
                string msg = "this is server message ..";
                context.Write("data:" + msg + "\n\n");
                context.Flush();
            }
        }
        public void Subscribe()
        {
        //    PublishService.AddHttpContext(HttpContext);
            PublishService.Publish();
        }
    }

