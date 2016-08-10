<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/MasterPage.master" AutoEventWireup="true" CodeFile="AdminEmails.aspx.cs" Inherits="AdminPages_AdminEmails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FindaTrainerNIDB %>" SelectCommand="SELECT * FROM [Email]"></asp:SqlDataSource>
    
    <section id="AdminEmails" runat="server">
    <h2>Admin Emails</h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Email_ID" DataSourceID="SqlDataSource1" CssClass="table table-striped" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Email_ID" HeaderText="Email ID" InsertVisible="False" ReadOnly="True" SortExpression="Email_ID" />
            <asp:BoundField DataField="Email_CID" HeaderText="Email CID" SortExpression="Email_CID" />
            <asp:BoundField DataField="Email_CName" HeaderText="Email CName" SortExpression="Email_CName" />
            <asp:BoundField DataField="Email_CEmail" HeaderText="Email CEmail" SortExpression="Email_CEmail" />
            <asp:BoundField DataField="Email_Subject" HeaderText="Email Subject" SortExpression="Email_Subject" />
            <asp:BoundField DataField="Email_Message" HeaderText="Email Message" SortExpression="Email_Message" />
            <asp:BoundField DataField="Email_Date" HeaderText="Email Date" SortExpression="Email_Date" />

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
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/AdminPages/AdminArea.aspx">Return to Admin Area</asp:HyperLink>
    </section>

    <section id="AdminReply" runat="server" visible="false">
       
        <h2>Reply Email</h2>
         <div runat="server" id="MessageSent" visible="false" class="alert alert-info" role="alert">
  <asp:Button ID="btnCloseMessage" runat="server" class="btn btn-link" Text="Close" CausesValidation="true" formnovalidate />
<h3 class="text-center">Message Successfully Sent</h3>
</div>
        <div class="contact-form">



    <div class="form-group">
        <asp:TextBox id="txtSubject" class="form-control" runat="server" name="Subject" placeholder="Subject" required></asp:TextBox>

        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter a subject" ControlToValidate="txtSubject" ValidationGroup="AdminEmailForm"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
</div>
</div>
<textarea  id="txtMessage" class="form-control" runat="server" name="message" placeholder="Message"></textarea>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter a message" ControlToValidate="txtMessage" ValidationGroup="AdminEmailForm"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
<br />

<div class="form-group">
    <asp:Button ID="btnEmail" runat="server" class="btn btn-primary" type="submit" Text="Submit" ValidationGroup="AdminEmailForm" />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AdminPages/AdminArea.aspx">Return to Admin Area</asp:HyperLink>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="bg-danger alert-danger" ValidationGroup="AdminEmailForm" />


</div>





    </section>
</asp:Content>

