<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Ticket_system.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <style>
        body{ background-image: url("images/sky.png")}
        .section {display:block; margin-left: auto; margin-right: auto; width: 75%; background-color:lightblue;
        text-align:center; border-radius: 5px;}
        .Top{text-align:center; background-color:antiquewhite;}
        .right {text-align: right; margin-left: auto; margin-right: 15%; display:flex; justify-content:flex-end;}
        h1,h2,h3,h4,h5,p,a,Label,GridView {font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif}
        .font {font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif}
        .container{display:flex; justify-content:flex-end;}
        #inbox {width:30%;height:70%; text-align:center; justify-content:center;}
        #mail {width:70%;height:70%;text-align:center; justify-content:center}

    </style>
    <title>Home</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="Top">                           
            <br />
            <h1>Automotivation</h1>
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
            <asp:Button ID="createBtn" runat="server" Text="Create Ticket" OnClick="createBtn_Click" />
            &nbsp
            &nbsp
            <asp:Button ID="techBtn" runat="server" Text="Technician Dashboard" OnClick="techBtn_Click" />
            &nbsp
            &nbsp
            <asp:Button ID="manBtn" runat="server" Text="Manager Dashboard" OnClick="manBtn_Click" />
        </div>
        <div class="section">
            <br />
            <h2>Ticket Dashboard</h2>
            <hr />
        <div class="container">
            <div id="inbox">
                <h4>Created Tickets</h4>
                <hr />
                <asp:GridView ID="inboxGrid" runat="server" AutoGenerateColumns="False" AllowPaging="True" Width="100%" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" SelectedIndexChanged="True" OnSelectedIndexChanged="inboxGrid_SelectedIndexChanged1">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="TicketID" HeaderText="ID" SortExpression="TicketID" HeaderStyle-Width="75px"/>
                        <asp:BoundField DataField="subject" HeaderText="subject" SortExpression="subject" />
                        <asp:BoundField DataField="Completed" HeaderText="Complete?" SortExpression="Completed"/>
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#3399FF" Font-Bold="True" ForeColor="Black" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
                <br />
                <asp:Button ID="delBtn" runat="server" Text="Delete Ticket" BackColor="#FF3300" ForeColor="White" OnClick="delBtn_Click" />
            </div>
            <div id="mail">
                <h4>Ticket</h4>
                <hr />
                <h5>Subject</h5>
                <asp:TextBox ID="subjectTxt" runat="server" ReadOnly="true" Width="90%"></asp:TextBox>
                <h5>Message</h5>
                <asp:TextBox ID="messageTxt" runat="server" ReadOnly="true" TextMode="MultiLine" width="90%" Height="250px"></asp:TextBox>
            </div>
        </div>
        </div>
    </form>
</body>
</html>
