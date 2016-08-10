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

public partial class ClientPages_MyEmails : System.Web.UI.Page
{
    string Admin_ID;
    string Client_ID;
    string Subject;
    string Message;
    string Email_Date;

    SqlConnection conn;
    SqlCommand cmd;
    string cs;


    string cmdstring1 = "INSERT INTO AdminEmail(Email_AID, Email_CID, Email_Subject, Email_Message, Email_Date) Values (@Email_AID, @Email_CID, @Email_Subject, @Email_Message, @Email_Date)";
    string cmdstring2 = "INSERT INTO EmailTrainer(Email_CID, Email_CName, Email_CEmail, Email_Subject, Email_Message, Email_Date) Values (@Email_CID, @Email_CName, @Email_CEmail, @Email_Subject, @Email_Message, @Email_Date)";
    
        protected void Page_Load(object sender, EventArgs e)
    {
        Client_ID = User.Identity.Name;

    }

    protected void btnReplyEmail_Click(object sender, EventArgs e)
    {
        Client_ID = User.Identity.Name;
        ClientReply.Visible = true;
        ClientEmails.Visible = false;
    }
        

    protected void btnEmail_Click(object sender, EventArgs e)
    {

    

        Client_ID = "kjkjlkj";
        Subject = txtSubject.Value;
        Message = txtMessage.Value;
        Email_Date = DateTime.Today.ToString("dd/MM/yyyy");

         cs = ConfigurationManager.ConnectionStrings["FindaTrainerNIDB"].ConnectionString;

        conn = new SqlConnection(cs);
        cmd = new SqlCommand(cmdstring1, conn);

        cmd.Parameters.AddWithValue("@Email_AID", Admin_ID);
        cmd.Parameters.AddWithValue("@Email_CID", Client_ID);
        cmd.Parameters.AddWithValue("@Email_Subject", Subject);
        cmd.Parameters.AddWithValue("@Email_Message", Message);
        cmd.Parameters.AddWithValue("@Email_Date", Email_Date);



        conn.Open();

        cmd.ExecuteNonQuery();

        conn.Close();
    }

}