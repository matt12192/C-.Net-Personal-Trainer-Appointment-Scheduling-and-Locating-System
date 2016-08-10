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

public partial class Masterpages_MasterPage : System.Web.UI.MasterPage
{

    string loggedin;


    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Context.User.Identity.IsAuthenticated))
        {
            loggedin = "true";

        }
        else
        {
            loggedin = "false";

        }

        if (loggedin == "true")
        {
            btnLogout.Visible = true;
            btnhrefLogin.Visible = false;


        }
        else if (loggedin == "false")
        {
            btnLogout.Visible = false;
            btnhrefLogin.Visible = true;

        }



        if (Roles.IsUserInRole(Context.User.Identity.Name, "Client"))
        {
            hrefST.Visible = true;
            hrefMA.Visible = true;



        }
        else
        {



        }


        if (Roles.IsUserInRole(Context.User.Identity.Name, "Admin"))
        {
            hrefST.Visible = false;
            hrefMA.Visible = false;
            hrefH.Visible = false;
            hrefCU.Visible = false;




        }
        else if (Roles.IsUserInRole(Context.User.Identity.Name, "Trainer"))
        {

            hrefST.Visible = false;
            hrefMA.Visible = false;
            hrefH.Visible = false;
            hrefCU.Visible = false;



        }




    }


    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Contents.RemoveAll();
        System.Web.Security.FormsAuthentication.SignOut();
        Response.Redirect("~/Pages/Login.aspx");


    }

   




}
