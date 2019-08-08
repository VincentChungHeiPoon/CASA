<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sections.aspx.cs" Inherits="CASAInterview.Sections" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="SectionPage" runat="server">
        <div>
            Home Page
            <asp:Button id="buttonViewSection" Text="Home"  runat="server"
                OnClick="onButtonHomePageClick" ToolTip="View/Create/Update Section"
                CausesValidation ="false"/>
        </div>
        <table>
            <tr>  
                <td>Section ID :</td>  
                    <td>  
                        <asp:TextBox ID="textBoxSectionID" runat="server">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ControlToValidate="textBoxSectionID"
                            ID="RequiredSectionIDValidator" 
                            runat="server" 
                            ErrorMessage="Required"
                            ForeColor = "Red">                            
                        </asp:RequiredFieldValidator>
                        <asp:CustomValidator 
                            ControlToValidate="textBoxSectionID"
                            ID="UniqueSectionIDValidator"
                            runat="server" 
                            onservervalidate="uniqueSectionIDValidation"
                            ErrorMessage="Section is not Unique"
                            ForeColor = "Red">

                        </asp:CustomValidator>
                      
                    </td>  
            </tr>
            <tr>  
                <td>Section number :</td>  
                    <td>  
                        <asp:TextBox ID="textBoxSectionNumber" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ControlToValidate="textBoxSectionNumber"
                            ID="RequiredSectionNumberValidator" 
                            runat="server" 
                            ErrorMessage="Required"
                            ForeColor = "Red">                            
                        </asp:RequiredFieldValidator> 
                        <asp:RangeValidator ID="SectionNumberValidator" 
                            runat="server"
                            Type="Integer" 
                            MinimumValue="0" 
                            MaximumValue="99999"                            
                            ErrorMessage="Needs to be Interger Value between 0 - 99999"
                            ControlToValidate="textBoxSectionNumber"
                            ForeColor = "Red">
                        </asp:RangeValidator>
                    </td>  
            </tr>
            <tr>  
                <td>Course ID :</td>  
                    <td>  
                        <asp:TextBox ID="textBoxCourseID" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ControlToValidate="textBoxCourseID"
                            ID="RequiredTextBoxCourseIDValidator" 
                            runat="server" 
                            ErrorMessage="Required"
                            ForeColor = "Red">                            
                        </asp:RequiredFieldValidator>
                    </td>  
            </tr>
            <tr>  
                <td>Department :</td>  
                    <td>  
                        <asp:TextBox ID="textBoxDepartment" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ControlToValidate="textBoxDepartment"
                            ID="RequiredDepartmentValidator" 
                            runat="server" 
                            ErrorMessage="Required"
                            ForeColor = "Red">                            
                        </asp:RequiredFieldValidator>
                    </td>  
            </tr>
            <tr>
                <td>Active</td>
                <td>
                    <asp:DropDownList ID="DropDownListIsSectionActive" runat="server">  
                        <asp:ListItem Text="Yes" Value= "True" Selected="True"></asp:ListItem>  
                        <asp:ListItem Text="No" Value= "False"></asp:ListItem>   
                    </asp:DropDownList> 
                 </td>
            </tr>

            <tr>  
                    <td>  
                        <asp:Button ID="buttonAddSection" OnClick="onButtonAddSectionClick" runat="server" Text="Add Section" />  
                    </td>  
                </tr>
       </table>

        <div>
            <asp:GridView ID="gridSections"  runat="server">  
                <emptydatatemplate>
                No Section Found  
                </emptydatatemplate> 
            </asp:GridView>  
       </div>
    </form>
</body>
</html>
