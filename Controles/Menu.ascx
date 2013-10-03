<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Menu.ascx.cs" Inherits="Controles_Menu" %>

<table  cellpadding="5" cellspacing="0">
    <tr>
        <td align="center">
            <asp:LinkButton ID="lnkMenu1" runat="server" Text="Inicio" OnClick="lnkMenu1_OnClick"></asp:LinkButton>
        </td>
        <td align="center">
            <asp:LinkButton ID="lnkMenu2" runat="server" Text="Entradas/Salidas" OnClick="lnkMenu2_OnClick"></asp:LinkButton>
        </td>
        <td align="center">
            <asp:LinkButton ID="lnkMenu3" runat="server" Text="Conceptos" OnClick="lnkMenu3_OnClick"></asp:LinkButton>
        </td>
        <td align="center">
            <asp:LinkButton ID="lnkMenu4" runat="server" Text="Listados" OnClick="lnkMenu4_OnClick"></asp:LinkButton>
        </td>
        <td align="center">
            <asp:LinkButton ID="lnkMenu5" runat="server" Text="Salir" OnClick="lnkMenu5_OnClick"></asp:LinkButton>
        </td>
    </tr>
</table>
