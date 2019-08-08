<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rosters.aspx.cs" Inherits="CASAInterview.Rosters" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
            Home Page
            <asp:Button id="buttonViewSection" Text="Home"  runat="server"
                OnClick="onButtonHomePageClick" ToolTip="View/Create/Update Section"
                CausesValidation ="false"/>
            </div>
            <table>
                <tr>  
                    <td>Roster ID :</td>  
                        <td>  
                            <asp:TextBox ID="textBoxRosterID" runat="server"></asp:TextBox>  
                            <asp:RequiredFieldValidator
                                ControlToValidate="textBoxRosterID"
                                ID="RequiredRosterIDValidator" 
                                runat="server" 
                                ErrorMessage="Required"
                                ForeColor = "Red">                            
                            </asp:RequiredFieldValidator> 
                           <asp:CustomValidator 
                            ControlToValidate="textBoxRosterID"
                            ID="UniqueRosterIDValidation"
                            runat="server" 
                            onservervalidate="uniqueRosterIDValidation"
                            ErrorMessage="rosterID already exist"
                            ForeColor = "Red">
                            </asp:CustomValidator>
                            <asp:CustomValidator 
                            ControlToValidate="textBoxRosterID"
                            ID="uniqueStudentSectionValidation"
                            runat="server" 
                            onservervalidate="uniqueStudentSectioValidation"
                            ErrorMessage="Student/Section pair already exist"
                            ForeColor = "Red">
                            </asp:CustomValidator>



                        </td>  
                </tr>
                <tr>  
                    <td>Student ID :</td>  
                        <td>  
                            <asp:TextBox ID="textBoxStudentID" runat="server"></asp:TextBox>  
                            <asp:RequiredFieldValidator
                                ControlToValidate="textBoxStudentID"
                                ID="RequiredStudentIDValidator" 
                                runat="server" 
                                ErrorMessage="Required"
                                ForeColor = "Red">                            
                            </asp:RequiredFieldValidator> 
                            <asp:CustomValidator 
                            ControlToValidate="textBoxStudentID"
                            ID="UniqueStudentIDValidator"
                            runat="server" 
                            onservervalidate="uniqueStudentIDValidation"
                            ErrorMessage="Student ID does not exist"
                            ForeColor = "Red">

                        </asp:CustomValidator>

                        </td>  
                </tr>
                <tr>  
                <td>Section ID :</td>  
                    <td>  
                        <asp:TextBox ID="textBoxSectionID" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ControlToValidate="textBoxSectionID"
                            ID="RequiredSectionIDValidator" 
                            runat="server" 
                            ErrorMessage="Required"
                            ForeColor = "Red">                            
                        </asp:RequiredFieldValidator> 
  
                        <asp:CompareValidator runat="server"
                            Operator="DataTypeCheck"
                            Type="Integer"                             
                            ErrorMessage="Needs to be Interger Value"
                            ControlToValidate="textBoxSectionID"
                            ForeColor = "Red">
                        </asp:CompareValidator>

                        <asp:CustomValidator 
                            ControlToValidate="textBoxSectionID"
                            ID="UniqueSectionIDValidator"
                            runat="server" 
                            onservervalidate="uniqueSectionIDValidation"
                            ErrorMessage="Section does not exist"
                            ForeColor = "Red">

                        </asp:CustomValidator>

                    </td>  
                </tr>


                <tr>
                    <td>Active</td>
                    <td>
                        <asp:DropDownList ID="DropDownListIsRosterActive" runat="server">  
                            <asp:ListItem Text="Yes" Value= "True" Selected="True"></asp:ListItem>  
                            <asp:ListItem Text="No" Value= "False"></asp:ListItem>   
                        </asp:DropDownList> 
                     </td>
                </tr>
                <tr>  
                    <td>  
                        <asp:Button ID="buttonAddStudentToSection" OnClick="onButtonAddStudentToSectionClick" runat="server" Text="Add Roster" />  
                    </td>  
                </tr>
          </table>
        </div>

        <table>
            <tr>
                <td>
                    <asp:GridView ID="gridStudentInfo"  runat="server">  
                            <emptydatatemplate>
                            No student Found  
                            </emptydatatemplate> 
                    </asp:GridView>
                </td>
                <td>
                    <asp:GridView ID="gridRosters"  runat="server">  
                            <emptydatatemplate>
                            No rosters Found  
                            </emptydatatemplate> 
                    </asp:GridView>
                </td>
                <td>
                    <asp:GridView ID="gridSectionID"  runat="server">  
                            <emptydatatemplate>
                            No Section Found  
                            </emptydatatemplate> 
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
