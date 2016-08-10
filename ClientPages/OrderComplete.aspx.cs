using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;


public partial class ClientPages_OrderComplete : System.Web.UI.Page
{
    string Paypal;
    string Trainer_Name;

    protected void Page_Load(object sender, EventArgs e)
    {
       Session["Client_ID"] = User.Identity.Name;


        //'Session("Trainer_Name") = "Derick"
        //'Session("Total") = "200"


        Paypal = (string)Session["Paypal"];

        if (Paypal == "True")
        {

            PaypalButton.Visible = true;
        }
            
     
    }
}