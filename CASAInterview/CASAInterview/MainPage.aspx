<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="CASAInterview.MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="homePage" runat="server">
        <div>
            Student
            <asp:Button id="buttonViewStudent" Text="View student"  runat="server"
                OnClick="onButtonViewStudentClick" ToolTip="View/Create/Update Student"/>
        </div>
        <div>
            Section
            <asp:Button id="buttonViewSection" Text="View section"  runat="server"
                OnClick="onButtonViewSectionClick" ToolTip="View/Create/Update Section"/>
        </div>
        <div>
            Roster
            <asp:Button id="buttonViewRoster" Text="View Roster"  runat="server"
                OnClick="onButtonViewRosterClick" ToolTip="View/Create/Update Section"/>
        </div>
    </form>
</body>
</html>
