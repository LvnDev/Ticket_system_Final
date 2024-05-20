<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createTicket.aspx.cs" Inherits="Ticket_system.createTicket" %>

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
    </style>
    <title>Create Ticket</title>
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
            <asp:Button ID="homeBtn" runat="server" Text="Go Back to Inbox" OnClick="homeBtn_Click" />
        </div>
        <div class="section">
            <br />
            <h4 style="text-align:left; padding-left:45px">Subject:</h4>
            <asp:TextBox ID="subtxt" runat="server" Width="85%" MaxLength="75" TextMode="MultiLine"></asp:TextBox>
            <h4 style="text-align:left; padding-left:45px">Message:</h4>
            <asp:TextBox ID="messagetxt" runat="server" TextMode="MultiLine" Width="85%" Height="200px" MaxLength="325"></asp:TextBox>
            <br />
            <br />
            <div class="right" id="font" style="padding-right:25px">
                <asp:Label ID="errorLbl" runat="server" Text=""></asp:Label>
                <br />
                <br />
                <asp:Button ID="submitBtn" runat="server" Text="Submit Ticket" OnClick="submitBtn_Click" />
            </div>
            <br />
        </div>
    </form>
</body>
</html>
