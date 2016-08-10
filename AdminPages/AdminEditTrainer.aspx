<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/MasterPage.master" AutoEventWireup="true" CodeFile="AdminEditTrainer.aspx.cs" Inherits="AdminPages_AdminEditTrainer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <section>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FindaTrainerNIDB %>" SelectCommand="SELECT Trainer_ID FROM Trainer"></asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FindaTrainerNIDB %>" SelectCommand="SELECT Trainer_ID, Trainer_Fname, Trainer_Sname, Trainer_Gym, Trainer_Address, Trainer_Postcode, Trainer_City, Trainer_Gender, Trainer_Type, Trainer_Qualification, Trainer_Age, Trainer_Latitude, Trainer_Longitude, Trainer_YearsActive, Trainer_Cost FROM Trainer WHERE (Trainer_ID = @TrainerID)">
         <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="TrainerID" PropertyName="SelectedValue" />
         </SelectParameters>
      </asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:FindaTrainerNIDB %>" DeleteCommand="DELETE FROM Trainer WHERE (Trainer_ID = @original_Trainer_ID)" InsertCommand="INSERT INTO [Trainer] ([Trainer_ID], [Trainer_Fname], [Trainer_Sname], [Trainer_Gym], [Trainer_Address], [Trainer_Postcode], [Trainer_City], [Trainer_Gender], [Trainer_Type], [Trainer_Age], [Trainer_Qualification], [Trainer_Latitude], [Trainer_Longitude], [Trainer_YearsActive], [Trainer_Cost], [Trainer_Picture]) VALUES (@Trainer_ID, @Trainer_Fname, @Trainer_Sname, @Trainer_Gym, @Trainer_Address, @Trainer_Postcode, @Trainer_City, @Trainer_Gender, @Trainer_Type, @Trainer_Age, @Trainer_Qualification, @Trainer_Latitude, @Trainer_Longitude, @Trainer_YearsActive, @Trainer_Cost, @Trainer_Picture)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Trainer]" UpdateCommand="UPDATE Trainer SET Trainer_Fname = @Trainer_Fname, Trainer_Sname = @Trainer_Sname, Trainer_Gym = @Trainer_Gym, Trainer_Address = @Trainer_Address, Trainer_Postcode = @Trainer_Postcode, Trainer_City = @Trainer_City, Trainer_Gender = @Trainer_Gender, Trainer_Type = @Trainer_Type, Trainer_Age = @Trainer_Age, Trainer_Qualification = @Trainer_Qualification, Trainer_Latitude = @Trainer_Latitude, Trainer_Longitude = @Trainer_Longitude, Trainer_YearsActive = @Trainer_YearsActive, Trainer_Cost = @Trainer_Cost, Trainer_Picture = @Trainer_Picture WHERE (Trainer_ID = @original_Trainer_ID)">
         <DeleteParameters>
            <asp:Parameter Name="original_Trainer_ID" Type="String" />
         </DeleteParameters>
         <InsertParameters>
            <asp:Parameter Name="Trainer_ID" Type="String" />
            <asp:Parameter Name="Trainer_Fname" Type="String" />
            <asp:Parameter Name="Trainer_Sname" Type="String" />
            <asp:Parameter Name="Trainer_Gym" Type="String" />
            <asp:Parameter Name="Trainer_Address" Type="String" />
            <asp:Parameter Name="Trainer_Postcode" Type="String" />
            <asp:Parameter Name="Trainer_City" Type="String" />
            <asp:Parameter Name="Trainer_Gender" Type="String" />
            <asp:Parameter Name="Trainer_Type" Type="String" />
            <asp:Parameter Name="Trainer_Age" Type="Int32" />
            <asp:Parameter Name="Trainer_Qualification" Type="String" />
            <asp:Parameter Name="Trainer_Latitude" Type="String" />
            <asp:Parameter Name="Trainer_Longitude" Type="String" />
            <asp:Parameter Name="Trainer_YearsActive" Type="Int32" />
            <asp:Parameter Name="Trainer_Cost" Type="Decimal" />
            <asp:Parameter Name="Trainer_Picture" Type="String" />
         </InsertParameters>
         <UpdateParameters>
            <asp:Parameter Name="Trainer_Fname" Type="String" />
            <asp:Parameter Name="Trainer_Sname" Type="String" />
            <asp:Parameter Name="Trainer_Gym" Type="String" />
            <asp:Parameter Name="Trainer_Address" Type="String" />
            <asp:Parameter Name="Trainer_Postcode" Type="String" />
            <asp:Parameter Name="Trainer_City" Type="String" />
            <asp:Parameter Name="Trainer_Gender" Type="String" />
            <asp:Parameter Name="Trainer_Type" Type="String" />
            <asp:Parameter Name="Trainer_Age" Type="Int32" />
            <asp:Parameter Name="Trainer_Qualification" Type="String" />
            <asp:Parameter Name="Trainer_Latitude" Type="String" />
            <asp:Parameter Name="Trainer_Longitude" Type="String" />
            <asp:Parameter Name="Trainer_YearsActive" Type="Int32" />
            <asp:Parameter Name="Trainer_Cost" Type="Decimal" />
            <asp:Parameter Name="Trainer_Picture" Type="String" />
            <asp:Parameter Name="original_Trainer_ID" Type="String" />
         </UpdateParameters>
      </asp:SqlDataSource>
      <h2>Edit Trainers</h2>
      <table class="table table-responsive table-hover">
         <tr>
            <td>
               <asp:Label runat="server" Text="Select Trainer ID" CssClass="label label-primary"></asp:Label>
               <asp:DropDownList ID="DropDownList1" runat="server" class="btn btn-primary" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Trainer_ID" DataValueField="Trainer_ID">
                  <asp:ListItem></asp:ListItem>
               </asp:DropDownList>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AdminPages/AdminArea.aspx">Return to Admin Area</asp:HyperLink>
            </td>
         </tr>
         <tr>
            <td>
               <asp:TextBox runat="server" ID="txtTrainer_ID" class="form-control" placeholder="TrainerID" Readonly="True" required/>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter a Trainer ID" ControlToValidate="txtTrainer_ID" ValidationGroup="AdminEditTrainer"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
            </td>
         </tr>
         <tr>
            <td>
               <asp:TextBox runat="server" ID="txtTrainer_Fname" class="form-control" placeholder="Trainer Firstname" Readonly="True" required/>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter a Firstname" ControlToValidate="txtTrainer_Fname" ValidationGroup="AdminEditTrainer"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
            </td>
         </tr>
         <tr>
            <td>
               <asp:TextBox runat="server" ID="txtTrainer_Sname" class="form-control" placeholder="Trainer Surname" Readonly="True" required/>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter a Surname" ControlToValidate="txtTrainer_Sname" ValidationGroup="AdminEditTrainer"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
            </td>
         </tr>
         <tr>
            <td>
               <asp:TextBox runat="server" ID="txtTrainer_Gym" class="form-control" placeholder="Trainer Gym" Readonly="True" required/>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter a Gym Name" ControlToValidate="txtTrainer_Gym" ValidationGroup="AdminEditTrainer"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
            </td>
         </tr>
         <tr>
            <td>
               <asp:TextBox runat="server" ID="txtTrainer_Address" class="form-control" placeholder="Trainer Address" Readonly="True" required/>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please enter an address" ControlToValidate="txtTrainer_Address" ValidationGroup="AdminEditTrainer"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
            </td>
         </tr>
         <tr>
            <td>
               <asp:TextBox runat="server" ID="txtTrainer_Postcode" class="form-control" placeholder="Trainer Postcode" Readonly="True"  required/>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please enter a postcode" ControlToValidate="txtTrainer_Postcode" ValidationGroup="AdminEditTrainer"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
            <br />
             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter the correct postcode format" ValidationExpression="^(((([A-PR-UWYZ][0-9][0-9A-HJKS-UW]?)|([A-PR-UWYZ][A-HK-Y][0-9][0-9ABEHMNPRV-Y]?))\s{0,2}[0-9]([ABD-HJLNP-UW-Z]{2}))|(GIR\s{0,2}0AA))$" ControlToValidate="txtTrainer_Postcode" ValidationGroup="AdminEditTrainer"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RegularExpressionValidator>
            </td>
         </tr>
         <tr>
            <td>
               <asp:TextBox runat="server" ID="txtTrainer_City" class="form-control" placeholder="Trainer City"  Readonly="True" required/>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please enter a city" ControlToValidate="txtTrainer_City" ValidationGroup="AdminEditTrainer"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
            </td>
         </tr>
         <tr>
            <td>
             
                              <asp:DropDownList ID="txtTrainer_Gender"  runat="server" CssClass="form-control" Enabled="false" required>
                  <asp:ListItem runat="server" id="None"></asp:ListItem>
                  <asp:ListItem runat="server" id="Male">Male</asp:ListItem>
                  <asp:ListItem runat="server" id="Female">Female</asp:ListItem>
               </asp:DropDownList>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please enter a gender" ControlToValidate="txtTrainer_Gender" ValidationGroup="AdminEditTrainer"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
            </td>
         </tr>
         <tr>
            <td>
               <asp:TextBox runat="server" ID="txtTrainer_Type" class="form-control" placeholder="Trainer Type"  Readonly="True" required/>

             <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Please enter a training type" ControlToValidate="txtTrainer_Type" ValidationGroup="AdminEditTrainer"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
            </td>
         </tr>
         <tr>
            <td>
               <asp:TextBox runat="server" ID="txtTrainer_Qualification" class="form-control" placeholder="Trainer Qualification" Readonly="True" required/>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Please enter a qualification" ControlToValidate="txtTrainer_Qualification" ValidationGroup="AdminEditTrainer"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
            </td>
         </tr>
         <tr>
            <td>
               <asp:TextBox runat="server" ID="txtTrainer_Age" class="form-control" placeholder="Trainer Age"  Readonly="True" required/>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Please enter an age" ControlToValidate="txtTrainer_Age" ValidationGroup="AdminEditTrainer"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
              <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtTrainer_Age" ErrorMessage="enter a valid number in age field." ValidationExpression="^[0-9]*$" ValidationGroup="AdminEditTrainer"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RegularExpressionValidator>
                

            </td>
         </tr>
          
         <tr>
            <td>
               <asp:TextBox runat="server" ID="txtTrainer_Latitude" class="form-control" placeholder="Trainer Latitude" Readonly="True" required/>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Please enter latitude" ControlToValidate="txtTrainer_Latitude" ValidationGroup="AdminEditTrainer"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
           <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtTrainer_Latitude" ErrorMessage="enter a valid latitude number." ValidationExpression="^[0-9]*$" ValidationGroup="AdminEditTrainer"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RegularExpressionValidator>
                 </td>
         </tr>
         <tr>
            <td>
               <asp:TextBox runat="server" ID="txtTrainer_Longitude" class="form-control" placeholder="Trainer Longitude" Readonly="True" required/>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="Please enter a longitude" ControlToValidate="txtTrainer_Longitude" ValidationGroup="AdminEditTrainer"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
            
            </td>
         </tr>
         <tr>
            <td>
               <asp:TextBox runat="server" ID="txtTrainer_YearsActive" class="form-control" placeholder="Trainer Years Active" Readonly="True" required/>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="Please enter years active" ControlToValidate="txtTrainer_YearsActive" ValidationGroup="AdminEditTrainer"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
            
            </td>
         </tr>
         <tr>
            <td>
               <div class="input-group">
                  <span class="input-group-addon">£</span>
                  <asp:TextBox runat="server" ID="txtTrainer_Cost" class="form-control" placeholder="Trainer Cost" Readonly="True" required/>
                   <span class="input-group-addon">.00</span>
               </div>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="Please enter a cost" ControlToValidate="txtTrainer_Cost" ValidationGroup="AdminEditTrainer"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
            <br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtTrainer_Cost" ErrorMessage="enter a valid number for cost without decimal." ValidationExpression="^[0-9]*$" ValidationGroup="AdminEditTrainer"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RegularExpressionValidator>
            </td>
         </tr>
         <tr>
            <td>
               <asp:Button ID="btnAddnew" runat="server" Text="Add New Record" CssClass="btn-link" CausesValidation="true" formnovalidate />
               <asp:Button ID="btnEdit" runat="server" Text="Edit Records" CssClass="btn-link" CausesValidation="true" formnovalidate />
                <asp:Button ID="btnDelete" runat="server" Text="Delete Current" CssClass="btn-link" CausesValidation="true" formnovalidate/>
               <asp:Button ID="btnInsert" runat="server" Text="Insert" Visible="false" CssClass="btn-link" ValidationGroup="AdminEditTrainer"/>
               <asp:Button ID="btnUpdate" runat="server" Text="Update" Visible="false" CssClass="btn-link" ValidationGroup="AdminEditTrainer"/>
               

               <asp:Button ID="btnCancel" runat="server" Text="Cancel" Visible="false" CssClass="btn-link" CausesValidation="true" formnovalidate/>

                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="bg-danger alert-danger" ValidationGroup="AdminEditTrainer" />
            </td>
         </tr>
      </table>
   </section>
</asp:Content>
