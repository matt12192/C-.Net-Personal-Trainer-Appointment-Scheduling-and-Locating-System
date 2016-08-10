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






public partial class ClientPages_ContactTrainer : System.Web.UI.Page
{
    string Trainer_ID;
    string Client_Fname;
    string Client_Sname;
    string Client_Name;
    string Client_ID;
    string Client_Email;
    string Subject;
    string Message;
    string Email_Date;

    SqlConnection conn;
    SqlCommand cmd;
    string cs;


    string cmdstring4 = "INSERT INTO TrainerEmail(Email_CID, Email_CName, Email_CEmail, Email_Subject, Email_Message, Email_Date) Values (@Email_CID, @Email_CName, @Email_CEmail, @Email_Subject, @Email_Message, @Email_Date)";

   

    protected void Page_Load(object sender, EventArgs e)
    {
   
        Trainer_ID = (string)Session["Trainer_ID"];
        Client_ID = (string)Session["Client_ID"];
        Client_Name = (string)Session["Client_Name"];
        Client_Email = (string)Session["Client_Email"];

        txtClientID.Value = (Client_ID.Trim());
        txtName.Value = (Client_Name.Trim());
        txtEmail.Value = (Client_Email.Trim());
    }
protected void btnEmail_Click(object sender, EventArgs e)
{
        Subject = txtSubject.Value;
        Message = txtMessage.Value;
        Email_Date = DateTime.Today.ToString("dd/MM/yyyy");
        //'Database connection string

        cs = ConfigurationManager.ConnectionStrings["FindaTrainerNIDB"].ConnectionString;

        conn = new SqlConnection(cs);
        cmd = new SqlCommand(cmdstring4, conn);
        //'Dim cmdstring4 As String = "INSERT INTO TrainerEmail(Email_CID, Email_CName, Email_CEmail, Email_Subject, Email_Message, Email_Date) Values (@Email_CID, @Email_CName, @Email_CEmail, @Email_Subject, @Email_Message, @Email_Date)"
        cmd.Parameters.AddWithValue("@Email_TID", Trainer_ID);
        cmd.Parameters.AddWithValue("@Email_CID", Client_ID);
        cmd.Parameters.AddWithValue("@Email_CName", Client_Name);
        cmd.Parameters.AddWithValue("@Email_CEmail", Client_Email);
        cmd.Parameters.AddWithValue("@Email_Subject", Subject);
        cmd.Parameters.AddWithValue("@Email_Message", Message);
        cmd.Parameters.AddWithValue("@Email_Date", Email_Date);

        conn.Open();

        cmd.ExecuteNonQuery();

        conn.Close();

        txtClientID.Value = "";
        txtName.Value = "";
        txtEmail.Value = "";
        txtSubject.Value = "";
        txtMessage.Value = "";
        MessageSent.Visible = true;
}
protected void btnCloseMessage_Click(object sender, EventArgs e)
{
    MessageSent.Visible = false;
}
}