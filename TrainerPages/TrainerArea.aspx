<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/MasterPage.master" AutoEventWireup="true" CodeFile="TrainerArea.aspx.cs" Inherits="TrainerPages_TrainerArea" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Trainer Area</h2>
    <table class="table table-bordered">
       
         
          
        
        
         <tr>
            <td><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/TrainerPages/TrainerAppointments.aspx" data-toggle="tooltip" data-placement="top" title="View Appointments">Trainer Appointments</asp:HyperLink></td>
            <td><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/TrainerPages/TrainerEmails.aspx" data-toggle="tooltip" data-placement="top" title="View Emails">Trainer Emails</asp:HyperLink></td>
           
        </tr>
        
        
       
          <tr>
            <td><asp:ImageButton ID="Image1" runat="server" class="img-responsive img-rounded" PostBackUrl="~/TrainerPages/TrainerAppointments.aspx" ImageUrl="~/Images/AppointmentImage.png" /></td>
            <td><asp:ImageButton ID="Image2" runat="server" class="img-responsive img-rounded" ImageUrl="~/Images/EmailImage.png" PostBackUrl="~/TrainerPages/TrainerEmails.aspx" /></td>
           
        </tr> 
    </table>

</asp:Content>

