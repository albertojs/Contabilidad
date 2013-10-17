<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" Title="Contabilidad" Theme="main" EnableSessionState="True"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body class="body">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                
                <div id="login">
                    <div id="loginPrincipal">

                        <div id="loginPrincipal2">
                            <p>INICIAR SESIÓN</p> 

                            <div id="divError" runat="server"  visible="false" class="errorLogin">
                                <asp:Label runat="server" ID="lblError"></asp:Label>
                            </div>

                            <div id="contenedorLogin">
                                 
                                <ul>
                                    <li>
                                        <asp:Label ID="lblNombre" runat="server" Text="Nombre : " CssClass="whiteB" Width="150px"></asp:Label>
                                        <asp:TextBox ID="txtNombre" runat="server" CssClass="darkGreyB" Width="150px"></asp:TextBox>
                                    </li>
                                    <li>
                                        <asp:Label ID="lblPassword" runat="server" Text="Contraseña : " CssClass="whiteB" Width="150px"></asp:Label>  
                                        <asp:TextBox ID="txtPassword" runat="server" CssClass="darkGreyB" Width="150px" TextMode="Password"></asp:TextBox>
                                    </li>
                                    <li>    
                                        <asp:Button ID="btEntrar" runat="server" Text="Entrar" CssClass="botonEntradaSalida" OnClick="btEntrar_OnClick" />
                                    </li>
                                </ul>
                            </div>
                            </div>
                    </div>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
