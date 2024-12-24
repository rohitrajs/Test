<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="frmTest.aspx.cs" Inherits="frmTest" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table bgcolor="#cccccc" border="0" cellpadding="1" cellspacing="1" class="centerTable">
        <tr>
            <td class="input_form_caption_td" colspan="5">
                <telerik:RadTabStrip ID="SubTabs1" runat="server" MultiPageID="mpClasses" SelectedIndex="0" Align="left">
                    <Tabs>
                        <telerik:RadTab runat="server" Text="StudentInfo" PageViewID="RadPageView1" Selected="True"></telerik:RadTab>
                        <telerik:RadTab runat="server" Text="TeacherInfo" PageViewID="RadPageView2"></telerik:RadTab>
                        <telerik:RadTab runat="server" Text="SubjectInfo" PageViewID="RadPageView3"></telerik:RadTab>
                        <telerik:RadTab runat="server" Text="Details" PageViewID="RadPageView4"></telerik:RadTab>
                        <telerik:RadTab runat="server" Text="SearchStudent" PageViewID="RadPageView5"></telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
                <telerik:RadMultiPage ID="mpClasses" runat="server" SelectedIndex="0" Width="100%">

                    <telerik:RadPageView ID="RadPageView1" runat="server" Width="100%">

                        <table style="width: 100%" bgcolor="#cccccc" border="0" cellpadding="1" cellspacing="1" class="centerTable">
                            <tr>
                                <td style="text-align: center" class="form_header" colspan="4">
                                    <asp:Label ID="lblStudInfo" runat="server" Text="Student Info">
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="input_form_caption_td" align="center" style="width: 220px;">
                                    <asp:Label ID="lblName" runat="server" Text="Name:"></asp:Label>
                                </td>
                                <td class="input_form_caption_td" align="left" style="width: 220px;">
                                    <asp:TextBox ID="txtName" runat="server" Placeholder="Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ForeColor="Red" ValidationGroup="InsertStudData" ControlToValidate="txtName" ErrorMessage="* Name is required!" />
                                </td>
                            </tr>
                            <tr>
                                <td class="input_form_caption_td" align="center" style="width: 220px;">
                                    <asp:Label ID="lblAge" runat="server" Text="Age:"></asp:Label>
                                </td>
                                <td class="input_form_caption_td" align="left" style="width: 220px;">
                                    <asp:TextBox ID="txtAge" runat="server" Placeholder="Age"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvAge" runat="server" ForeColor="Red" ValidationGroup="InsertStudData" ControlToValidate="txtAge" ErrorMessage="* Age is required!" />
                                </td>
                            </tr>
                            <tr>
                                <td class="input_form_caption_td" align="center" style="width: 220px;">
                                    <asp:Label ID="lblImg" runat="server" Text="Image Upload:"></asp:Label>
                                </td>
                                <td class="input_form_caption_td" align="left" style="width: 220px;">
                                    <asp:FileUpload ID="fuImage" runat="server" />
                                    <asp:Label ID="lblImgError" runat="server" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="input_form_caption_td" align="center" style="width: 220px;">
                                    <asp:Label ID="lblClass" runat="server" Text="Class:"></asp:Label>
                                </td>
                                <td class="input_form_caption_td" align="left" style="width: 220px;">
                                    <asp:TextBox ID="txtClass" runat="server" Placeholder="Class"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvClass" runat="server" ForeColor="Red" ControlToValidate="txtClass" ValidationGroup="InsertStudData" ErrorMessage="* Class is required!" />
                                </td>
                            </tr>
                            <tr>
                                <td class="input_form_caption_td" align="center" style="width: 220px;">
                                    <asp:Label ID="lblRoll" runat="server" Text="Roll Number:"></asp:Label>
                                </td>
                                <td class="input_form_caption_td" align="left" style="width: 220px;">
                                    <asp:TextBox ID="txtRollNumber" runat="server" Placeholder="Roll Number"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvRollNumber" runat="server" ForeColor="Red" ControlToValidate="txtRollNumber" ValidationGroup="InsertStudData" ErrorMessage="* Roll Number is required!" />
                                </td>
                            </tr>
                            <tr>
                                <td class="input_form_caption_td" align="center" style="width: 220px;" colspan="4">
                                    <asp:Button ID="btnSubmit" runat="server" Text="Add Student" ValidationGroup="InsertStudData" OnClick="btnSubmit_Click" />
                                </td>
                            </tr>
                        </table>
                    </telerik:RadPageView>

                    <telerik:RadPageView ID="RadPageView2" runat="server" Width="100%">
                        <table style="width: 100%" bgcolor="#cccccc" border="0" cellpadding="1" cellspacing="1" class="centerTable">
                            <tr>
                                <td style="text-align: center" class="form_header" colspan="4">
                                    <asp:Label ID="lblTeachInfo" runat="server" Text="Teacher Info">
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="input_form_caption_td" align="center" style="width: 220px;">
                                    <asp:Label ID="lbltechName" runat="server" Text="Teacher Name:"></asp:Label>
                                </td>
                                <td class="input_form_caption_td" align="left" style="width: 220px;">
                                    <asp:TextBox ID="txtTeachName" runat="server" Placeholder="Teacher Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvNae" runat="server" ForeColor="Red" ValidationGroup="InsertTechData" ControlToValidate="txtTeachName" ErrorMessage="* Teacher Name is required!" />
                                </td>
                            </tr>
                            <tr>
                                <td class="input_form_caption_td" align="center" style="width: 220px;">
                                    <asp:Label ID="Label3" runat="server" Text="Age:"></asp:Label>
                                </td>
                                <td class="input_form_caption_td" align="left" style="width: 220px;">
                                    <asp:TextBox ID="txtTechAge" runat="server" Placeholder="Age"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ValidationGroup="InsertTechData" ControlToValidate="txtTechAge" ErrorMessage="* Age is required!" />
                                </td>
                            </tr>
                            <tr>
                                <td class="input_form_caption_td" align="center" style="width: 220px;">
                                    <asp:Label ID="lblIUpload" runat="server" Text="Image Upload:"></asp:Label>
                                </td>
                                <td class="input_form_caption_td" align="left" style="width: 220px;">
                                    <asp:FileUpload ID="fuTeachImg" runat="server" />
                                    <asp:Label ID="lblTechUpload" runat="server" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="input_form_caption_td" align="center" style="width: 220px;">
                                    <asp:Label ID="lblSex" runat="server" Text="Sex: "></asp:Label>
                                </td>
                                <td class="input_form_caption_td" align="left" style="width: 220px;">
                                    <asp:DropDownList ID="ddlSex" runat="server">
                                        <asp:ListItem Text="Select an option" Value=""></asp:ListItem>
                                        <asp:ListItem Text="Male" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Female" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Other" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvddlSex" runat="server" ForeColor="Red" ValidationGroup="InsertTechData" ControlToValidate="ddlSex" ErrorMessage="* Required!" />

                                </td>
                            </tr>
                            <tr>
                                <td class="input_form_caption_td" align="center" style="width: 220px;" colspan="4">
                                    <asp:Button ID="btnSubmitTech" runat="server" Text="Add Teacher" ValidationGroup="InsertTechData" OnClick="btnSubmitTech_Click" />
                                </td>
                            </tr>
                        </table>
                    </telerik:RadPageView>

                    <telerik:RadPageView ID="RadPageView3" runat="server" Width="100%">
                        <table style="width: 100%" bgcolor="#cccccc" border="0" cellpadding="1" cellspacing="1" class="centerTable">
                            <tr>
                                <td style="text-align: center" class="form_header" colspan="4">
                                    <asp:Label ID="lblSubj" runat="server" Text="Subject Info">
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="input_form_caption_td" align="center" style="width: 220px;">
                                    <asp:Label ID="lblSubName" runat="server" Text="Subject Name:"></asp:Label>
                                </td>
                                <td class="input_form_caption_td" align="left" style="width: 220px;">
                                    <asp:TextBox ID="txtSubName" runat="server" Placeholder="Subject Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvSubname" runat="server" ForeColor="Red" ValidationGroup="languageValid" ControlToValidate="txtSubName" ErrorMessage="* Subject Name is required!" />
                                </td>
                            </tr>
                            <tr>
                                <td class="input_form_caption_td" align="center" style="width: 220px;">
                                    <asp:Label ID="lblCl" runat="server" Text="Class: "></asp:Label>
                                </td>
                                <td class="input_form_caption_td" align="left" style="width: 220px;">
                                    <asp:TextBox ID="txSubClass" runat="server" Placeholder="Class"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvSubLCass" runat="server" ForeColor="Red" ValidationGroup="languageValid" ControlToValidate="txSubClass" ErrorMessage="* Required!" />
                                </td>
                            </tr>
                            <tr>
                                <td class="input_form_caption_td" align="center" style="width: 220px;">
                                    <asp:Label ID="lblLanguage" runat="server" Text="Language: "></asp:Label>
                                </td>
                                <td class="input_form_caption_td" align="left" style="width: 220px;">
                                    <asp:TextBox ID="txtlanguage" runat="server" Placeholder="language"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rvflan" runat="server" ForeColor="Red" ValidationGroup="languageValid" ControlToValidate="txtlanguage" ErrorMessage="* Required!" />
                                </td>
                            </tr>
                            <tr>
                                <td class="input_form_caption_td" align="center" style="width: 220px;" colspan="4">
                                    <asp:Button ID="btnSubmitlan" runat="server" ValidationGroup="languageValid" Text="Add Subject" OnClick="btnSubmitlan_Click" />
                                </td>
                            </tr>
                        </table>
                    </telerik:RadPageView>

                    <telerik:RadPageView ID="RadPageView4" runat="server" Width="100%">
                        <table bgcolor="#cccccc" border="0" cellpadding="1" cellspacing="1" class="centerTable">
                            <tr>
                                <td style="text-align: center" class="form_header" colspan="4">
                                    <asp:Label ID="Label1" runat="server" Text="Details">
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <div style="overflow: scroll; width: 950px; padding-top: 5px; background-color: aliceblue">
                                        <asp:GridView ID="gvSubjectsTeachers" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Subject">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSubject" runat="server" Text='<%#Eval("Subject") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Class">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblClassss" runat="server" Text='<%#Eval("Class") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Language">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLan" runat="server" Text='<%#Eval("Language") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Teacher">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblTe" runat="server" Text='<%#Eval("Teacher") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </telerik:RadPageView>

                    <telerik:RadPageView ID="RadPageView5" runat="server" Width="100%">
                        <table bgcolor="#cccccc" border="0" cellpadding="1" cellspacing="1" class="centerTable">
                            <tr>
                                <td style="text-align: center" class="form_header" colspan="4">
                                    <asp:Label ID="Label2" runat="server" Text="Search Student">
                                    </asp:Label>
                                </td>
                            </tr>

                            <tr>
                                <td class="input_form_caption_td" align="center" style="width: 220px;">
                                    <asp:TextBox ID="txtSearchName" runat="server" Placeholder="Search by Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rvfSearch" runat="server" ForeColor="Red" ValidationGroup="SearchVali" ControlToValidate="txtSearchName" ErrorMessage="* Required!" />
                                </td>
                                <td class="input_form_caption_td" align="left" style="width: 220px;">
                                    <asp:Button ID="btnSearch" runat="server" Text="Search" ValidationGroup="SearchVali" OnClick="btnSearch_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <div style="overflow: scroll; width: 950px; padding-top: 5px; background-color: aliceblue">
                                        <asp:GridView ID="gvStudents" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="true" EmptyDataText="No Record Found">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblStuNa" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Age">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblStuAg" runat="server" Text='<%#Eval("Age") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Class">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblStuCl" runat="server" Text='<%#Eval("Class") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Roll Number">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblStuRol" runat="server" Text='<%#Eval("RollNumber") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Image">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblStuIm" runat="server" Text='<%#Eval("Image") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </telerik:RadPageView>

                </telerik:RadMultiPage>
            </td>
        </tr>
    </table>

</asp:Content>

