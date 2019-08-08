<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Students.aspx.cs" Inherits="CASAInterview.Students" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="StudentPage" runat="server">

        <div>
            Home Page
            <asp:Button id="buttonViewSection" Text="Home"  runat="server"
                OnClick="onButtonHomePageClick" ToolTip="View/Create/Update Section"
                CausesValidation ="false"/>
        </div>
        <table>
            <tr>  
                <td>Student ID :</td>  
                    <td>  
                        <asp:TextBox ID="textBoxStudentID" runat="server"></asp:TextBox>  
                        <asp:RequiredFieldValidator
                            ControlToValidate="textBoxStudentID"
                            ID="RequiredStudentectionIDValidator" 
                            runat="server" 
                            ErrorMessage="Required"
                            ForeColor = "Red">                            
                        </asp:RequiredFieldValidator> 
                        <asp:CustomValidator 
                            ControlToValidate="textBoxStudentID"
                            ID="UniqueStudentIDValidator"
                            runat="server" 
                            onservervalidate="uniqueStudentIDValidation"
                            ErrorMessage="Student ID is not unqiue"
                            ForeColor = "Red">

                        </asp:CustomValidator>

                    </td>  
            </tr>
            <tr>  
                <td>Student peoplesoft ID :</td>  
                    <td>  
                        <asp:TextBox ID="textBoxStudentPSID" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ControlToValidate="textBoxStudentPSID"
                            ID="RequiredPSIDValidator" 
                            runat="server" 
                            ErrorMessage="Required"
                            ForeColor = "Red">                            
                        </asp:RequiredFieldValidator> 
  
                        <asp:CompareValidator runat="server"
                            Operator="DataTypeCheck"
                            Type="Integer"                             
                            ErrorMessage="Needs to be Interger Value"
                            ControlToValidate="textBoxStudentPSID"
                            ForeColor = "Red">
                        </asp:CompareValidator>

                    </td>  
            </tr>
            <tr>  
                <td>Student first name :</td>  
                    <td>  
                        <asp:TextBox ID="textBoxStudentFirstName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ControlToValidate="textBoxStudentFirstName"
                            ID="RequiredStudentFirstNameValidator" 
                            runat="server" 
                            ErrorMessage="Required"
                            ForeColor = "Red">                            
                        </asp:RequiredFieldValidator> 
                    </td>  
            </tr>
            <tr>  
                <td>Student last name :</td>  
                    <td>  
                        <asp:TextBox ID="textBoxStudentLastName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ControlToValidate="textBoxStudentLastName"
                            ID="RequiredFieldValidator1" 
                            runat="server" 
                            ErrorMessage="Required"
                            ForeColor = "Red">                            
                        </asp:RequiredFieldValidator> 
                    </td>  
            </tr>
            <tr>
                <td>Active</td>
                <td>
                    <asp:DropDownList ID="isActive" runat="server">  
                        <asp:ListItem Text="Yes" Value="True" Selected="True"></asp:ListItem>  
                        <asp:ListItem Text="No" Value="False"></asp:ListItem>   
                    </asp:DropDownList> 
                 </td>
            </tr>

            <tr>  
                    <td>  
                        <asp:Button ID="buttonAddStudent" OnClick="onButtonAddStudentClick" runat="server" Text="Add Student" />  
                    </td>  
                </tr>
       </table>

       <div>
            <asp:GridView ID="gridStudents"  runat="server">  
                <emptydatatemplate>
                No Section Found  
                </emptydatatemplate> 
            </asp:GridView>  
       </div>
    </form>
</body>
</html>
