﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class second : System.Web.UI.Page
{

    public int percent = GlobalConf.percent;  

 

    protected void Page_Load(object sender, EventArgs e)
    {

        if (GlobalConf.VICTORY == true)
        {
            Response.Redirect("thrid.html", false);
        } 

        result.Text = percent.ToString();   
    } 
}