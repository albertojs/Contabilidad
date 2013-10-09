<%@ Page Language="C#" AutoEventWireup="true" CodeFile="inicio.aspx.cs" Inherits="Contabilidad_inicio"  MasterPageFile="~/MasterPage.master" Theme="main"%>



<asp:Content ContentPlaceHolderID="head" runat="server">
    <title>
        Contabilidad - Inicio
    </title>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
    <script src="../Scripts/jsPropio.js" type="text/javascript"></script>
</asp:Content>


<asp:Content ContentPlaceHolderID="body" runat="server">
    <div id="inicio">
        <p>Últimos Movimientos de Caja</p>
        <div id="divGvInicio">
            <asp:GridView ID="gvInicio" runat="server" AutoGenerateColumns="false" GridLines="Horizontal" OnRowDataBound="gvInicio_OnRowDatBound" DataKeyNames="id_caja">
                <HeaderStyle BackColor="#FFB400"  HorizontalAlign="Left"/>
                <Columns>
                    <asp:BoundField DataField="id_caja" Visible="false" />
                    <asp:BoundField  DataField="fecha_caja" HeaderText="Fecha"  ItemStyle-Font-Bold="true"/>
                    <asp:BoundField  DataField="nombre_persona" HeaderText="Operador"  ItemStyle-Font-Bold="true"/>
                    <asp:BoundField  DataField="nombre_concepto" HeaderText="Concepto"  ItemStyle-Font-Bold="true"/>
                    <asp:BoundField  DataField="nombre_tipo_concepto" HeaderText="Tipo Concepto"  ItemStyle-Font-Bold="true"/>
                    <asp:BoundField  DataField="importe" HeaderText="Importe (€)" ItemStyle-Font-Bold="true"/>
                </Columns>
            </asp:GridView>
        </div>
        <p class="totalCaja">Total de Caja :  <asp:Label ID="lblTotalCaja" runat="server" Text=""></asp:Label></p>
    </div>
</asp:Content>