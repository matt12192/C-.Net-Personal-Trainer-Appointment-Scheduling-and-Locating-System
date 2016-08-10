<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/MasterPage.master" AutoEventWireup="true" CodeFile="TrainerEmails.aspx.cs" Inherits="TrainerPages_TrainerEmails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FindaTrainerNIDB %>" SelectCommand="SELECT * FROM [TrainerEmail]"></asp:SqlDataSource>
     <section id="TrainerEmails" runat="server">
        <h2>Trainer Emails</h2>

         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table table-striped" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None">
             <AlternatingRowStyle BackColor="White" />
              <Columns>
                 <asp:BoundField DataField="Email_ID" HeaderText="Email_ID" InsertVisible="False" ReadOnly="True" SortExpression="Email_ID" />
                 <asp:BoundField DataField="Email_TID" HeaderText="Email_TID" SortExpression="Email_TID" />
                 <asp:BoundField DataField="Email_CID" HeaderText="Email_CID" SortExpression="Email_CID" />
                 <asp:BoundField DataField="Email_CName" HeaderText="Email_CName" SortExpression="Email_CName" />
                 <asp:BoundField DataField="Email_CEmail" HeaderText="Email_CEmail" SortExpression="Email_CEmail" />
                 <asp:BoundField DataField="Email_Subject" HeaderText="Email_Subject" SortExpression="Email_Subject" />
                 <asp:BoundField DataField="Email_Message" HeaderText="Email_Message" SortExpression="Email_Message" />
                 <asp:BoundField DataField="Email_Date" HeaderText="Email_Date" SortExpression="Email_Date" />

                 <asp:TemplateField><ItemTemplate><asp:Button runat="server" CommandName="Select" OnClick="btnReplyEmail_Click"  Text="Reply to Email" class="btn btn-link"  /></ItemTemplate></asp:TemplateField>
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
         </section>


    <section id="TrainerReply" runat="server" visible="false">
        <h2>Reply Email</h2>
        <div runat="server" id="MessageSent" visible="false" class="alert alert-info" role="alert">
  <asp:Button ID="btnCloseMessage" runat="server" class="btn btn-link" Text="Close" CausesValidation="true" formnovalidate />
<h3 class="text-center">Message Successfully Sent</h3>
</div>


        <div class="contact-form">



    <div class="form-group">
<input id="txtSubject" class="form-control" runat="server" name="Subject" placeholder="Subject" type="text" required />
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter a subject" ControlToValidate="txtSubject" ValidationGroup="TrainerEmails"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
</div>
</div>
<textarea  id="txtMessage" class="form-control" runat="server" name="message" placeholder="Message"></textarea>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter a subject" ControlToValidate="txtSubject" ValidationGroup="TrainerEmails"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
<br />

<div class="form-group">
    <asp:Button ID="btnEmail" runat="server" class="btn btn-primary" type="submit" Text="Submit" ValidationGroup="TrainerEmails" />
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/TrainerPages/TrainerArea.aspx">Return to Trainer Area</asp:HyperLink>
       <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="bg-danger alert-danger" ValidationGroup="TrainerEmails" />

</div>





    </section>

</asp:Content>

