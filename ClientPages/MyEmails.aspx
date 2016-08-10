<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/MasterPage.master" AutoEventWireup="true" CodeFile="MyEmails.aspx.cs" Inherits="ClientPages_MyEmails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FindaTrainerNIDB %>" SelectCommand="SELECT * FROM [ClientEmail] WHERE ([Email_Type] = @Email_Type)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="Email_Type" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    <section id="ClientEmails" runat="server">
       
    <h2>My Emails</h2>
         <asp:DropDownList ID="DropDownList1" runat="server" class="btn btn-primary" AutoPostBack="True">
            <asp:ListItem>Select Email Type</asp:ListItem>
            <asp:ListItem Value="Admin">Admin</asp:ListItem>
            <asp:ListItem Value="Trainer">Trainer</asp:ListItem>
        </asp:DropDownList>


    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Email_ID" DataSourceID="SqlDataSource1" CssClass="table table-striped" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Email_ID" HeaderText="Email ID" InsertVisible="False" ReadOnly="True" SortExpression="Email_ID" />
            <asp:BoundField DataField="Email_AID" HeaderText="Email AID" SortExpression="Email_AID" />
            <asp:BoundField DataField="Email_CID" HeaderText="Email CID" SortExpression="Email_CID" />
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
        </section>

    <section id="ClientReply" runat="server" visible="false">
        <h2>Reply Email</h2>
        <div class="contact-form">



    <div class="form-group">
<input id="txtSubject" class="form-control" runat="server" name="Subject" placeholder="Subject" type="text" required />
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter a subject" ControlToValidate="txtSubject" ValidationGroup="MyEmails"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
</div>

          <div class="form-group">
<textarea  id="txtMessage" class="form-control" runat="server" name="message" placeholder="Message"></textarea>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter a message" ControlToValidate="txtMessage" ValidationGroup="MyEmails"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
</div>

<div class="form-group">
    <asp:Button ID="btnEmail" runat="server" class="btn btn-primary" type="submit" Text="Submit" ValidationGroup="MyEmails" />
     <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="bg-danger alert-danger" ValidationGroup="MyEmails" />
   
</div>
</div>





    </section>






</asp:Content>
