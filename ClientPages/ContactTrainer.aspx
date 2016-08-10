<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/MasterPage.master" AutoEventWireup="true" CodeFile="ContactTrainer.aspx.cs" Inherits="ClientPages_ContactTrainer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Contact Trainer</h2>
    <div runat="server" id="MessageSent" visible="false" class="alert alert-info" role="alert">
  <asp:Button ID="btnCloseMessage" runat="server" class="btn btn-link" Text="Close" CausesValidation="true" formnovalidate OnClick="btnCloseMessage_Click" />
<h3 class="text-center">Message Successfully Sent</h3>
</div>
    
    
    <div class="contact-form">


<div class="form-group">
<input  id="txtClientID" class="form-control" runat="server" name="ClientID" placeholder="ClientID" type="text" required/>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter Client ID" ControlToValidate="txtClientID" ValidationGroup="ContactTrainer"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
</div>

<div class="form-group">
<input  id="txtName" class="form-control" runat="server" name="name" placeholder="Name" type="text" required/>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter name" ControlToValidate="txtName" ValidationGroup="ContactTrainer"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
</div>
<div class="form-group">
<input id="txtEmail" class="form-control" runat="server" name="email" placeholder="Email" type="email" required/>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter an email" ControlToValidate="txtEmail" ValidationGroup="ContactTrainer"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
</div>
    <div class="form-group">
<input id="txtSubject" class="form-control" runat="server" name="Subject" placeholder="Subject" type="text" required/>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter a subject" ControlToValidate="txtSubject" ValidationGroup="ContactTrainer"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
</div>
</div>
<textarea  id="txtMessage" class="form-control" runat="server" name="message" placeholder="Message" required></textarea>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please enter a message" ControlToValidate="txtMessage" ValidationGroup="ContactTrainer"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
<br />

<div class="form-group">
    <asp:Button ID="btnEmail" runat="server" class="btn btn-primary" type="submit" Text="Send Email" ValidationGroup="ContactTrainer" OnClick="btnEmail_Click" />

   <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="bg-danger alert-danger" ValidationGroup="ContactTrainer" />

</div>

</asp:Content>



