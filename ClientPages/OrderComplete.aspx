<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/MasterPage.master" AutoEventWireup="true" CodeFile="OrderComplete.aspx.cs" Inherits="ClientPages_OrderComplete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <h2>Appointment Complete</h2>
   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FindaTrainerNIDB %>" SelectCommand="SELECT TrainerAppointment.Trainer_Name, Appointment.Appointment_Booked, Appointment.Appointment_Date, Appointment.Appointment_Time, TrainerAppointment.Total FROM TrainerAppointment INNER JOIN Appointment ON TrainerAppointment.Appointment_ID = Appointment.Appointment_ID WHERE (Appointment.Client_ID = @Client_ID) ORDER BY Appointment.Appointment_Booked DESC, Appointment.Appointment_ID DESC">
      <SelectParameters>
         <asp:SessionParameter Name="Client_ID" SessionField="Client_ID" />
      </SelectParameters>
   </asp:SqlDataSource>
   <div class="table-responsive">
      <asp:DetailsView ID="DetailsView1" runat="server" CssClass="table table-bordered" AutoGenerateRows="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
         <AlternatingRowStyle BackColor="#F7F7F7" />
         <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
         <EmptyDataRowStyle BorderColor="White" />
         <Fields>
            <asp:BoundField DataField="Trainer_Name" HeaderText="Trainer Name" SortExpression="Trainer_Name" />
            <asp:BoundField DataField="Appointment_Booked" HeaderText="Appointment Booked" SortExpression="Appointment_Booked" />
            <asp:BoundField DataField="Appointment_Date" HeaderText="Appointment Date" SortExpression="Appointment_Date" />
            <asp:BoundField DataField="Appointment_Time" HeaderText="Appointment Time" SortExpression="Appointment_Time" />
            <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
         </Fields>
         <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
         <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
         <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
         <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
      </asp:DetailsView>
   </div>
   <asp:Button runat="server" Text="Return To Homepage" CssClass="btn btn-primary" PostBackUrl="~/ClientPages/Home.aspx" />
   <div runat="server" id ="PaypalButton" visible="false">
       <%--button to access sandbox account and generate checkout--%>
      <input type="hidden" name="cmd" value="_xclick"/>
      <input type="hidden" name="business" value="FindatrainerNIPaypal@hotmail.co.uk"/>
      <input type="hidden" name="currency_code" value="GBP"/>
      <input type="hidden" id="TrainerName" name="item_name" value="Trainer"/>
      <input type="hidden" id="value" name="amount" value="26"/>
      <input type="hidden" name="cancel_return" value="http://localhost:50818/ClientPages/Home.aspx"/>
      <input type="hidden" name="return" value="http://localhost:50818/ClientPages/Home.aspx"/>
      <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="https://www.sandbox.paypal.com/en_US/GB/i/btn/btn_buynowCC_LG.gif" PostBackUrl="https://www.sandbox.paypal.com/cgi-bin/webscr" />
      <input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHostedGuest"/>
      <img alt="" border="0" src="https://www.sandbox.paypal.com/en_GB/i/scr/pixel.gif" width="1" height="1"/>
   </div>
</asp:Content>

