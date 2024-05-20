<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sucess.aspx.cs" Inherits="Ticket_system.sucess" %>

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
    <title>Sucess</title>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <div class="section">
            <h1>Sucess</h1>
            <h3>Ticket has been created!</h3>
            <h4>choose the following methods</h4>
            <br />
            <asp:Button ID="logoutBtn" runat="server" Text="Logout" OnClick="logoutBtn_Click" /> &nbsp &nbsp
            <asp:Button ID="homeBtn" runat="server" Text="Home" OnClick="homeBtn_Click" />
        </div>
    </form>
</body>
</html>
