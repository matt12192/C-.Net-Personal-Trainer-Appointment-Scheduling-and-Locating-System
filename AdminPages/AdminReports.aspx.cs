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

public partial class AdminPages_AdminReports : System.Web.UI.Page
{

    string cmdstring1 = "SELECT COUNT(*) FROM [dbo].[Trainer]";
    string cmdstring2 = "SELECT COUNT(*) FROM [dbo].[Appointment]";
    string cmdstring3 = "SELECT AVG(Trainer_Age) FROM [dbo].[Trainer]";

    SqlConnection conn;
    SqlCommand cmd;
    string cs;

    string result;

    string result2;

    string result3;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnTrainersOffered_Click(Object sender, EventArgs e)
    {
        cs = ConfigurationManager.ConnectionStrings["FindaTrainerNIDB"].ConnectionString;


        conn = new SqlConnection(cs);
        cmd = new SqlCommand(cmdstring1, conn);

        conn.Open();

        SqlDataReader myReader;

        myReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (myReader.Read())
        {
            result = myReader.GetString(0);

            txtTrainerOffered.Text = result;



        }




    }





    protected void btnTrainerAppointment_Click(Object sender, EventArgs e) 
    {
      cs = ConfigurationManager.ConnectionStrings["FindaTrainerNIDB"].ConnectionString;


        conn = new SqlConnection(cs);
        cmd = new SqlCommand(cmdstring2, conn);

        conn.Open();

        SqlDataReader myReader2;

        myReader2 = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (myReader2.Read())

{

     result2 = myReader2.GetString(0);

     txtTrainerAppointment.Text = result2;

}
           
}



    protected void btnAverageAge_Click(Object sender, EventArgs e)
    {

        cs = ConfigurationManager.ConnectionStrings["FindaTrainerNIDB"].ConnectionString;


        conn = new SqlConnection(cs);
        cmd = new SqlCommand(cmdstring3, conn);

        conn.Open();

        SqlDataReader myReader3;

        myReader3 = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (myReader3.Read())
        {

            result3 = myReader3.GetString(0);

            txtAverageAge.Text = result3;

        }




    }




    protected void btnDateData_Click(Object sender, EventArgs e)
    {

        GridView1.Visible = true;
    }

}
        
     
 
