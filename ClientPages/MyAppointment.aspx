<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/MasterPage.master" AutoEventWireup="true" CodeFile="MyAppointment.aspx.cs" Inherits="ClientPages_MyAppointment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <section id="MyAppointments">
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FindaTrainerNIDB %>" DeleteCommand="DELETE FROM TrainerAppointment FROM TrainerAppointment INNER JOIN Appointment ON TrainerAppointment.Appointment_ID = Appointment.Appointment_ID WHERE (TrainerAppointment.Appointment_ID = @Appointment_ID) AND (Appointment.Appointment_ID = @Appointment_ID)" SelectCommand="SELECT TrainerAppointment.Trainer_Name, Appointment.Appointment_Booked, Appointment.Appointment_Date, TrainerAppointment.Total, Appointment.Appointment_ID FROM TrainerAppointment INNER JOIN Appointment ON TrainerAppointment.Appointment_ID = Appointment.Appointment_ID WHERE (Appointment.Client_ID = @Client_ID)">
         <DeleteParameters>
            <asp:Parameter Name="Appointment_ID" />
         </DeleteParameters>
         <SelectParameters>
            <asp:SessionParameter Name="Client_ID" SessionField="Client_ID" />
         </SelectParameters>
      </asp:SqlDataSource>
      <asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns="False" CssClass="table table-striped" DataSourceID="SqlDataSource1" DataKeyNames="Appointment_ID" CellPadding="4" ForeColor="#333333" GridLines="None">
         <AlternatingRowStyle BackColor="White" />
         <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Trainer_Name" HeaderText="Trainer Name" SortExpression="Trainer_Name" />
            <asp:BoundField DataField="Appointment_Booked" HeaderText="Appointment Booked" SortExpression="Appointment_Booked" />
            <asp:BoundField DataField="Appointment_Date" HeaderText="Appointment Date" SortExpression="Appointment_Date" />
            <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" DataFormatString="{0:C}" />
            <asp:BoundField DataField="Appointment_ID" HeaderText="Appointment_ID" Visible="false" ReadOnly="True" SortExpression="Appointment_ID" />
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
      <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FindaTrainerNIDB %>" SelectCommand="SELECT Appointment.Appointment_ID, TrainerAppointment.Trainer_Name, Appointment.Appointment_Booked, Appointment.Appointment_Date, Appointment.Appointment_Time, TrainerAppointment.Total FROM TrainerAppointment INNER JOIN Appointment ON TrainerAppointment.Appointment_ID = Appointment.Appointment_ID WHERE (Appointment.Appointment_ID = @Appointment_ID)">
         <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Appointment_ID" PropertyName="SelectedValue" />
         </SelectParameters>
      </asp:SqlDataSource>
      <asp:DetailsView ID="DetailsView1" runat="server" CssClass="table table-bordered" AutoGenerateRows="False" DataKeyNames="Appointment_ID" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
          <AlternatingRowStyle BackColor="#F7F7F7" />
               <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
               <EmptyDataRowStyle BorderColor="White" />
          <Fields>
            <asp:BoundField DataField="Appointment_ID" HeaderText="Appointment ID" ReadOnly="True" SortExpression="Appointment_ID" />
            <asp:BoundField DataField="Trainer_Name" HeaderText="Trainer Name" SortExpression="Trainer_Name" />
            <asp:BoundField DataField="Appointment_Booked" HeaderText="Appointment Booked" SortExpression="Appointment_Booked" />
            <asp:BoundField DataField="Appointment_Date" HeaderText="Appointment Date" SortExpression="Appointment_Date" />
            <asp:BoundField DataField="Appointment_Time" HeaderText="Appointment Time" SortExpression="Appointment_Time" />
            <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" DataFormatString="{0:C}" />
            <asp:TemplateField>
               <ItemTemplate>
                  <asp:Button runat="server" OnClick="btnCancel_Click"  Text="Cancel Appointment" class="btn btn-link"  />
               </ItemTemplate>
            </asp:TemplateField>
         </Fields>
           <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
               <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
               <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
               <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
      </asp:DetailsView>
   </section>
</asp:Content>
