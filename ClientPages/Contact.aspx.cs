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



public partial class ClientPages_Contact : System.Web.UI.Page
{
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

        

    string cmdstring1 = "Select (Client_Fname) FROM [dbo].[Client] WHERE Client_ID = @Client_ID";
    string cmdstring2 = "Select (Client_Sname) FROM [dbo].[Client] WHERE Client_ID = @Client_ID";
    string cmdstring3 = "Select (Client_Email) FROM [dbo].[Client] WHERE Client_ID = @Client_ID";

    string cmdstring4 = "INSERT INTO Email(Email_CID, Email_CName, Email_CEmail, Email_Subject, Email_Message, Email_Date) Values (@Email_CID, @Email_CName, @Email_CEmail, @Email_Subject, @Email_Message, @Email_Date)";
    protected void Page_Load(object sender, EventArgs e)
    {
        Client_ID = User.Identity.Name;

        cs = ConfigurationManager.ConnectionStrings["FindaTrainerNIDB"].ConnectionString;
        
        conn = new SqlConnection(cs);
        cmd = new SqlCommand(cmdstring1, conn);

      

        cmd.Parameters.AddWithValue("@Client_ID", Client_ID);

        conn.Open();

        SqlDataReader myReader;

        myReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (myReader.Read())
        
        {
            Client_Fname = myReader.GetString(0);
        }
        myReader.Close();


        
            


        cs = ConfigurationManager.ConnectionStrings["FindaTrainerNIDB"].ConnectionString;

        conn = new SqlConnection(cs);
        cmd = new SqlCommand(cmdstring2, conn);

        cmd.Parameters.AddWithValue("@Client_ID", Client_ID);

        conn.Open();

        SqlDataReader myReader2;

        myReader2 = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (myReader2.Read())
        {
            Client_Sname = myReader2.GetString(0);
        }
          myReader2.Close();  



        cs = ConfigurationManager.ConnectionStrings["FindaTrainerNIDB"].ConnectionString;


        conn = new SqlConnection(cs);
        cmd = new SqlCommand(cmdstring3, conn);

        cmd.Parameters.AddWithValue("@Client_ID", Client_ID);

        conn.Open();

        SqlDataReader myReader3;

        myReader3 = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (myReader3.Read())
        {
            Client_Email = myReader3.GetString(0);
        }
        myReader3.Close();


        txtClientID.Value = (Client_ID.Trim());
        txtName.Value = (Client_Fname.Trim()) + (Client_Sname.Trim());
        txtEmail.Value = (Client_Email.Trim());
    }
    protected void btnEmail_Click(object sender, EventArgs e)
    {
        Client_ID = User.Identity.Name;
        Client_Name = txtName.Value;
        Client_Email = txtEmail.Value;
        Subject = txtSubject.Value;
        Message = txtMessage.Value;
        Email_Date = DateTime.Today.ToString("dd/MM/yyyy");
        
        cs = ConfigurationManager.ConnectionStrings["FindaTrainerNIDB"].ConnectionString;
       

        conn = new SqlConnection(cs);
        cmd = new SqlCommand(cmdstring4, conn);

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