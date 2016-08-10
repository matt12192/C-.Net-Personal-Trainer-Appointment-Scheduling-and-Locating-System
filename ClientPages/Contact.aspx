<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/MasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="ClientPages_Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <section class="content">
           

<div class="jumbotron">
<h2>Contact Us </h2>

<address>
<strong>Address:</strong> 372 Creek Road, Belfast , BT11 9FI <br/> 
<strong>Landline:</strong> 02890324327 <br/>
<strong>Mobile:</strong> 07836728627 <br />
<strong>Email:</strong> FindatrainerNI@hotmail.com
</address>

</div>
   <div runat="server" id="MessageSent" visible="false" class="alert alert-info" role="alert">
  <asp:Button ID="btnCloseMessage" runat="server" class="btn btn-link" Text="Close" CausesValidation="true" formnovalidate OnClick="btnCloseMessage_Click" />
<h3 class="text-center">Message Successfully Sent</h3>
</div>  
<div class="contact-form">


<div class="form-group">
<input  id="txtClientID" class="form-control" runat="server" name="ClientID" placeholder="ClientID" type="text" required />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter a Client ID if not registered type not registed" ControlToValidate="txtClientID" ValidationGroup="Contact"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
</div>

<div class="form-group">
<input  id="txtName" class="form-control" runat="server" name="name" placeholder="Name" type="text" required />
     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter a name" ControlToValidate="txtName" ValidationGroup="Contact"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
</div>
  <div class="form-group">
<div class="input-group">
 <span class="input-group-addon">@</span>
<input id="txtEmail" class="form-control" runat="server" name="email" placeholder="Email" type="email" required />
    </div>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter an email" ControlToValidate="txtEmail" ValidationGroup="Contact"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>

      </div>
    <div class="form-group">
<input id="txtSubject" class="form-control" runat="server" name="Subject" placeholder="Subject" type="text" required />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter a subject" ControlToValidate="txtSubject" ValidationGroup="Contact"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
</div>
</div>
<textarea  id="txtMessage" class="form-control" runat="server" name="message" placeholder="Message" required></textarea>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please enter a message" ControlToValidate="txtMessage" ValidationGroup="Contact"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
<br />

<div class="form-group">
    <asp:Button ID="btnEmail" runat="server" class="btn btn-primary" type="submit" Text="Submit" ValidationGroup="Contact" OnClick="btnEmail_Click" />
     <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="bg-danger alert-danger" ValidationGroup="Contact" />

</div>
      

        </section>

</asp:Content>
