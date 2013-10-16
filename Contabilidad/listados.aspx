<%@ Page Language="C#" AutoEventWireup="true" CodeFile="listados.aspx.cs" Inherits="Contabilidad_listados" MasterPageFile="~/MasterPage.master" Theme="main" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <title>
        Contabilidad - Listados
    </title>

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
    <script src="../Scripts/jsPropio.js" type="text/javascript"></script>

</asp:Content>


<asp:Content ContentPlaceHolderID="body" runat="server">

<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        
        
            <div id="divError" runat="server" class="error" visible="false">
                <asp:Label runat="server" ID="lblError"></asp:Label>
            </div>
                
            <div id="listados">
                <p>Generar listados</p>

                <div id="formListados"> 

                </div>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>