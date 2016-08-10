<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/MasterPage.master" AutoEventWireup="true" CodeFile="SearchTrainer.aspx.cs" Inherits="ClientPages_SearchTrainer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <asp:SqlDataSource ID="SqlDataSource1" DataSourceMode="DataSet" EnableCaching="true" runat="server" ConnectionString="<%$ ConnectionStrings:FindaTrainerNIDB %>" SelectCommand="SELECT Trainer.* FROM Trainer">
   </asp:SqlDataSource>
   <asp:SqlDataSource ID="SqlDataSource4" DataSourceMode="DataSet" EnableCaching="true" runat="server" ConnectionString="<%$ ConnectionStrings:FindaTrainerNIDB %>" SelectCommand="SELECT Trainer.* FROM Trainer" FilterExpression = "Trainer_Gender = '{0}' AND Trainer_Type = '{1}' AND Trainer_Qualification = '{2}' AND Trainer_City = '{3}'">
      <%--   Parameter Filter Search Features--%>
      <FilterParameters>
         <asp:ControlParameter  
            Name="countryparam"  
            ControlID="DropDownList1"  
            PropertyName="SelectedValue" />
      </FilterParameters>
      <FilterParameters>
         <asp:ControlParameter  
            Name="countryparam"  
            ControlID="DropDownList2"  
            PropertyName="SelectedValue" />
      </FilterParameters>
      <FilterParameters>
         <asp:ControlParameter  
            Name="countryparam"  
            ControlID="DropDownList3"  
            PropertyName="SelectedValue" />
      </FilterParameters>
      <FilterParameters>
         <asp:ControlParameter  
            Name="countryparam"  
            ControlID="DropDownList4"  
            PropertyName="SelectedValue" />
      </FilterParameters>
   </asp:SqlDataSource>
   <section id="search">
      <div id="trainersearch" runat="server">
         <h2>Search Trainer</h2>
         <asp:Button ID="btnFilter" runat="server" Text="Filter Search" CssClass="btn-link" />
         <asp:Button ID="btnDisplayAll" runat="server" Text="Display All" Visible="false" CssClass="btn-link" />
         <div runat="server" id="TrainerDropdown" class="table-responsive" visible="false">
            <table class="table table-reflow">
               <tbody>
                  <tr>
                     <th scope="row">Trainer Gender:</th>
                     <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" class="btn btn-primary" AutoPostBack="True">
                           <asp:ListItem>Select Gender</asp:ListItem>
                           <asp:ListItem>Male</asp:ListItem>
                           <asp:ListItem>Female</asp:ListItem>
                        </asp:DropDownList>
                     </td>
                  </tr>
                  <tr>
                     <th scope="row">Trainer Type:</th>
                     <td>
                        <asp:DropDownList ID="DropDownList2" runat="server" class="btn btn-primary" AutoPostBack="True">
                           <asp:ListItem>Select Type</asp:ListItem>
                           <asp:ListItem>Weight</asp:ListItem>
                           <asp:ListItem>Cardio</asp:ListItem>
                           <asp:ListItem>Bodyweight</asp:ListItem>
                        </asp:DropDownList>
                     </td>
                  </tr>
                  <tr>
                     <th scope="row">Trainer Qualification:</th>
                     <td>
                        <asp:DropDownList ID="DropDownList3" runat="server" class="btn btn-primary" AutoPostBack="True">
                           <asp:ListItem Value="Select Qualifications">Select Qualifications</asp:ListItem>
                           <asp:ListItem Value="Level1">Level One</asp:ListItem>
                           <asp:ListItem Value="Level2">Level Two</asp:ListItem>
                           <asp:ListItem Value="Level3">Level Three</asp:ListItem>
                           <asp:ListItem Value="Level4">Level Four</asp:ListItem>
                        </asp:DropDownList>
                     </td>
                  </tr>
                  <tr>
                     <th scope="row">Trainer City:</th>
                     <td>
                        <asp:DropDownList ID="DropDownList4" runat="server" class="btn btn-primary" AutoPostBack="True">
                           <asp:ListItem Value="Select City">Select City</asp:ListItem>
                           <asp:ListItem>Belfast</asp:ListItem>
                           <asp:ListItem>Newtownabbey</asp:ListItem>
                           <asp:ListItem>Lisburn</asp:ListItem>
                        </asp:DropDownList>
                     </td>
                  </tr>
               </tbody>
            </table>
         </div>
         <br />
         <div class="table-responsive">
            <%--    Gridview display trainer details--%>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Trainer_ID" CssClass="table table-striped"  DataSourceID="SqlDataSource1" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None">
               <AlternatingRowStyle BackColor="White" />
               <Columns>
                  <asp:BoundField DataField="Trainer_ID" Visible="false" HeaderText="Trainer_ID" ReadOnly="True" SortExpression="Trainer_ID" />
                  <asp:BoundField DataField="Trainer_Fname" HeaderText="Firstname" SortExpression="Trainer_Fname" />
                  <asp:BoundField DataField="Trainer_Sname" HeaderText="Surname" SortExpression="Trainer_Sname" />
                  <asp:BoundField DataField="Trainer_Gender" HeaderText="Gender" SortExpression="Trainer_Gender" />
                  <asp:BoundField DataField="Trainer_Type" HeaderText="Type" SortExpression="Trainer_Type" />
                  <asp:BoundField DataField="Trainer_Age" HeaderText="Age" SortExpression="Trainer_Age" />
                  <asp:BoundField DataField="Trainer_Qualification" Visible="false" HeaderText="Qualification" SortExpression="Trainer_Qualification" />
                  <asp:BoundField DataField="Trainer_Latitude" Visible="false" HeaderText="Trainer_Latitude" SortExpression="Trainer_Latitude" />
                  <asp:BoundField DataField="Trainer_Longitude" Visible="false" HeaderText="Trainer_Longitude" SortExpression="Trainer_Longitude" />
                  <asp:BoundField DataField="Trainer_YearsActive" Visible="false" HeaderText="Years Active" SortExpression="Trainer_YearsActive" />
                  <asp:BoundField DataField="Trainer_Cost" HeaderText="Cost" SortExpression="Trainer_Cost" DataFormatString="{0:C}" />
                  <asp:BoundField DataField="Trainer_Picture" Visible="false" HeaderText="Trainer_Picture" SortExpression="Trainer_Picture" />
                  <asp:TemplateField>
                     <ItemTemplate>
                        <asp:Button runat="server" CommandName="Select" OnClick="btnTrainerDetails_Click"  Text="Trainer Details" class="btn btn-link"  />
                     </ItemTemplate>
                  </asp:TemplateField>
               </Columns>
               <EditRowStyle BackColor="#2461BF" />
               <FooterStyle CSSClass="panel-heading" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
               <HeaderStyle CSSClass="panel-heading btn-primary" />
               <PagerStyle CSSClass="panel-info" BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
               <RowStyle CSSClass="panel-primary" BackColor="#EFF3FB" />
               <SelectedRowStyle CSSClass="active" BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
               <SortedAscendingCellStyle CSSClass="panel-info" BackColor="#F5F7FB" />
               <SortedAscendingHeaderStyle CSSClass="panel-info" BackColor="#6D95E1" />
               <SortedDescendingCellStyle CSSClass="panel-info" BackColor="#E9EBEF" />
               <SortedDescendingHeaderStyle CSSClass="panel-info" BackColor="#4870BE" />
            </asp:GridView>
         </div>
      </div>
      <div id="trainerDetails" runat="server" visible="false">
         <h2>Trainer Details</h2>
         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FindaTrainerNIDB %>" SelectCommand="SELECT * FROM [Trainer] WHERE ([Trainer_ID] = @Trainer_ID)">
            <SelectParameters>
               <asp:ControlParameter ControlID="GridView1" Name="Trainer_ID" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
         </asp:SqlDataSource>
         <div class="table-responsive">
            <asp:DetailsView ID="DetailsView1" runat="server" CssClass="table table-bordered" AutoGenerateRows="False" DataKeyNames="Trainer_ID" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
               <AlternatingRowStyle BackColor="#F7F7F7" />
               <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
               <EmptyDataRowStyle BorderColor="White" />
               <Fields>
                  <asp:BoundField DataField="Trainer_ID" Visible ="false" HeaderText="Trainer_ID" ReadOnly="True" SortExpression="Trainer_ID" />
                  <asp:BoundField DataField="Trainer_Fname" HeaderText="Firstname" SortExpression="Trainer_Fname" />
                  <asp:BoundField DataField="Trainer_Sname" HeaderText="Surname" SortExpression="Trainer_Sname" />
                  <asp:BoundField DataField="Trainer_Gender" HeaderText="Gender" SortExpression="Trainer_Gender" />
                  <asp:BoundField DataField="Trainer_Type" HeaderText="Type" SortExpression="Trainer_Type" />
                  <asp:BoundField DataField="Trainer_Age" HeaderText="Age" SortExpression="Trainer_Age" />
                  <asp:BoundField DataField="Trainer_Qualification" HeaderText="Qualification" SortExpression="Trainer_Qualification" />
                  <asp:BoundField DataField="Trainer_Latitude" Visible ="false" HeaderText="Trainer_Latitude" SortExpression="Trainer_Latitude" />
                  <asp:BoundField DataField="Trainer_Longitude" Visible ="false" HeaderText="Trainer_Longitude" SortExpression="Trainer_Longitude" />
                  <asp:BoundField DataField="Trainer_YearsActive" HeaderText="Years Active" SortExpression="Trainer_YearsActive" />
                  <asp:BoundField DataField="Trainer_Cost" HeaderText="Cost" SortExpression="Trainer_Cost" DataFormatString="{0:C}" />
                  <asp:BoundField DataField="Trainer_Picture" Visible ="false" HeaderText="Trainer_Picture" SortExpression="Trainer_Picture" />
                  <asp:TemplateField>
                     <ItemTemplate>
                        <asp:Button runat="server" OnClick="btnAppointment"  Text="Book Appointment" class="btn btn-link"   />
                     </ItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField>
                     <ItemTemplate>
                        <asp:Button runat="server"  OnClick="btnViewLocation_Click"  Text="View Location" class="btn btn-link"  />
                     </ItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField>
                     <ItemTemplate>
                        <asp:Button runat="server"  OnClick="btnContactTrainer_Click"  Text="Contact Trainer" class="btn btn-link"  />
                     </ItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField>
                     <ItemTemplate>
                        <asp:Button runat="server"  OnClick="btnSearchReturn_Click"  Text="Return to Search" class="btn btn-link"  />
                     </ItemTemplate>
                  </asp:TemplateField>
               </Fields>
               <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
               <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
               <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
               <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            </asp:DetailsView>
         </div>
      </div>
      <div id="TrainerLocation" runat="server" visible="false">
         <h2>Trainer Location</h2>
         <div id="dvMap" style="width: 900px; height: 400px" class="img-responsive img-rounded"></div>
         <asp:Button runat="server" ID="btnReturnToTrainerDetails" Text="Return to Trainer Details" class="btn btn-link"   />
      </div>
      <br />
      <div runat="server" id="SelectAppointment" visible="false">
         <h1>Appointment Details</h1>
         <div class="container">
            <div class="row">
               <div class='col-sm-6'>
                  <div class="form-group">
                     <div class='input-group date' id='datetimepicker1'>
                         <asp:TextBox runat="server"  id="txtAppointment" class="form-control" placeholder="Select Date" required></asp:TextBox>
                      
                        <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                        </div>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Select a Date" ControlToValidate="txtAppointment" ValidationGroup="1"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
                     
                  </div>
               </div>
            </div>
         </div>
         <div class="container">
            <div class="row">
               <div class='col-sm-6'>
                  <div class="form-group">
                     <div class='input-group date' id='datetimepicker2'>
                         <asp:TextBox runat="server" type='text' id="txtAppointmentTime" class="form-control" placeholder="Select Time" required></asp:TextBox>
                       
                        <span class="input-group-addon">
                        <span class="glyphicon glyphicon-time"></span>
                        </span>
                        
                     </div>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Select a Time" ControlToValidate="txtAppointmentTime" ValidationGroup="1"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
                  </div>
               </div>
            </div>
         </div>

         <asp:RadioButtonList ID="RadPayment" CssClass="btn-primary" runat="server" required>
            <asp:ListItem Value="PayL">Pay Later</asp:ListItem>
            <asp:ListItem Value="PayN">Pay Now</asp:ListItem>
         </asp:RadioButtonList>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Select Payment Method" ControlToValidate="RadPayment" ValidationGroup="1"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
          
          <br />
         
         <asp:Button ID="btnConfirmAppointment" runat="server" CommandName="Select" CssClass="btn btn-primary" Text="Confirm Appointment" ValidationGroup="1" />
         <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="bg-danger alert-danger" ValidationGroup="1" />
      </div>
      <div runat="server" id="CustomerDetails"  visible="false">
         <h1>
            Customer Details
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:FindaTrainerNIDB %>" DatasourceMode="DataSet" SelectCommand="SELECT * FROM [Client] WHERE ([Client_ID] = @Client_ID)">
               <SelectParameters>
                  <asp:SessionParameter Name="Client_ID" SessionField="Client_ID" Type="String" />
               </SelectParameters>
            </asp:SqlDataSource>
         </h1>
         <div class="form-horizontal">
            <div class="form-group">
               <asp:Label ID="ClientFnamelbl" runat="server" CssClass="label label-primary" Text="Firstname:"></asp:Label>
               <asp:TextBox ID="txtClientFname" CssClass="form-control" runat="server" required></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter First Name" ControlToValidate="txtClientFname" ValidationGroup="2"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
               <asp:Label ID="ClientSnamelbl" runat="server" CssClass="label label-primary" Text="Surname:"></asp:Label>
               <asp:TextBox ID="txtClientSname" CssClass="form-control" runat="server" required></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Surname" ControlToValidate="txtClientSname" ValidationGroup="2"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
               <asp:Label ID="ClientAgelbl" runat="server" CssClass="label label-primary" Text="Age:"></asp:Label>
               <asp:TextBox ID="txtClientAge" CssClass="form-control" runat="server" required></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Age" ControlToValidate="txtClientAge" ValidationGroup="2"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
               <asp:Label ID="ClientGenderlbl" runat="server" CssClass="label label-primary" Text="Gender:"></asp:Label>
               <asp:DropDownList ID="txtClientGender"  runat="server" CssClass="form-control" Enabled="false" required>
                  <asp:ListItem></asp:ListItem>
                  <asp:ListItem runat="server" id="Male">Male</asp:ListItem>
                  <asp:ListItem runat="server" id="Female">Female</asp:ListItem>
               </asp:DropDownList>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Select Gender" ControlToValidate="txtClientGender" ValidationGroup="2"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
               <asp:Label ID="ClientAddresslbl" runat="server" CssClass="label label-primary" Text="Address:"></asp:Label>
               <asp:TextBox ID="txtClientAddress" CssClass="form-control" runat="server" required></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter Address" ControlToValidate="txtClientAddress" ValidationGroup="2"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
               <asp:Label ID="ClientCitylbl" runat="server" CssClass="label label-primary" Text="City:"></asp:Label>
               <asp:TextBox ID="txtClientCity" CssClass="form-control" runat="server" required></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter City" ControlToValidate="txtClientCity" ValidationGroup="2"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
               <asp:Label ID="ClientPostcodelbl" runat="server" CssClass="label label-primary" Text="Postcode:"></asp:Label>
               <asp:TextBox ID="txtClientPostcode" CssClass="form-control" runat="server" required></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Enter Postcode" ControlToValidate="txtClientPostcode" ValidationGroup="2"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter the correct postcode format" ValidationExpression="^(((([A-PR-UWYZ][0-9][0-9A-HJKS-UW]?)|([A-PR-UWYZ][A-HK-Y][0-9][0-9ABEHMNPRV-Y]?))\s{0,2}[0-9]([ABD-HJLNP-UW-Z]{2}))|(GIR\s{0,2}0AA))$" ControlToValidate="txtClientPostcode" ValidationGroup="2"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
               <asp:Label ID="ClientTelephonelbl" runat="server" CssClass="label label-primary" Text="Telephone:"></asp:Label>
               <asp:TextBox ID="txtClientTelephone" CssClass="form-control" runat="server" required></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Enter Telephone Number"  ControlToValidate="txtClientTelephone" ValidationGroup="2"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter Correct Telephone Number" ValidationExpression="^[0-9]{11}$" ControlToValidate="txtClientTelephone" ValidationGroup="2"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
               <asp:Label ID="ClientEmaillbl" runat="server" CssClass="label label-primary" Text="Email:"></asp:Label>
               <asp:TextBox ID="txtClientEmail" CssClass="form-control" runat="server" required></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Enter Email" ControlToValidate="txtClientEmail" ValidationGroup="2"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Enter a Valid Email"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtClientEmail" ValidationGroup="2"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
               <asp:Button ID="btnClientDetails" runat="server" CssClass="btn btn-primary" Text="Confirm Details" ValidationGroup="2" />
               <asp:ValidationSummary ID="ValidationSummary2" runat="server" CssClass="bg-danger alert-danger" ValidationGroup="2" />
            </div>
         </div>
      </div>
   </section>
</asp:Content>

