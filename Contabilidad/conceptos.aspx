<%@ Page Language="C#" AutoEventWireup="true" CodeFile="conceptos.aspx.cs" Inherits="Contabilidad_conceptos" MasterPageFile="~/MasterPage.master" Theme="main"%>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <title>
        Contabilidad - Conceptos
    </title>

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
    <script src="../Scripts/jsPropio.js" type="text/javascript"></script>

</asp:Content>


<asp:Content ContentPlaceHolderID="body" runat="server">

     <asp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        
        
            <div id="divError" runat="server" class="error" visible="false">
                <asp:Label runat="server" ID="lblError"></asp:Label>
            </div>
                
            <div id="conceptos">
                    <p>Introduce los conceptos de Entrada/Salida de caja</p>

                        <div id="formConceptos"> 
                            
                            <ul>
                                <li>
                                    <asp:Label ID="lblNombreConcepto" runat="server" CssClass="lightGrey" Text="Nombre del Concepto : " Width="180px"></asp:Label>
                                    <asp:TextBox ID="txtNombreConcepto" MaxLength="1000" runat="server" Width="200px" CssClass="darkGreyB"></asp:TextBox>
                                </li>
                                <li>
                                    <asp:Label ID="lblTipoConcepto" runat="server" Text="Tipo de Concepto :" CssClass="lightGrey" Width="180px"></asp:Label>        
                                    <asp:DropDownList ID="ddlTipoConcepto" runat="server" CssClass="darkGreyB">
                                    </asp:DropDownList>    
                                </li>
                                <li>
                                    <asp:Button ID="btGuardarConcepto" runat="server" Text="Guardar" CssClass="botonEntradaSalida" OnClick="btGuardarConcepto_OnClick"/>
                                </li>
                                
                            </ul>                        
                            
                    <div id="divGvConceptos">
                        <asp:GridView ID="gvConceptos" runat="server" AutoGenerateColumns="false" GridLines="Horizontal" OnRowDataBound="gvConceptos_OnRowDatBound" OnRowCommand="gvConceptos_OnRowCommand" DataKeyNames="id_concepto">
                            <HeaderStyle BackColor="#FFB400" HorizontalAlign="Left"/>
                            <Columns>
                                <asp:BoundField DataField="id_concepto" Visible="false" />
                                <asp:BoundField  DataField="nombre" HeaderText="Nombre" ItemStyle-CssClass="black13" ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Bold="true"/>
                                <asp:BoundField  DataField="tipo_concepto" HeaderText="Tipo" ItemStyle-CssClass="black13" ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Bold="true"/>
                                <asp:CommandField ButtonType="Link" SelectText="X" DeleteText="Eliminar" EditText="Editar" InsertText="Insertar" ShowSelectButton="true" ItemStyle-Font-Size="14px" HeaderStyle-Width="15px" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="15px" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>

            </div>

        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>