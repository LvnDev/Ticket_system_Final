<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manager.aspx.cs" Inherits="Ticket_system.manager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manager Dashboard</title>
    <style>
        body {
            background-image: url("images/sky.png");
        }

        .section {
            display: block;
            margin-left: auto;
            margin-right: auto;
            width: 95%;
            background-color: lightblue;
            text-align: center;
            border-radius: 5px;
        }

        .Top {
            text-align: center;
            background-color: antiquewhite;
        }

        .right {
            text-align: right;
            margin-left: auto;
            margin-right: 15%;
            display: flex;
            justify-content: flex-end;
        }

        h1, h2, h3, h4, h5, p, a, Label, GridView {
            font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
        }

        .font {
            font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
        }

        .container {
            font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
            display: block;
            justify-content: flex-end;
        }

        #search {
            width: 100%;
            height: 50%;
            text-align: center;
            justify-content: center;
        }

        #modify {
            width: 100%;
            height: 80%;
            text-align: center;
            justify-content: center;
        }
        .grid{
            justify-content: center;
            text-align:center;
            margin-right:auto;
            margin-left:auto;
            width: 95%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="Top">
            <br />
            <h1>Account Manager</h1>
            <hr />
            <div class="right">
            <br />
            <asp:Button ID="logoutBtn" runat="server" Text="logout" OnClick="logout_Click" Height="23px" Width="113px" />
            &nbsp
            &nbsp
            <h5>Account ID: <span><asp:Label ID="IdLbl" runat="server" Text=""></asp:Label></span></h5>
            &nbsp
            &nbsp
            <h5>Emploment area: <span><asp:Label ID="employeeLbl" runat="server" Text=""></asp:Label></span></h5>
            &nbsp
            <br />
        </div>
            <asp:Button ID="homeBtn" runat="server" Text="Go back Home" OnClick="homeBtn_Click" />
        </div>
        <div class="section">
            <br />
            <h5>Search Indexer</h5>
            <div class="container">
                <div id="search">
                    <asp:Label runat="server" Text="Name: " CssClass="font"></asp:Label>
                    <asp:TextBox ID="SnameTxt" runat="server" MaxLength="35" TextMode="Search"></asp:TextBox>
                    &nbsp
                    <asp:Label runat="server" Text="ID: " CssClass="font"></asp:Label>
                    <asp:TextBox ID="SidTxt" runat="server" TextMode="Number"></asp:TextBox>
                    &nbsp
                    <asp:Label runat="server" Text="Email: " CssClass="font"></asp:Label>
                    <asp:TextBox ID="SemailTxt" runat="server" MaxLength="35"></asp:TextBox>
                    &nbsp
                    <asp:Button ID="searchBtn" runat="server" Text="Search" BackColor="#00CCFF" Height="21px" Width="99px" OnClick="searchBtn_Click" />
                </div>
                <br />
                    <asp:GridView ID="accountGridview" Width="85%" runat="server" AllowCustomPaging="True" AllowPaging="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" PageSize="8" HorizontalAlign="Center">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                            </Columns>
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                    <div id="modify">
                    <h5>Account Create/Modify</h5>
                    <asp:Label runat="server" Text="Name: " CssClass="font"></asp:Label>
                    <asp:TextBox ID="MnameTxt" runat="server" MaxLength="35" TextMode="Search"></asp:TextBox>
                    &nbsp
                    <asp:Label runat="server" Text="Password: " CssClass="font"></asp:Label>
                    <asp:TextBox ID="MpassTxt" runat="server" TextMode="Password"></asp:TextBox>
                    &nbsp
                    <asp:Label runat="server" Text="Email: " CssClass="font"></asp:Label>
                    <asp:TextBox ID="MemailTxt" runat="server" TextMode="Email" MaxLength="35"></asp:TextBox>
                    &nbsp
                    <asp:Label runat="server" Text="Employee Type: " CssClass="font"></asp:Label>
                    <asp:TextBox ID="MtypeTxt" runat="server" TextMode="Number" MaxLength="1" Width="28px" style="margin-left: 0px"></asp:TextBox>
                    &nbsp
                    <asp:Button ID="modifyBtn" runat="server" Text="Modify" BackColor="#FF9933" Height="21px" Width="99px" OnClick="modifyBtn_Click" />
                        &nbsp
                        &nbsp
                    <asp:Button ID="createBtn" runat="server" Text="Create" BackColor="#00CC00" Height="21px" Width="99px" OnClick="createBtn_Click" />
                        &nbsp
                        &nbsp
                    <asp:Button ID="delBtn" runat="server" Text="Delete" BackColor="Red" Height="21px" Width="99px" OnClick="delBtn_Click" ForeColor="White" />
                    <br />
                    <asp:Label ID="errorLbl" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
