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
using System.Web.ApplicationServices;
using System.Web.Security;



public partial class Pages_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

        protected void Login1_LoggedIn(Object sender, EventArgs e)
    {


        if (Roles.IsUserInRole(Login1.UserName, "Admin"))
        {


            Response.Redirect("~/AdminPages/AdminArea.aspx");

        }


        else if (Roles.IsUserInRole(Login1.UserName, "Client"))
        {
            Response.Redirect("~/ClientPages/Home.aspx");


        }

        else if (Roles.IsUserInRole(Login1.UserName, "Trainer"))
        {
            Response.Redirect("~/TrainerPages/TrainerArea.aspx");


        }


        else Roles.AddUserToRole(Login1.UserName, "Client");

        {
            Response.Redirect("~/ClientPages/Home.aspx");

        }
           
        


    }
       
}