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

public partial class ClientPages_SearchTrainer : System.Web.UI.Page
{
    string Client_Name;
    string Subject;
    string Message;
    string Email_Date;
    string val;
    string Trainer_ID;
    string Client_ID;
    string Client_Fname;
    string Client_Sname;
    int Client_Age;
    string Client_Gender;
    string Client_Address;
    string Client_City;
    string Client_Postcode;
    string Client_Telephone;
    string Client_Email;
    string Appointment_ID;
    string Appointment_Booked;
    string Appointment_Date;
    string Appointment_Time;
    string Paypal;
    string Trainer_Name;
    string Total;
    SqlConnection conn;
    SqlCommand cmd;
    string cs;
    string result;
    string result2;
    string result3;
    string result4;
    string result5;
    string result6;
    string result7;
    string result8;
    string result9;
    string result10;
    int result11;
    string result12;
    int result13;
    string cmdstring = "Select (Trainer_Fname) FROM [dbo].[Trainer] WHERE Trainer_ID = @Trainer_ID";
    string cmdstring2 = "Select (Trainer_Sname) FROM [dbo].[Trainer] WHERE Trainer_ID = @Trainer_ID";
    string cmdstring3 = "Select (Trainer_Cost) FROM [dbo].[Trainer] WHERE Trainer_ID = @Trainer_ID";
    string cmdstring4 = "Select (Trainer_Latitude) FROM [dbo].[Trainer] WHERE Trainer_ID = @Trainer_ID";
    string cmdstring5 = "Select (Trainer_Longitude) FROM [dbo].[Trainer] WHERE Trainer_ID = @Trainer_ID";
    string cmdstring6 = "Select (Trainer_Gym) FROM [dbo].[Trainer] WHERE Trainer_ID = @Trainer_ID";
    string cmdstring7 = "Select (Trainer_Address) FROM [dbo].[Trainer] WHERE Trainer_ID = @Trainer_ID";
    string cmdstring8 = "Select (Trainer_Postcode) FROM [dbo].[Trainer] WHERE Trainer_ID = @Trainer_ID";
    string cmdstring9 = "Select (Trainer_City) FROM [dbo].[Trainer] WHERE Trainer_ID = @Trainer_ID";
    string cmdstring10 = "INSERT INTO Client(Client_ID, Client_Fname, Client_Sname, Client_Age, Client_Gender, Client_Address, Client_City, Client_Postcode, Client_Telephone, Client_Email) Values (@Client_ID, @Client_Fname, @Client_Sname, @Client_Age, @Client_Gender, @Client_Address, @Client_City, @Client_Postcode, @Client_Telephone, @Client_Email)";
    string cmdstring11 = "INSERT INTO Appointment(Appointment_ID, Client_ID, Appointment_Booked, Appointment_Date, Appointment_Time) Values (@Appointment_ID, @Client_ID, @Appointment_Booked, @Appointment_Date, @Appointment_Time)";
    string cmdstring12 = "INSERT INTO TrainerAppointment(Appointment_ID, Trainer_ID, Trainer_Name, Total) Values (@Appointment_ID, @Trainer_ID, @Trainer_Name, @Total)";
    string cmdstring13 = "Select (Client_Gender) FROM [dbo].[Client] WHERE Client_ID = @Client_ID";
    string cmdstring14 = "SELECT COUNT(*) FROM [dbo].[Appointment]";
    string cmdstring15 = "SELECT MAX(Appointment_ID) FROM [dbo].[Appointment]";
    string cmdstring16 = "Select COUNT(*) FROM Client WHERE Client_ID = @Client_ID";
    string cmdstring17 = "Select (Client_Email) FROM [dbo].[Client] WHERE Client_ID = @Client_ID";
    string cmdstring18 = "INSERT INTO TrainerEmail(Email_TID, Email_CID, Email_CName, Email_CEmail, Email_Subject, Email_Message, Email_Date) Values (@Email_TID, @Email_CID, @Email_CName, @Email_CEmail, @Email_Subject, @Email_Message, @Email_Date)";
    protected void Page_Load(object sender, EventArgs e)
    {
        Client_ID = User.Identity.Name;


        Session["Client_ID"] = Client_ID;

        DataView dvSql = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);

        if (User.Identity.Name == "")
        {

        }

        else
        {
            foreach (DataRowView drvSql in dvSql)
            {

                Client_Fname = drvSql["Client_Fname"].ToString();
                txtClientFname.Text = (Client_Fname.Trim());


                Client_Sname = drvSql["Client_Sname"].ToString();
                txtClientSname.Text = (Client_Sname.Trim());

                Client_Name = (Client_Fname.Trim()) + (Client_Sname.Trim());
                Session["Client_Name"] = Client_Name;


                Client_Gender = drvSql["Client_Gender"].ToString();


                if (Client_Gender == "Male")
                {
                    txtClientGender.SelectedValue = "Male";

                }



                else if (Client_Gender == "Female")
                {
                    txtClientGender.SelectedValue = "Female";
                }

                else
                {

                }




                Client_Address = drvSql["Client_Address"].ToString();
                txtClientAddress.Text = (Client_Address.Trim());

                Client_City = drvSql["Client_City"].ToString();
                txtClientCity.Text = (Client_City.Trim());

                Client_Postcode = drvSql["Client_Postcode"].ToString();
                txtClientPostcode.Text = (Client_Postcode.Trim());

                Client_Telephone = drvSql["Client_Telephone"].ToString();
                txtClientTelephone.Text = (Client_Telephone.Trim());

                Client_Email = drvSql["Client_Email"].ToString();
                txtClientEmail.Text = (Client_Email.Trim());
                Session["Client_Email"] = Client_Email;

            }



        }
    }

    protected void btnTrainerDetails_Click(Object sender, EventArgs e)
{

        
        trainerDetails.Visible = true;
        trainersearch.Visible = false;

}

        



    protected void btnAppointment(Object sender, EventArgs e)
    {

        Session["Trainer_ID"] = GridView1.SelectedValue;
        trainerDetails.Visible = false;
        SelectAppointment.Visible = true;
    }

        
     

    protected void btnViewLocation_Click(Object sender, EventArgs e)
    {
 
         Session["Trainer_ID"] = GridView1.SelectedValue;
         Trainer_ID = (string)Session["Trainer_ID"];

        //'Retrieving Latitude Value
        cs = ConfigurationManager.ConnectionStrings["FindaTrainerNIDB"].ConnectionString;
        conn = new SqlConnection(cs);
        cmd = new SqlCommand(cmdstring4, conn);

        cmd.Parameters.AddWithValue("@Trainer_ID", Trainer_ID);

        conn.Open();

        SqlDataReader myReader4; 

        myReader4 = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (myReader4.Read())
        {
            result4 = myReader4.GetString(0);
            Session["Lat"] = result4;

        }
            myReader4.Close();
      

        //'Retrieving Longitude Value
        cs = ConfigurationManager.ConnectionStrings["FindaTrainerNIDB"].ConnectionString;
        conn = new SqlConnection(cs);
        cmd = new SqlCommand(cmdstring5, conn);

        cmd.Parameters.AddWithValue("@Trainer_ID", Trainer_ID);

        conn.Open();

        SqlDataReader myReader5;

        myReader5 = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (myReader5.Read())
        {
            result5 = myReader5.GetString(0);
            Session["Lng"] = result5;

        }
          myReader5.Close();  
    

        //'Retrieving Gym Value Value
        cs = ConfigurationManager.ConnectionStrings["FindaTrainerNIDB"].ConnectionString;
        conn = new SqlConnection(cs);
        cmd = new SqlCommand(cmdstring6, conn);

        cmd.Parameters.AddWithValue("@Trainer_ID", Trainer_ID);

        conn.Open();

        SqlDataReader myReader6;

        myReader6 = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (myReader6.Read())

        {

             result6 = myReader6.GetString(0);
            Session["Trainer_Gym"] = result6;
        }
           myReader6.Close();
     

        //'Retrieving Address Value
        cs = ConfigurationManager.ConnectionStrings["FindaTrainerNIDB"].ConnectionString;
        conn = new SqlConnection(cs);
        cmd = new SqlCommand(cmdstring7, conn);

        cmd.Parameters.AddWithValue("@Trainer_ID", Trainer_ID);

        conn.Open();

        SqlDataReader myReader7;

        myReader7 = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (myReader7.Read())

        {
             result7 = myReader7.GetString(0);
            Session["Trainer_Address"] = result7;

        }
         myReader7.Close();  
        

        //'Retrieving Postcode Value
        cs = ConfigurationManager.ConnectionStrings["FindaTrainerNIDB"].ConnectionString;
        conn = new SqlConnection(cs);
        cmd = new SqlCommand(cmdstring8, conn);

        cmd.Parameters.AddWithValue("@Trainer_ID", Trainer_ID);

        conn.Open();

        SqlDataReader myReader8;

        myReader8 = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (myReader8.Read())

        {

            result8 = myReader8.GetString(0);
            Session["Trainer_Postcode"] = result8;

        }
        myReader8.Close();
 
        //'Retrieving City Value
       cs = ConfigurationManager.ConnectionStrings["FindaTrainerNIDB"].ConnectionString;
        conn = new SqlConnection(cs);
        cmd = new SqlCommand(cmdstring9, conn);

        cmd.Parameters.AddWithValue("@Trainer_ID", Trainer_ID);

        conn.Open();

        SqlDataReader myReader9;

        myReader9 = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (myReader9.Read())

        {

            result9 = myReader9.GetString(0);
            Session["Trainer_City"] = result9;

        }

        myReader9.Close();
      

        trainerDetails.Visible = false;
        TrainerLocation.Visible = true;



    }
        
        
       

    protected void btnSearchReturn_Click(Object sender, EventArgs e)
    {
        trainersearch.Visible = true;
        trainerDetails.Visible = false;

    }

       



    protected void btnConfirmAppointment_Click(Object sender, EventArgs e)
 
    {

        //'Determine if Client wishes to pay with paypal
        if (RadPayment.SelectedItem.Value == "PayN")

        {
            Paypal = "True";
            Session["Paypal"] = Paypal;

        }

            

        

        Trainer_ID = (string)Session["Trainer_ID"];
        //'Retrieving Firstname Value
        cs = ConfigurationManager.ConnectionStrings["FindaTrainerNIDB"].ConnectionString;
        conn = new SqlConnection(cs);
        cmd = new SqlCommand(cmdstring, conn);

        cmd.Parameters.AddWithValue("@Trainer_ID", Trainer_ID);

        conn.Open();

        SqlDataReader myReader;

        myReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (myReader.Read())
        {
            result = myReader.GetString(0);
            Session["Trainer_Fname"] = result;

        }
        myReader.Close();

        //'Retrieving Surname Value
       conn = new SqlConnection(cs);
        cmd = new SqlCommand(cmdstring2, conn);

        cmd.Parameters.AddWithValue("@Trainer_ID", Trainer_ID);

        conn.Open();

        SqlDataReader myReader2;

        myReader2 = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (myReader2.Read())

        {

            result2 = myReader2.GetString(0);
            Session["Trainer_Sname"] = result2;

        }
        myReader2.Close();
            

        
        //'Retrieving Total Value
        conn = new SqlConnection(cs);
        cmd = new SqlCommand(cmdstring3, conn);

        cmd.Parameters.AddWithValue("@Trainer_ID", Trainer_ID);

        conn.Open();

        SqlDataReader myReader3;

        myReader3 = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (myReader3.Read())

        {

            result3 = myReader3.GetString(0);
            Session["Total"] = result3;


        }
            
        myReader3.Close();

        cs = ConfigurationManager.ConnectionStrings["FindaTrainerNIDB"].ConnectionString;
        conn = new SqlConnection(cs);
        cmd = new SqlCommand(cmdstring14, conn);

        conn.Open();

        SqlDataReader myReader4;

        myReader4 = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (myReader4.Read())

        {
            result11 = myReader4.GetInt32(0);

        }
            
       
        
        if (result11 < 1)
        {

             Session["Appointment_ID"] = 1;

        }
           
        else
        {

        }

            cs = ConfigurationManager.ConnectionStrings["FindaTrainerNIDB"].ConnectionString;
        conn = new SqlConnection(cs);
        cmd = new SqlCommand(cmdstring15, conn);

            conn.Open();

            SqlDataReader myReader5;

            myReader5 = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (myReader5.Read())

        {
                result12 = myReader5.GetString(0);

                Session["Appointment_ID"] = result12 + 1;

        }
                
        
       

        Appointment_ID = (string)Session["Appointment_ID"];

        Appointment_Booked = DateTime.Today.ToString("dd/MM/yyyy");
        Session["Appointment_Booked"] = (Appointment_Booked.Trim());

        Appointment_Date = txtAppointment.Text;
        Session["Appointment_Date"] = Appointment_Date;

        Appointment_Time = txtAppointmentTime.Text;
        Session["Appointment_Time"] = Appointment_Time;

        Trainer_Name = (string)Session["Trainer_fname"] + (string)Session["Trainer_Sname"];
        Session["Trainer_Name"] = Trainer_Name;

        Total = (string)Session["Total"];

        SelectAppointment.Visible = false;
        CustomerDetails.Visible = true;

        if (string.IsNullOrEmpty(txtClientFname.Text))
        {
            txtClientFname.ReadOnly = false;

        }
        else
        {
            txtClientFname.ReadOnly = true;

        }


        if (string.IsNullOrEmpty(txtClientSname.Text))
        {
            txtClientSname.ReadOnly = false;

        }
        else
        {
            txtClientSname.ReadOnly = true;

        }


        if (string.IsNullOrEmpty(txtClientAge.Text))
        {
            txtClientAge.ReadOnly = false;

        }
        else
        {
            txtClientAge.ReadOnly = true;

        }

        if (txtClientGender.SelectedItem.Value == "Male")
        {
            txtClientGender.Enabled = false;
        }
        else if (txtClientGender.SelectedItem.Value == "Female")
        {
            txtClientGender.Enabled = false;
        }
        else
        {
            txtClientGender.Enabled = true;
        }


        if (string.IsNullOrEmpty(txtClientAddress.Text))
        {
            txtClientAddress.ReadOnly = false;

        }
        else
        {
            txtClientAddress.ReadOnly = true;

        }


        if (string.IsNullOrEmpty(txtClientCity.Text))
        {
            txtClientCity.ReadOnly = false;

        }
        else
        {
            txtClientCity.ReadOnly = true;

        }


        if (string.IsNullOrEmpty(txtClientPostcode.Text))
        {
            txtClientPostcode.ReadOnly = false;

        }
        else
        {
            txtClientPostcode.ReadOnly = true;

        }


        if (string.IsNullOrEmpty(txtClientTelephone.Text))
        {
            txtClientTelephone.ReadOnly = false;

        }
        else
        {
            txtClientTelephone.ReadOnly = true;

        }


        if (string.IsNullOrEmpty(txtClientEmail.Text))
        {
            txtClientEmail.ReadOnly = false;

        }
        else
        {
            txtClientEmail.ReadOnly = true;

        }





    }

        
 

    protected void btnClientDetails_Click(Object sender, EventArgs e) 
    {

        Client_ID = User.Identity.Name;
        Session["Client_ID"] = (Client_ID.Trim());


        Client_Fname = txtClientFname.Text;
        Session["Client_Fname"] = (Client_Fname.Trim());

        Client_Sname = txtClientSname.Text;
        Session["Client_Sname"] = (Client_Sname.Trim());

        Client_Age = int.Parse(txtClientAge.Text);
        Session["Client_Age"] = (Client_Age);

        Client_Gender = txtClientGender.Text;
        Session["Client_Gender"] = (Client_Gender.Trim());

        Client_Address = txtClientAddress.Text;
        Session["Client_Address"] = (Client_Address.Trim());

        Client_City = txtClientCity.Text;
        Session["Client_City"] = (Client_City.Trim());

        Client_Postcode = txtClientPostcode.Text;
        Session["Client_Postcode"] = (Client_Postcode.Trim());

        Client_Telephone = txtClientTelephone.Text;
        Session["Client_Telephone"] = (Client_Telephone.Trim());

        Client_Email = txtClientEmail.Text;
        Session["Client_Email"] = (Client_Email.Trim());


        Trainer_ID = (string)Session["Trainer_ID"];

        Appointment_ID = (string)Session["Appointment_ID"];

        Appointment_Booked = DateTime.Today.ToString("dd/MM/yyyy");
        Session["Appointment_Booked"] = Appointment_Booked;

        Appointment_Date = txtAppointment.Text;
        Session["Appointment_Date"] = Appointment_Date;

        Appointment_Time = txtAppointmentTime.Text;
        Session["Appointment_Time"] = Appointment_Time;


        Trainer_Name = (string)Session["Trainer_fname"] + (string)Session["Trainer_Sname"];
        Session["Trainer_Name"] = (Trainer_Name.Trim());

        Total = (string)Session["Total"];




        cs = ConfigurationManager.ConnectionStrings["FindaTrainerNIDB"].ConnectionString;
        conn = new SqlConnection(cs);
        //'Command to count number of clients with same ID
        cmd = new SqlCommand(cmdstring16, conn);

        cmd.Parameters.AddWithValue("@Client_ID", Client_ID);

        conn.Open();

        SqlDataReader myReader;

        myReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (myReader.Read())
        {

             result13 = myReader.GetInt32(0);

        }
        myReader.Close();

           


        if (result13 >= 1) 
        {

            goto line2;


        }
        
        else


        {

            goto line1;



        }
     
line1:


        cs = ConfigurationManager.ConnectionStrings["FindaTrainerNIDB"].ConnectionString;

        conn = new SqlConnection(cs);
        cmd = new SqlCommand(cmdstring10, conn);

        cmd.Parameters.AddWithValue("@Client_ID", Client_ID);
        cmd.Parameters.AddWithValue("@Client_Fname", Client_Fname);
        cmd.Parameters.AddWithValue("@Client_Sname", Client_Sname);
        cmd.Parameters.AddWithValue("@Client_Age", Client_Age);
        cmd.Parameters.AddWithValue("@Client_Gender", Client_Gender);
        cmd.Parameters.AddWithValue("@Client_Address", Client_Address);
        cmd.Parameters.AddWithValue("@Client_City", Client_City);
        cmd.Parameters.AddWithValue("@Client_Postcode", Client_Postcode);
        cmd.Parameters.AddWithValue("@Client_Telephone", Client_Telephone);
        cmd.Parameters.AddWithValue("@Client_Email", Client_Email);


        conn.Open();

        cmd.ExecuteNonQuery();

        conn.Close();



line2:


        cs = ConfigurationManager.ConnectionStrings["FindaTrainerNIDB"].ConnectionString;

        conn = new SqlConnection(cs);
        cmd = new SqlCommand(cmdstring11, conn);

        cmd.Parameters.AddWithValue("@Appointment_ID", Appointment_ID);
        cmd.Parameters.AddWithValue("@Client_ID", Client_ID);
        cmd.Parameters.AddWithValue("@Appointment_Booked", Appointment_Booked);
        cmd.Parameters.AddWithValue("@Appointment_Date", Appointment_Date);
        cmd.Parameters.AddWithValue("@Appointment_Time", Appointment_Time);


        conn.Open();

        cmd.ExecuteNonQuery();

        conn.Close();


        cs = ConfigurationManager.ConnectionStrings["FindaTrainerNIDB"].ConnectionString;

        conn = new SqlConnection(cs);
        cmd = new SqlCommand(cmdstring12, conn);

        cmd.Parameters.AddWithValue("@Appointment_ID", Appointment_ID);
        cmd.Parameters.AddWithValue("@Trainer_ID", Trainer_ID);
        cmd.Parameters.AddWithValue("@Trainer_Name", Trainer_Name);
        cmd.Parameters.AddWithValue("@Total", Total);



        conn.Open();

        cmd.ExecuteNonQuery();

        conn.Close();

        Response.Redirect("OrderComplete.aspx");



    }

        


  
    
  

    protected void btnContactTrainer_Click(Object sender, EventArgs e)

    {



         Session["Trainer_ID"] = GridView1.SelectedValue;


        Response.Redirect("ContactTrainer.aspx");




    }


      
   
    protected void btnReturnToTrainerDetails_Click(Object sender, EventArgs e)
   
    {

        
        TrainerLocation.Visible = false;
        trainerDetails.Visible = true;


    }
        

   
    protected void btnFilter_Click(Object sender, EventArgs e) 

    {


            GridView1.DataSourceID = "SqlDataSource4";
        TrainerDropdown.Visible = true;
        btnDisplayAll.Visible = true;
        btnFilter.Visible = false;


    }


    






   

    protected void btnDisplayAll_Click(Object sender, EventArgs e) 

    {


         GridView1.DataSourceID = "SqlDataSource1";
        TrainerDropdown.Visible = false;
        btnDisplayAll.Visible = false;


    }


       







}