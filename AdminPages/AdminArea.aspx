<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/MasterPage.master" AutoEventWireup="true" CodeFile="AdminArea.aspx.cs" Inherits="AdminPages_AdminArea" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    


    <h2>Admin Area</h2>
    <table class="table table-bordered">
          
        
        <tr>
            <td><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AdminPages/AdminEmails.aspx">Admin Email</asp:HyperLink></td>
            <td><asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/AdminPages/AdminEditTrainer.aspx">Edit Trainers</asp:HyperLink></td>
            <td><asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/AdminPages/AdminReports.aspx">Admin Reports</asp:HyperLink></td>
        </tr>
         <tr>
             


            <td><asp:ImageButton ID="Image1" runat="server" ImageUrl="~/Images/EmailImage.png" class="img-responsive img-rounded" PostBackUrl="~/AdminPages/AdminEmails.aspx" /></td>
             
            <td><asp:ImageButton ID="Image2" runat="server" ImageUrl="~/Images/EditImage.png" class="img-responsive img-rounded" PostBackUrl="~/AdminPages/AdminEditTrainer.aspx" /></td>
            <td><asp:ImageButton ID="Image3" runat="server" ImageUrl="~/Images/ReportImage.png" class="img-responsive img-rounded" PostBackUrl="~/AdminPages/AdminReports.aspx" /></td>
        </tr>

        
    </table>


     
    
    


    <br />


</asp:Content>

