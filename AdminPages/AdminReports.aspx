<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/MasterPage.master" AutoEventWireup="true" CodeFile="AdminReports.aspx.cs" Inherits="AdminPages_AdminReports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <h2>Admin Reports</h2>
    <table class="table table-reflow">
        <tr>
            <td><asp:Button ID="btnTrainersOffered" runat="server" CssClass="btn btn-link" Text="Trainers Offered" /></td>
            <td><asp:TextBox ID="txtTrainerOffered" runat="server" CssClass="text-center text-capitalize" ReadOnly></asp:TextBox> </td>
           </tr>
        <tr>
            <td> <asp:Button ID="btnTrainerAppointment" runat="server" CssClass="btn btn-link" Text="Appointments Booked" /></td>
            <td><asp:TextBox ID="txtTrainerAppointment" runat="server" CssClass="text-center text-capitalize" ReadOnly></asp:TextBox></asp:Label></td>
           
        </tr>
        <tr>
            <td><asp:Button ID="btnAverageAge" runat="server" CssClass="btn btn-link" Text="Average Trainer Age" /></td>
            <td><asp:TextBox ID="txtAverageAge" runat="server" CssClass="text-center text-capitalize" ReadOnly></asp:TextBox></td>
          
        </tr>
        </table>
    <h4>Appointment Report</h4>
           <div class="container">
    <div class="row">
        <div class='col-sm-6'>
            <div class="form-group">
                <div class='input-group date' id='date1'>
                    <asp:TextBox  id="txtdate1" runat="server"  class="form-control" placeholder="Select Date"></asp:TextBox>
                
                    
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Select a Date" ForeColor="Red" ControlToValidate="txtdate1" ValidationGroup="1">*</asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
       
    </div>
</div>
      
            
            
            <div class="container">
    <div class="row">
        <div class='col-sm-6'>
            <div class="form-group">
                <div class='input-group date' id='date2'>

                     <asp:TextBox  id="txtdate2" runat="server" class="form-control" placeholder="Select Date" ></asp:TextBox>
                  
                    
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Select a Date" ForeColor="Red" ControlToValidate="txtDate2" ValidationGroup="1">*</asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
       
    </div>
</div>


      
                        <asp:Button ID="btnDateData" runat="server" CssClass="btn btn-primary" Text="Display Results" />
                     <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AdminPages/AdminArea.aspx">Return to Admin Area</asp:HyperLink>
        

             <div class="table-responsive">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FindaTrainerNIDB %>" SelectCommand="SELECT Appointment.Appointment_ID, Client.Client_Fname + Client.Client_Sname AS ClientName, TrainerAppointment.Trainer_Name, Appointment.Appointment_Booked, Appointment.Appointment_Date, Appointment.Appointment_Time, TrainerAppointment.Total FROM Client INNER JOIN Appointment ON Client.Client_ID = Appointment.Client_ID INNER JOIN TrainerAppointment ON Appointment.Appointment_ID = TrainerAppointment.Appointment_ID WHERE (Appointment.Appointment_Date &gt;= @date1) AND (Appointment.Appointment_Date &lt;= @date2)">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtdate1" Name="date1" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtdate2" Name="date2" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Appointment_ID" CssClass="table table-striped" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Appointment_ID" HeaderText="Appointment_ID" SortExpression="Appointment_ID" ReadOnly="True" />
                <asp:BoundField DataField="ClientName" HeaderText="ClientName" SortExpression="ClientName" ReadOnly="True" />
                <asp:BoundField DataField="Trainer_Name" HeaderText="Trainer_Name" SortExpression="Trainer_Name" />
                <asp:BoundField DataField="Appointment_Booked" HeaderText="Appointment_Booked" SortExpression="Appointment_Booked" />
                <asp:BoundField DataField="Appointment_Date" HeaderText="Appointment_Date" SortExpression="Appointment_Date" />
                <asp:BoundField DataField="Appointment_Time" HeaderText="Appointment_Time" SortExpression="Appointment_Time" />
                <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" DataFormatString="{0:C}" />
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



    
  

   


  

    

</asp:Content>


