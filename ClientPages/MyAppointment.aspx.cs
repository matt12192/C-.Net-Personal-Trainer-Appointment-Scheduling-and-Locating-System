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

public partial class ClientPages_MyAppointment : System.Web.UI.Page
{
    string Client_ID;
    string Appointment_ID;

    SqlConnection conn;
    SqlCommand cmd;
    string cs;


    string cmdstring1 = "DELETE FROM TrainerAppointment WHERE (Appointment_ID = @Appointment_ID)";
    string cmdstring2 = "DELETE FROM Appointment WHERE (Appointment_ID = @Appointment_ID)";

    protected void Page_Load(object sender, EventArgs e)
    {
        Client_ID = User.Identity.Name;
        Session["Client_ID"] = Client_ID;
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        
     Appointment_ID = (string)GridView1.SelectedValue;

      

        cs = ConfigurationManager.ConnectionStrings["FindaTrainerNIDB"].ConnectionString;

        conn = new SqlConnection(cs);
        cmd = new SqlCommand(cmdstring1, conn);

        cmd.Parameters.AddWithValue("@Appointment_ID", Appointment_ID);

        conn.Open();

        cmd.ExecuteNonQuery();

        conn.Close();


       cs = ConfigurationManager.ConnectionStrings["FindaTrainerNIDB"].ConnectionString;
        conn = new SqlConnection(cs);
        cmd = new SqlCommand(cmdstring2, conn);

        cmd.Parameters.AddWithValue("@Appointment_ID", Appointment_ID);

        conn.Open();

        cmd.ExecuteNonQuery();

        conn.Close();

        Response.Redirect("Home.aspx");

             }
}