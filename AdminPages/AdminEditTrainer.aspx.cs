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


public partial class AdminPages_AdminEditTrainer : System.Web.UI.Page
{

    string Trainer_IDval;
    string Trainer_ID;
    string Trainer_Fname;
    string Trainer_Sname;
    string Trainer_Gym;
    string Trainer_Address;
    string Trainer_Postcode;
    string Trainer_City;
    string Trainer_Gender;
    string Trainer_Type;
    string Trainer_Qualification;
    string Trainer_Age;
    string Trainer_Latitude;
    string Trainer_Longitude;
    string Trainer_YearsActive;
    string Trainer_Cost;


    int result;

    SqlConnection conn;
    SqlCommand cmd;
    string cs;




    string cmdstring2 = "INSERT INTO [Trainer] ([Trainer_ID], [Trainer_Fname], [Trainer_Sname], [Trainer_Gym], [Trainer_Address], [Trainer_Postcode], [Trainer_City], [Trainer_Gender], [Trainer_Type], [Trainer_Qualification], [Trainer_Age], [Trainer_Latitude], [Trainer_Longitude], [Trainer_YearsActive], [Trainer_Cost]) VALUES (@Trainer_ID, @Trainer_Fname, @Trainer_Sname, @Trainer_Gym, @Trainer_Address, @Trainer_Postcode, @Trainer_City, @Trainer_Gender, @Trainer_Type, @Trainer_Qualification, @Trainer_Age, @Trainer_Latitude, @Trainer_Longitude, @Trainer_YearsActive, @Trainer_Cost)";

    string cmdstring1 = "UPDATE Trainer SET Trainer_Fname = @Trainer_Fname, Trainer_Sname = @Trainer_Sname, Trainer_Gym = @Trainer_Gym, Trainer_Address = @Trainer_Address, Trainer_Postcode = @Trainer_Postcode, Trainer_City = @Trainer_City, Trainer_Gender = @Trainer_Gender, Trainer_Type = @Trainer_Type, Trainer_Qualification = @Trainer_Qualification, Trainer_Age = @Trainer_Age, Trainer_Latitude = @Trainer_Latitude, Trainer_Longitude = @Trainer_Longitude, Trainer_YearsActive = @Trainer_YearsActive, Trainer_Cost = @Trainer_Cost WHERE (Trainer_ID = @original_Trainer_ID)";
    string cmdstring3 = "DELETE FROM Trainer WHERE (Trainer_ID = @original_Trainer_ID)";

    string cmdstring4 = "Select COUNT(*) FROM Trainer WHERE Trainer_ID = @Trainer_ID";


    public void CleartextBoxes1()
    {
        foreach (Control Cleartext in this.Controls)
        {
            if (Cleartext is TextBox)
            {
                ((TextBox)Cleartext).Text = string.Empty;
            }
        }
    }


    public void Readfalse()
    {
        foreach (Control Cleartext in this.Controls)
        {
            if (Cleartext is TextBox)
            {
                ((TextBox)Cleartext).ReadOnly = false ;
            }
        }
    }

    public void Readtrue()
    {
        foreach (Control Cleartext in this.Controls)
        {
            if (Cleartext is TextBox)
            {
                ((TextBox)Cleartext).ReadOnly = true;
            }
        }
    }




    public void Enabledfalse()
    {
        foreach (Control Cleartext in this.Controls)
        {
            if (Cleartext is TextBox)
            {
                ((TextBox)Cleartext).Enabled = false;
            }
        }
    }


    public void Enabledtrue()
    {
        foreach (Control Cleartext in this.Controls)
        {
            if (Cleartext is TextBox)
            {
                ((TextBox)Cleartext).Enabled = true;
            }
        }
    }







    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void DropDownList1_SelectedIndexChanged(Object sender, EventArgs e) 
    {


    

    Trainer_IDval = DropDownList1.SelectedItem.Value;

        DataView dvSql = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);



        if (Trainer_IDval == "")

        {


        }

        else


            foreach (DataRowView drvSql in dvSql)
            {


            
                Trainer_ID = drvSql["Trainer_ID"].ToString();
                txtTrainer_ID.Text = (Trainer_ID.Trim());

                Trainer_Fname = drvSql["Trainer_Fname"].ToString();
                txtTrainer_Fname.Text = (Trainer_Fname.Trim());

                Trainer_Sname = drvSql["Trainer_Sname"].ToString();
                txtTrainer_Sname.Text = (Trainer_Sname.Trim());

                Trainer_Gym = drvSql["Trainer_Gym"].ToString();
                txtTrainer_Gym.Text = (Trainer_Gym.Trim());

                Trainer_Address = drvSql["Trainer_Address"].ToString();
                txtTrainer_Address.Text = (Trainer_Address.Trim());

                Trainer_Postcode = drvSql["Trainer_Postcode"].ToString();
                txtTrainer_Postcode.Text = (Trainer_Postcode.Trim());

                Trainer_City = drvSql["Trainer_City"].ToString();
                txtTrainer_City.Text = (Trainer_City.Trim());

                //'Trainer_Gender = drvSql("Trainer_Gender").ToString()
                //'txtTrainer_Gender.Text = Trim(Trainer_Gender)


                Trainer_Gender = drvSql["Trainer_Gender"].ToString();

                if (Trainer_Gender.Trim() == "Male")
                {
                       txtTrainer_Gender.SelectedValue = "Male";

                }


                 

                else if (Trainer_Gender.Trim() == "Female")

                {
                    txtTrainer_Gender.SelectedValue = "Female";
                }
                    
                else
                {


                }

           


                Trainer_Type = drvSql["Trainer_Type"].ToString();
                txtTrainer_Type.Text = (Trainer_Type.Trim());

                Trainer_Qualification = drvSql["Trainer_Qualification"].ToString();
                txtTrainer_Qualification.Text = (Trainer_Qualification.Trim());

                Trainer_Age = drvSql["Trainer_Age"].ToString();
                txtTrainer_Age.Text = (Trainer_Age.Trim());

                Trainer_Latitude = drvSql["Trainer_Latitude"].ToString();
                txtTrainer_Latitude.Text = (Trainer_Latitude.Trim());

                Trainer_Longitude = drvSql["Trainer_Longitude"].ToString();
                txtTrainer_Longitude.Text = (Trainer_Longitude.Trim());

                Trainer_YearsActive = drvSql["Trainer_YearsActive"].ToString();
                txtTrainer_YearsActive.Text = (Trainer_YearsActive.Trim());

                Trainer_Cost = drvSql["Trainer_Cost"].ToString();
                txtTrainer_Cost.Text = (Trainer_Cost.Trim());

            }

        

    }
        


   
    protected void btnInsert_Click(Object sender, EventArgs e) 
    {

         Trainer_ID = txtTrainer_ID.Text;
        Trainer_Fname = txtTrainer_Fname.Text;
        Trainer_Sname = txtTrainer_Sname.Text;
        Trainer_Gym = txtTrainer_Gym.Text;
        Trainer_Address = txtTrainer_Address.Text;
        Trainer_Postcode = txtTrainer_Postcode.Text;
        Trainer_City = txtTrainer_City.Text;
        Trainer_Gender = txtTrainer_Gender.Text;
        Trainer_Type = txtTrainer_Type.Text;
        Trainer_Qualification = txtTrainer_Qualification.Text;
        Trainer_Age = txtTrainer_Age.Text;
        Trainer_Latitude = txtTrainer_Latitude.Text;
        Trainer_Longitude = txtTrainer_Longitude.Text;
        Trainer_YearsActive = txtTrainer_YearsActive.Text;
        Trainer_Cost = txtTrainer_Cost.Text;

       cs = ConfigurationManager.ConnectionStrings["FindaTrainerNIDB"].ConnectionString;
        conn = new SqlConnection(cs);
        ////'Command to count number of clients with same ID
        cmd = new SqlCommand(cmdstring4, conn);

        cmd.Parameters.AddWithValue("@Trainer_ID", Trainer_ID);

        conn.Open();

        SqlDataReader myReader;

        myReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (myReader.Read())
        {

            result = myReader.GetInt32(0);

        }

            

 

        if (result >= 1)  
        {
          

        }
else
        {

            goto line1;

        }
            
line1:



        cs = ConfigurationManager.ConnectionStrings["FindaTrainerNIDB"].ConnectionString;

        conn = new SqlConnection(cs);
        cmd = new SqlCommand(cmdstring2, conn);

        cmd.Parameters.AddWithValue("@Trainer_ID", Trainer_ID);

        cmd.Parameters.AddWithValue("@Trainer_Fname", Trainer_Fname);
        cmd.Parameters.AddWithValue("@Trainer_Sname", Trainer_Sname);
        cmd.Parameters.AddWithValue("@Trainer_Gym", Trainer_Gym);
        cmd.Parameters.AddWithValue("@Trainer_Address", Trainer_Address);
        cmd.Parameters.AddWithValue("@Trainer_Postcode", Trainer_Postcode);
        cmd.Parameters.AddWithValue("@Trainer_City", Trainer_City);
        cmd.Parameters.AddWithValue("@Trainer_Gender", Trainer_Gender);
        cmd.Parameters.AddWithValue("@Trainer_Type", Trainer_Type);
        cmd.Parameters.AddWithValue("@Trainer_Qualification", Trainer_Qualification);
        cmd.Parameters.AddWithValue("@Trainer_Age", Trainer_Age);
        cmd.Parameters.AddWithValue("@Trainer_Latitude", Trainer_Latitude);
        cmd.Parameters.AddWithValue("@Trainer_Longitude", Trainer_Longitude);
        cmd.Parameters.AddWithValue("@Trainer_YearsActive", Trainer_YearsActive);
        cmd.Parameters.AddWithValue("@Trainer_Cost", Trainer_Cost);


        conn.Open();

        cmd.ExecuteNonQuery();

        conn.Close();

        DropDownList1.DataBind();


    }

 

    protected void btnUpdate_Click(Object sender, EventArgs e) 
    {

        Trainer_IDval = DropDownList1.SelectedItem.Value;
        Trainer_Fname = txtTrainer_Fname.Text;
        Trainer_Sname = txtTrainer_Sname.Text;
        Trainer_Gym = txtTrainer_Gym.Text;
        Trainer_Address = txtTrainer_Address.Text;
        Trainer_Postcode = txtTrainer_Postcode.Text;
        Trainer_City = txtTrainer_City.Text;
        Trainer_Gender = txtTrainer_Gender.Text;
        Trainer_Type = txtTrainer_Type.Text;
        Trainer_Qualification = txtTrainer_Qualification.Text;
        Trainer_Age = txtTrainer_Age.Text;
        Trainer_Latitude = txtTrainer_Latitude.Text;
        Trainer_Longitude = txtTrainer_Longitude.Text;
        Trainer_YearsActive = txtTrainer_YearsActive.Text;
        Trainer_Cost = txtTrainer_Cost.Text;


         cs = ConfigurationManager.ConnectionStrings["FindaTrainerNIDB"].ConnectionString;

        conn = new SqlConnection(cs);
        cmd = new SqlCommand(cmdstring1, conn);

        cmd.Parameters.AddWithValue("@original_Trainer_ID", Trainer_IDval);
        cmd.Parameters.AddWithValue("@Trainer_Fname", Trainer_Fname);
        cmd.Parameters.AddWithValue("@Trainer_Sname", Trainer_Sname);
        cmd.Parameters.AddWithValue("@Trainer_Gym", Trainer_Gym);
        cmd.Parameters.AddWithValue("@Trainer_Address", Trainer_Address);
        cmd.Parameters.AddWithValue("@Trainer_Postcode", Trainer_Postcode);
        cmd.Parameters.AddWithValue("@Trainer_City", Trainer_City);
        cmd.Parameters.AddWithValue("@Trainer_Gender", Trainer_Gender);
        cmd.Parameters.AddWithValue("@Trainer_Type", Trainer_Type);
        cmd.Parameters.AddWithValue("@Trainer_Qualification", Trainer_Qualification);
        cmd.Parameters.AddWithValue("@Trainer_Age", Trainer_Age);
        cmd.Parameters.AddWithValue("@Trainer_Latitude", Trainer_Latitude);
        cmd.Parameters.AddWithValue("@Trainer_Longitude", Trainer_Longitude);
        cmd.Parameters.AddWithValue("@Trainer_YearsActive", Trainer_YearsActive);
        cmd.Parameters.AddWithValue("@Trainer_Cost", Trainer_Cost);





        conn.Open();

        cmd.ExecuteNonQuery();

        conn.Close();


    }





        

       


    protected void btnDelete_Click(Object sender, EventArgs e)

    {
        Trainer_IDval = DropDownList1.SelectedItem.Value;

       cs = ConfigurationManager.ConnectionStrings["FindaTrainerNIDB"].ConnectionString;
        conn = new SqlConnection(cs);
        cmd = new SqlCommand(cmdstring3, conn);

        cmd.Parameters.AddWithValue("@original_Trainer_ID", Trainer_IDval);






        conn.Open();

        cmd.ExecuteNonQuery();

        conn.Close();

        DropDownList1.DataBind();



        {
            CleartextBoxes1();
          

             

        }


        

    }


      
       



            

        



    protected void btnAddnew_Click(Object sender, EventArgs e)

    {
        btnAddnew.Visible = false;
        btnEdit.Visible = false;
        btnDelete.Visible = false;
        btnInsert.Visible = true;
        btnCancel.Visible = true;
        DropDownList1.Enabled = false;
        
        
        {
            CleartextBoxes1();
            Readfalse();
            Enabledtrue();




        }
            
   





    }
        
        



    protected void btnEdit_Click(Object sender, EventArgs e)

    {

         btnUpdate.Visible = true;
        btnCancel.Visible = true;
        btnDelete.Visible = false;
        btnAddnew.Visible = false;
        btnEdit.Visible = false;

        {
            CleartextBoxes1();
            Readfalse();
            Enabledtrue();
     

        }
           
        
    }

    protected void btnCancel_Click(Object sender, EventArgs e) 
    {

         btnInsert.Visible = false;
        btnCancel.Visible = false;
        btnUpdate.Visible = false;
        btnDelete.Visible = true;
        btnAddnew.Visible = true;
        btnEdit.Visible = true;
        DropDownList1.Enabled = true;


        {
            CleartextBoxes1();
            Readtrue();
            Enabledfalse();


        }
            
            


    }

       


       


}