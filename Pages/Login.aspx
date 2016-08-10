<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Pages_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <section class="container-fluid">
      <div class="jumbotron">
         <h2>Welcome to FindaTrainerNI</h2>
         <p>Looking for some extra support with your fitness goals?</p>
         <p>You've came to the right place join FindatrainerNI today and book and appointment with some of the highest quality trainers in your area.</p>
         <div id="login">
            <h2>Login to FindaTrainerNI</h2>
              
            <asp:Login ID="Login1" runat="server" CreateUserText="Register" class="table table-responsive" >
               <LayoutTemplate>
                 <!--Login Control to gain authorised access to the system-->
                   <table class="table table-responsive" >
                     <tr>
                        <td>
                           <asp:TextBox ID="UserName" CssClass="form-control" runat="server" placeholder="Enter User Name" required></asp:TextBox>
                           <asp:RequiredFieldValidator ID="UserNameRequired" runat="server"  ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1"><span class="glyphicon glyphicon-exclamation-sign"></span></asp:RequiredFieldValidator>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <asp:TextBox ID="Password" CssClass="Password form-control" runat="server"  type="password" placeholder="Enter password" TextMode="Password" required></asp:TextBox>
                           <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1"><span class="glyphicon glyphicon-exclamation-sign"></asp:RequiredFieldValidator>
                        </td>
                     </tr>
                     <tr>
                        <td >
                           <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                        </td>
                     </tr>
                     <tr>
                        <td >
                           <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                            <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="Login1" CssClass="bg-danger alert-danger"  />
                        </td>
                     </tr>
                     <tr>
                        <td >
                           <asp:Button ID="LoginButton" runat="server" Class="btn btn-primary" CommandName="Login" Text="Log In" ValidationGroup="Login1" OnClick="LoginButton_Click" />
                        </td>
                     </tr>
                     <tr>
                        <td >
                           <input id="CreateUserLink" type="button" class="btn btn-link" value="Register New User" /><span class="glyphicon glyphicon-user" data-toggle="tooltip" data-placement="top" title="Select to Begin Registration"></span>
                        </td>
                     </tr>
                  </table>
                  </td>
                  </tr>
                  </table>
               </LayoutTemplate>
            </asp:Login>
         </div>
         <div id="Register">
            <h2>Register to FindaTrainerNI</h2>
            <asp:CreateUserWizard ID="CreateUserWizard1" runat="server"  class="table table-responsive">
               <WizardSteps>
                  <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                     <ContentTemplate>
                        <table class="table table-responsive">
                           <tr>
                              <td>
                                 <asp:TextBox ID="UserName" CssClass="form-control" runat="server" placeholder="Enter User Name" ></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizard1"><span class="glyphicon glyphicon-exclamation-sign"></asp:RequiredFieldValidator>
                              </td>
                           </tr>
                           <tr>
                              <td>
                                 <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="Password form-control" placeholder="Enter Password" ></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard1"><span class="glyphicon glyphicon-exclamation-sign"></asp:RequiredFieldValidator>
                              </td>
                           </tr>
                           <tr>
                              <td>
                                 <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" CssClass="Password form-control" placeholder="Confirm Password" ></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1"><span class="glyphicon glyphicon-exclamation-sign"></asp:RequiredFieldValidator>
                              </td>
                           </tr>
                           <tr>
                              <td >
                                 <asp:TextBox ID="Email" runat="server" placeholder="Enter Email" CssClass="form-control" ></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1"><span class="glyphicon glyphicon-exclamation-sign"></asp:RequiredFieldValidator>
                              </td>
                           </tr>
                           <tr>
                              <td >
                                 <asp:Button ID="StepNextButton" runat="server" CssClass="btn btn-primary" CommandName="MoveNext" Text="Create User" ValidationGroup="CreateUserWizard1" />
                               <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="bg-danger alert-danger" ValidationGroup="CreateUserWizard1" />
                              </td>
                           </tr>
                           <tr>
                              <td >
                                  
                                 <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match." CssClass="bg-danger alert-danger" ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                             
                              
                              </td>
                           </tr>
                           <tr>
                              <td >
                                 <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                              </td>
                           </tr>
                        </table>
                     </ContentTemplate>
                     <CustomNavigationTemplate>
                        <table  >
                           <tr >
                              <td >
                              </td>
                           </tr>
                        </table>
                     </CustomNavigationTemplate>
                  </asp:CreateUserWizardStep>
                  <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                     <ContentTemplate>
                        <table>
                           <tr>
                              <td >Complete</td>
                           </tr>
                           <tr>
                              <td>Your account has been successfully created.</td>
                           </tr>
                           <tr>
                              <td >
                                 <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue" Text="Continue" ValidationGroup="CreateUserWizard1" CssClass="btn btn-primary" />
                              </td>
                           </tr>
                        </table>
                     </ContentTemplate>
                  </asp:CompleteWizardStep>
               </WizardSteps>
               <FinishNavigationTemplate>
                  <asp:Button ID="FinishPreviousButton" runat="server" CausesValidation="False" CommandName="MovePrevious" Text="Previous" />
                  <asp:Button ID="FinishButton" runat="server" CommandName="MoveComplete" Text="Finish" />
               </FinishNavigationTemplate>
               <StartNavigationTemplate>
                  <asp:Button ID="StartNextButton" runat="server" CommandName="MoveNext" Text="Next" />
               </StartNavigationTemplate>
               <StepNavigationTemplate>
                  <asp:Button ID="StepPreviousButton" runat="server" CausesValidation="False" CommandName="MovePrevious" Text="Previous" />
                  <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" Text="Next" />
               </StepNavigationTemplate>
            </asp:CreateUserWizard>
         </div>
      </div>
   </section>
</asp:Content>