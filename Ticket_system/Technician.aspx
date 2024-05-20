<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Technician.aspx.cs" Inherits="Ticket_system.Technician" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        body {
            background-image: url("images/sky.png");
        }

        .section {
            display: block;
            margin-left: auto;
            margin-right: auto;
            width: 90%;
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
            display: flex;
            justify-content: flex-end;
        }

        #inbox {
            width: 30%;
            height: 70%;
            text-align: center;
            justify-content: center;
        }

        #mail {
            width: 70%;
            height: 70%;
            text-align: center;
            justify-content: center;
        }
    </style>
    <title>Technician Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="Top">
            <br />
            <h1>Create Ticket</h1>
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
        <br />
        <div class="section">
            <div>
                <h3>Dashboard</h3>
                <hr />
                <div class="container">
                    <div id="inbox">
                        <h4>Tickets</h4>
                        <hr />
                        <asp:Button ID="completeBtn" runat="server" Text="Mark as Complete" BackColor="#FFFF66" OnClick="completeBtn_Click" />
                        <div style="padding-left:10px;">
                        <asp:GridView ID="ticketGridview" runat="server" Width="80%" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="TicketID" OnSelectedIndexChanged="ticketGridview_SelectedIndexChanged">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="TicketID" HeaderText="TicketID" InsertVisible="False" ReadOnly="True" SortExpression="TicketID" />
                                <asp:BoundField DataField="subject" HeaderText="subject" SortExpression="subject"/>
                                <asp:BoundField DataField="employeeID" HeaderText="employeeID" SortExpression="employeeID" />
                            </Columns>
                            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                            <RowStyle BackColor="White" ForeColor="#330099" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                            <SortedAscendingCellStyle BackColor="#FEFCEB" />
                            <SortedAscendingHeaderStyle BackColor="#AF0101" />
                            <SortedDescendingCellStyle BackColor="#F6F0C0" />
                            <SortedDescendingHeaderStyle BackColor="#7E0000" />
                        </asp:GridView>
                        </div>
                    </div>
                    <div id="mail">
                        <h4>Ticket Message</h4>
                        <hr />
                        <h4>Subject</h4>
                        <asp:TextBox ID="subTxtbox" runat="server" Width="90%" ReadOnly="True"></asp:TextBox>
                        <h4>Message</h4>
                        <asp:TextBox ID="msgTxtbox" runat="server" Width="90%" Height="250px" ReadOnly="True" TextMode="MultiLine"></asp:TextBox>
                        <br />
                        <div style="text-align:right; padding-right:30px">
                            <br />
                            <asp:Label ID="empnameLbl" runat="server" Text=""></asp:Label>
                            <br />
                            <asp:Label ID="empemailLbl" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <br />
</body>
</html>
