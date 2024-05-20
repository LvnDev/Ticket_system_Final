<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Ticket_system.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        body{ background-image: url("images/sky.png")}
        .section {display:block; margin-left: auto; margin-right: auto; width: 50%; background-color:lightblue;
        text-align:center; border-radius: 5px;}
        .Top{text-align:center; background-color:antiquewhite;}
        h1,h2,h3,h4,h5,p,a,Label {font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif}
    </style>
    <title>Login</title>
</head>
<body>
   <form id="form1" runat="server">
    <div class="Top">
        <br />
        <h1>Automotivation Support</h1>
        <br />
    </div>
       <br />

        <div class="section">
            <h4>Login</h4>
            <h5>Username: <span> <asp:TextBox ID="userTxtbx" runat="server" Width="183px" MaxLength="35" ></asp:TextBox></span> </h5>
            <h5>Password: <span><asp:TextBox ID="passtxtbx" runat="server" Width="183px" MaxLength="35" TextMode="Password"></asp:TextBox></span></h5>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="loginBtn" runat="server" Text="Login" Width="106px" OnClick="loginBtn_Click" />
            <br />
            <asp:Label ID="errorLbl" runat="server" Text=""></asp:Label>
            <h5>Problem with account?</h5>
            <a href="">Contact IT Help desk</a>
            <br />
            <br />
        </div>
    </form>
</body>
</html>
