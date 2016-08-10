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

public partial class ClientPages_Home : System.Web.UI.Page
{
    string RegUser;

    protected void Page_Load(object sender, EventArgs e)
    {
        RegUser = (string)Session["RegUSer"];
    }
}