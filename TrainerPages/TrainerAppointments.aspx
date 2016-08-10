<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/MasterPage.master" AutoEventWireup="true" CodeFile="TrainerAppointments.aspx.cs" Inherits="TrainerPages_TrainerAppointments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FindaTrainerNIDB %>" SelectCommand="SELECT Appointment.Appointment_ID, TrainerAppointment.Trainer_Name, Appointment.Appointment_Booked, Appointment.Appointment_Date, Appointment.Appointment_Time, TrainerAppointment.Total FROM TrainerAppointment INNER JOIN Appointment ON TrainerAppointment.Appointment_ID = Appointment.Appointment_ID"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Appointment_ID" DataSourceID="SqlDataSource1" CssClass="table table-striped" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None">
         <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Appointment_ID" HeaderText="Appointment_ID" ReadOnly="True" SortExpression="Appointment_ID" />
            <asp:BoundField DataField="Trainer_Name" HeaderText="Trainer_Name" SortExpression="Trainer_Name" />
            <asp:BoundField DataField="Appointment_Booked" HeaderText="Appointment_Booked" SortExpression="Appointment_Booked" />
            <asp:BoundField DataField="Appointment_Date" HeaderText="Appointment_Date" SortExpression="Appointment_Date" />
            <asp:BoundField DataField="Appointment_Time" HeaderText="Appointment_Time" SortExpression="Appointment_Time" />
            <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
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
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/TrainerPages/TrainerArea.aspx">Return to Trainer Area</asp:HyperLink>

</asp:Content>

