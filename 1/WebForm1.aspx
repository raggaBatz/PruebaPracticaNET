<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<script runat="server">
    protected void Submit_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(UserName.Text) && !string.IsNullOrEmpty(Password.Text))
        {
            
        }
        else
        {
            ErrorMessage.Text = "Por favor, ingrese su nombre de usuario y contraseña.";
        }
    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inicio de sesión</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <label for="UserName">Nombre de usuario:</label>
            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
            <br />
            <label for="Password">Contraseña:</label>
            <asp:TextBox ID="Password" TextMode="Password" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Submit" runat="server" Text="Iniciar sesión" OnClick="Submit_Click" />
            <br />
            <asp:Label ID="ErrorMessage" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>
</html>
