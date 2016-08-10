<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/MasterPage.master" AutoEventWireup="true" CodeFile="Generalerror.aspx.cs" Inherits="Pages_Generalerror" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="jumbotron text-center">
        <h1 class="alert-danger text-danger">Error Occured</h1>
        <h1 class="alert-danger text-danger">Please Contact System Administrator!</h1>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/error.png" CssClass="img-responsive img-circle center-block"  />
        
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/ClientPages/Contact.aspx">Contact Administrator</asp:HyperLink>
 
        </div>

</asp:Content>
