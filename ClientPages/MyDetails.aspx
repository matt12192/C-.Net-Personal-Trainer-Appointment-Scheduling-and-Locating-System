<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/MasterPage.master" AutoEventWireup="true" CodeFile="MyDetails.aspx.cs" Inherits="ClientPages_MyDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:FindaTrainerNIDB %>" DeleteCommand="DELETE FROM [Client] WHERE [Client_ID] = @original_Client_ID AND [Client_Fname] = @original_Client_Fname AND [Client_Sname] = @original_Client_Sname AND [Client_Age] = @original_Client_Age AND [Client_Gender] = @original_Client_Gender AND [Client_Address] = @original_Client_Address AND [Client_City] = @original_Client_City AND [Client_Postcode] = @original_Client_Postcode AND [Client_Telephone] = @original_Client_Telephone AND [Client_Email] = @original_Client_Email" InsertCommand="INSERT INTO [Client] ([Client_ID], [Client_Fname], [Client_Sname], [Client_Age], [Client_Gender], [Client_Address], [Client_City], [Client_Postcode], [Client_Telephone], [Client_Email]) VALUES (@Client_ID, @Client_Fname, @Client_Sname, @Client_Age, @Client_Gender, @Client_Address, @Client_City, @Client_Postcode, @Client_Telephone, @Client_Email)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Client]" UpdateCommand="UPDATE [Client] SET [Client_Fname] = @Client_Fname, [Client_Sname] = @Client_Sname, [Client_Age] = @Client_Age, [Client_Gender] = @Client_Gender, [Client_Address] = @Client_Address, [Client_City] = @Client_City, [Client_Postcode] = @Client_Postcode, [Client_Telephone] = @Client_Telephone, [Client_Email] = @Client_Email WHERE [Client_ID] = @original_Client_ID AND [Client_Fname] = @original_Client_Fname AND [Client_Sname] = @original_Client_Sname AND [Client_Age] = @original_Client_Age AND [Client_Gender] = @original_Client_Gender AND [Client_Address] = @original_Client_Address AND [Client_City] = @original_Client_City AND [Client_Postcode] = @original_Client_Postcode AND [Client_Telephone] = @original_Client_Telephone AND [Client_Email] = @original_Client_Email">
      <UpdateParameters>
         <asp:Parameter Name="Client_Fname" Type="String" />
         <asp:Parameter Name="Client_Sname" Type="String" />
         <asp:Parameter Name="Client_Age" Type="Int32" />
         <asp:Parameter Name="Client_Gender" Type="String" />
         <asp:Parameter Name="Client_Address" Type="String" />
         <asp:Parameter Name="Client_City" Type="String" />
         <asp:Parameter Name="Client_Postcode" Type="String" />
         <asp:Parameter Name="Client_Telephone" Type="String" />
         <asp:Parameter Name="Client_Email" Type="String" />
         <asp:Parameter Name="original_Client_ID" Type="String" />
         <asp:Parameter Name="original_Client_Fname" Type="String" />
         <asp:Parameter Name="original_Client_Sname" Type="String" />
         <asp:Parameter Name="original_Client_Age" Type="Int32" />
         <asp:Parameter Name="original_Client_Gender" Type="String" />
         <asp:Parameter Name="original_Client_Address" Type="String" />
         <asp:Parameter Name="original_Client_City" Type="String" />
         <asp:Parameter Name="original_Client_Postcode" Type="String" />
         <asp:Parameter Name="original_Client_Telephone" Type="String" />
         <asp:Parameter Name="original_Client_Email" Type="String" />
      </UpdateParameters>
   </asp:SqlDataSource>
   <h2>My Details</h2>
   <div class="table-responsive">
      <asp:DetailsView ID="DetailsView1" runat="server" CssClass="table table-bordered" AutoGenerateRows="False" DataKeyNames="Client_ID" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
         <AlternatingRowStyle BackColor="#F7F7F7" />
         <EmptyDataRowStyle BorderColor="White" />
         <Fields>
             <asp:TemplateField HeaderText="Client_ID" SortExpression="Client_ID" Visible="False">
                 <EditItemTemplate>
                     <asp:Label ID="Label1" runat="server" Text='<%# Eval("Client_ID") %>'></asp:Label>
                 </EditItemTemplate>
                 <InsertItemTemplate>
                     <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Client_ID") %>'></asp:TextBox>
                 </InsertItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label1" runat="server" Text='<%# Bind("Client_ID") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Firstname" SortExpression="Client_Fname">
                 <EditItemTemplate>
                     <asp:TextBox ID="txtClient_Fname" runat="server" CssClass="form-control" Text='<%# Bind("Client_Fname") %>'></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter a first name" ControlToValidate="txtClient_Fname" ValidationGroup="MyDetails"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
                 </EditItemTemplate>
                 <InsertItemTemplate>
                     <asp:TextBox ID="txtClient_Fname2" runat="server" Text='<%# Bind("Client_Fname") %>'></asp:TextBox>
                     
                 </InsertItemTemplate>
                                 <ItemTemplate>
                     <asp:Label ID="Label2" runat="server" Text='<%# Bind("Client_Fname") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Surname" SortExpression="Client_Sname">
                 <EditItemTemplate>
                     <asp:TextBox ID="txtClient_Sname" runat="server" CssClass="form-control" Text='<%# Bind("Client_Sname") %>'></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter a surname" ControlToValidate="txtClient_Sname" ValidationGroup="MyDetails"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
                 </EditItemTemplate>
                 <InsertItemTemplate>
                     <asp:TextBox ID="txtClient_Sname" runat="server"  Text='<%# Bind("Client_Sname") %>'></asp:TextBox>
                 </InsertItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label3" runat="server" Text='<%# Bind("Client_Sname") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Age" SortExpression="Client_Age">
                 <EditItemTemplate>
                     <asp:TextBox ID="txtClient_Age" runat="server" CssClass="form-control" Text='<%# Bind("Client_Age") %>'></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter an age" ControlToValidate="txtClient_Age" ValidationGroup="MyDetails"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtClient_Age" ErrorMessage="enter a valid number in age field." ValidationExpression="^[0-9]*$" ValidationGroup="MyDetails"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RegularExpressionValidator>
                 </EditItemTemplate>
                 <InsertItemTemplate>
                     <asp:TextBox ID="txtClient_Age" runat="server" Text='<%# Bind("Client_Age") %>'></asp:TextBox>
                 </InsertItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label4" runat="server" Text='<%# Bind("Client_Age") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Gender" SortExpression="Client_Gender">
                 <EditItemTemplate>
                     <asp:TextBox ID="txtClient_Gender" runat="server" CssClass="form-control" Text='<%# Bind("Client_Gender") %>'></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter a gender" ControlToValidate="txtClient_Gender" ValidationGroup="MyDetails"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
                 </EditItemTemplate>
                 <InsertItemTemplate>
                     <asp:TextBox ID="txtClient_Gender" runat="server" Text='<%# Bind("Client_Gender") %>'></asp:TextBox>
                 </InsertItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label5" runat="server" Text='<%# Bind("Client_Gender") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Address" SortExpression="Client_Address">
                 <EditItemTemplate>
                     <asp:TextBox ID="txtClient_Address" runat="server" CssClass="form-control" Text='<%# Bind("Client_Address") %>'></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please enter an address" ControlToValidate="txtClient_Address" ValidationGroup="MyDetails"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
                 </EditItemTemplate>
                 <InsertItemTemplate>
                     <asp:TextBox ID="txtClient_Address" runat="server" Text='<%# Bind("Client_Address") %>'></asp:TextBox>
                 </InsertItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label6" runat="server" Text='<%# Bind("Client_Address") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="City" SortExpression="Client_City">
                 <EditItemTemplate>
                     <asp:TextBox ID="txtClient_City" runat="server" CssClass="form-control" Text='<%# Bind("Client_City") %>'></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please enter a city" ControlToValidate="txtClient_Sname" ValidationGroup="MyDetails"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
                 </EditItemTemplate>
                 <InsertItemTemplate>
                     <asp:TextBox ID="txtClient_City" runat="server" Text='<%# Bind("Client_City") %>'></asp:TextBox>
                 </InsertItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label7" runat="server" Text='<%# Bind("Client_City") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Postcode" SortExpression="Client_Postcode">
                 <EditItemTemplate>
                     <asp:TextBox ID="txtClient_Postcode" runat="server" CssClass="form-control" Text='<%# Bind("Client_Postcode") %>'></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please enter a postcode" ControlToValidate="txtClient_Postcode" ValidationGroup="MyDetails"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="Enter the correct postcode format" ValidationExpression="^(((([A-PR-UWYZ][0-9][0-9A-HJKS-UW]?)|([A-PR-UWYZ][A-HK-Y][0-9][0-9ABEHMNPRV-Y]?))\s{0,2}[0-9]([ABD-HJLNP-UW-Z]{2}))|(GIR\s{0,2}0AA))$" ControlToValidate="txtClient_Postcode" ValidationGroup="MyDetails"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RegularExpressionValidator>
                 </EditItemTemplate>
                 <InsertItemTemplate>
                     <asp:TextBox ID="txtClient_Postcode" runat="server" Text='<%# Bind("Client_Postcode") %>'></asp:TextBox>
                 </InsertItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label8" runat="server" Text='<%# Bind("Client_Postcode") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Telephone" SortExpression="Client_Telephone">
                 <EditItemTemplate>
                     <asp:TextBox ID="txtClient_Telephone" runat="server" CssClass="form-control" Text='<%# Bind("Client_Telephone") %>'></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please enter a telephone number" ControlToValidate="txtClient_Telephone" ValidationGroup="MyDetails"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="Enter Correct Telephone Number" ValidationExpression="^[0-9]{11}$" ControlToValidate="txtClient_Telephone" ValidationGroup="MyDetails">*</asp:RegularExpressionValidator>
                      </EditItemTemplate>
                 <InsertItemTemplate>
                     <asp:TextBox ID="Client_Telephone" runat="server" Text='<%# Bind("Client_Telephone") %>'></asp:TextBox>
                 </InsertItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label9" runat="server" Text='<%# Bind("Client_Telephone") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Email" SortExpression="Client_Email">
                 <EditItemTemplate>
                     <asp:TextBox ID="txtClient_Email" runat="server" CssClass="form-control" Text='<%# Bind("Client_Email") %>'></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Please enter an email" ControlToValidate="txtClient_Email" ValidationGroup="MyDetails"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
                 <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ErrorMessage="Enter a Valid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtClient_Email" ValidationGroup="MyDetails"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RegularExpressionValidator>--%>
                 </EditItemTemplate>
                 <InsertItemTemplate>
                     <asp:TextBox ID="Client_Email" runat="server" Text='<%# Bind("Client_Email") %>'></asp:TextBox>
                 </InsertItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="Label10" runat="server" Text='<%# Bind("Client_Email") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField ShowHeader="False">
                 <EditItemTemplate>
                     <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ValidationGroup="MyDetails"></asp:LinkButton>
                     &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                 <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="bg-danger alert-danger" ValidationGroup="Contact" />
                 
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                 </ItemTemplate>
             </asp:TemplateField>
         </Fields>
         <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
         <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
         <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
         <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
      </asp:DetailsView>
       
   </div>
</asp:Content>
