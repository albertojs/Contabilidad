<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" Title="Contabilidad" Theme="principal" EnableSessionState="True"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="principal">
                    <div id="divError" runat="server"  visible="false" class="error">
                        <asp:Label runat="server" ID="lblError"></asp:Label>
                    </div>
                    <table align="center" width="500px" style=" border:solid 4px #58CCF1; margin-top:20px;">
                        <tr>
                            <td colspan="2" align="center" style=" height:50px;">
                                <asp:Label ID="lblTitulo" runat="server" Text="INICIAR SESIÓN" CssClass="black18b"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style=" height:50px;">
                                <asp:Label ID="lblNombre" runat="server" Text="Nombre : " CssClass="black14b"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtNombre" runat="server" CssClass="black14" Width="150px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style=" height:50px;">
                                <asp:Label ID="lblPassword" runat="server" Text="Contraseña : " CssClass="black14b"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="black14" Width="150px" TextMode="Password"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center" style=" height:50px;">
                                <asp:Button ID="btEntrar" runat="server" Text="Entrar" CssClass="button" OnClick="btEntrar_OnClick" />
                            </td>
                        </tr>
                    </table>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
