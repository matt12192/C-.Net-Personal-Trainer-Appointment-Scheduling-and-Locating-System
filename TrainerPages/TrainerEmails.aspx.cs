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

public partial class TrainerPages_TrainerEmails : System.Web.UI.Page
{
    string Email_ID;
    string Trainer_ID;
    string Client_ID;
    string Subject;
    string Message;
    string Email_Date;
    string Email_Type;

    SqlConnection conn;
    SqlCommand cmd;
    string cs;


    string cmdstring1 = "INSERT INTO ClientEmail(Email_AID, Email_CID, Email_Subject, Email_Message, Email_Date, Email_Type) Values (@Email_AID, @Email_CID, @Email_Subject, @Email_Message, @Email_Date, @Email_Type)";
    string  cmdstring2 = "Select (Email_CID) FROM [dbo].[Email] WHERE Email_ID = @Email_ID";


    protected void Page_Load(object sender, EventArgs e)
    {
        Trainer_ID = User.Identity.Name;
        Email_Type = "Trainer";
    }

     protected void btnReplyEmail_Click(Object sender, EventArgs e)
     {


         Trainer_ID = User.Identity.Name;
        TrainerReply.Visible = true;
        TrainerEmails.Visible = false;



     }
        



    protected void btnEmail_Click(Object sender, EventArgs e)
 
    {

        Email_ID = (string)GridView1.SelectedValue;
       cs = ConfigurationManager.ConnectionStrings["FindaTrainerNIDB"].ConnectionString;
        conn = new SqlConnection(cs);
        cmd = new SqlCommand(cmdstring2, conn);

        cmd.Parameters.AddWithValue("@Email_ID", Email_ID);

        conn.Open();

        SqlDataReader myReader;

        myReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (myReader.Read())

        {

            Client_ID = myReader.GetString(0);
        }

            

    



        Subject = txtSubject.Value;
        Message = txtMessage.Value;
        Email_Date = DateTime.Today.ToString("dd/MM/yyyy");

        cs = ConfigurationManager.ConnectionStrings["FindaTrainerNIDB"].ConnectionString;

        conn = new SqlConnection(cs);
        cmd = new SqlCommand(cmdstring1, conn);

        cmd.Parameters.AddWithValue("@Email_AID", Trainer_ID);
        cmd.Parameters.AddWithValue("@Email_CID", Client_ID);
        cmd.Parameters.AddWithValue("@Email_Subject", Subject);
        cmd.Parameters.AddWithValue("@Email_Message", Message);
        cmd.Parameters.AddWithValue("@Email_Date", Email_Date);
        cmd.Parameters.AddWithValue("@Email_Type", Email_Type);



        conn.Open();

        cmd.ExecuteNonQuery();

        conn.Close();

        txtSubject.Value = "";
        txtMessage.InnerText = "";
        MessageSent.Visible = true;


    }
    
    


    protected void btnCloseMessage_Click(Object sender, EventArgs e) 
    {
        MessageSent.Visible = false;
    }

        

}