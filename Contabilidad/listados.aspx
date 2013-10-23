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

    <asp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Release">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        
        
            <div id="divError" runat="server" class="error" visible="false">
                <asp:Label runat="server" ID="lblError"></asp:Label>
            </div>
                
            <div id="listados">
                <p class="pListados">Generar listados</p>

                <div id="formListados"> 

                    <div id="calendarioListados">
                        <asp:Calendar ID="CalendarListados" runat="server" Height="100px" DayHeaderStyle-HorizontalAlign="Center" CssClass="calendarioEntradaSalida" OnSelectionChanged="CalendarListados_OnSelectionChanged">
                            <TitleStyle BackColor="#ffb400" ForeColor="black" Font-Size="14px" HorizontalAlign="Center" Font-Bold="true"/>
                            <SelectedDayStyle  BackColor="#4dbbe5" HorizontalAlign="Center"/>
                            <DayStyle Font-Underline="false" HorizontalAlign="Center" BackColor="White"/>
                            <TodayDayStyle BackColor="#ffb400" HorizontalAlign="Center"/>
                            <OtherMonthDayStyle BackColor="white"/>
                            <NextPrevStyle HorizontalAlign="Center" Font-Bold="true"/>
                            <DayHeaderStyle  BackColor="#ffb400"/>
                        </asp:Calendar>
                    </div>
                        
                    <div id="formListados2">
                        <ul>
                            <li>
                                <asp:Label ID="lblFechaInicio" runat="server" CssClass="lightGrey" Text="Fecha Inicial: " Width="160px"></asp:Label>
                        
                                <asp:TextBox ID="txtFechaInicial" runat="server" CssClass="darkGreyB" Width="90px" MaxLength="10"></asp:TextBox>&nbsp;&nbsp;
                                <asp:Label ID="lblFormatofecha1" runat="server" Text="(dd/mm/aaaa)" CssClass="darkBlue"></asp:Label>
                            </li>
                            <li>
                                <asp:Label ID="lblFechaFinal" runat="server" CssClass="lightGrey" Text="Fecha Final: " Width="160px"></asp:Label>
                        
                                <asp:TextBox ID="txtFechaFinal" runat="server" CssClass="darkGreyB" Width="90px" MaxLength="10"></asp:TextBox>&nbsp;&nbsp;
                                <asp:Label ID="lblFormatoFecha2" runat="server" Text="(dd/mm/aaaa)" CssClass="darkBlue"></asp:Label>
                            </li>
                            <li id="liListados">
                                <asp:Label ID="lblTipoConceptoListados" runat="server" CssClass="lightGrey" Text="Tipos de concepto: " Width="160px"></asp:Label>
                        
                                <asp:RadioButtonList ID="rblTipoConceptoListados" runat="server" RepeatDirection="Horizontal"  CssClass="rblTipoConceptoListados" Font-Size="12px">
                                </asp:RadioButtonList>
                            </li>
                            <li>
                                <asp:Label ID="lblConceptoListados" runat="server" CssClass="black14b" Text="Conceptos específicos: " Width="180px"></asp:Label>
                    
                                <asp:DropDownList ID="ddlConceptoListados" runat="server" CssClass="darkGreyB" AutoPostBack="true" OnSelectedIndexChanged="ddlConceptoListados_OnSelectedIndexChanged">
                                </asp:DropDownList>
                            </li>
                            <li>
                                <asp:ListBox ID="lbConceptos" runat="server" Width="270px" Height="100px" 
                                onselectedindexchanged="lbConceptos_SelectedIndexChanged" AutoPostBack="true" Enabled="false" CssClass="lbConceptos"></asp:ListBox>
                            </li>
                            <li>
                            
                                <asp:Button ID="btListados" runat="server" Text="Generar Listado" CssClass="botonListados" Width="140px" OnClick="btListados_OnClick"/>
                                <asp:ImageButton ID="ibListadoWord" runat="server" CssClass="word" ImageUrl="~/App_Themes/img/word.png" Width="29px" Height="29px" OnClick="ibListadoWord_OnClick" ToolTip="Sacar Listado Word"/>
                            
                            </li>
                        </ul>
                    </div>   
                    <div id="divGvListados" runat="server" visible="false">
                            <div id="divConfirmacionEliminarMovimientoCaja" runat="server" visible="false" style=" margin-top:20px; margin-bottom:20px;">
                                <asp:Label ID="lblConfirmacionEliminarMovimientoCaja" runat="server" CssClass="red" ForeColor="red" Text="¿Estas Seguro de eliminar el movimiento de caja?"></asp:Label>&nbsp;&nbsp;&nbsp;
                                <asp:LinkButton ID="lnkEliminarMovimientoCajaYes" runat="server" Text="Si" Font-Bold="true" Font-Size="18px" OnClick="lnkEliminarMovimientoCajaYes_OnClick" CssClass="lnkEliminarCaja"></asp:LinkButton>&nbsp;|&nbsp;
                                <asp:LinkButton ID="lnkEliminarMovimientoCajaNo" runat="server" Text="No" Font-Bold="true" Font-Size="18px" OnClick="lnkEliminarMovimientoCajaNo_OnClick"  CssClass="lnkEliminarCaja"></asp:LinkButton>
                            </div>
                            <div id="divGvListados2">
                                <asp:GridView ID="gvListados" runat="server" AutoGenerateColumns="false" GridLines="Horizontal" OnRowDataBound="gvListados_OnRowDatBound" OnRowCommand="gvListados_OnRowCommand" DataKeyNames="id_caja">
                                        <HeaderStyle BackColor="#FFB400" HorizontalAlign="Left"/>
                                        <Columns>
                                            <asp:BoundField DataField="id_caja" Visible="false" />
                                            <asp:BoundField  DataField="fecha_caja" HeaderText="Fecha" ItemStyle-CssClass="black13" ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Bold="true"/>
                                            <asp:BoundField  DataField="nombre_persona" HeaderText="Operador" ItemStyle-CssClass="black13" ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Bold="true"/>
                                            <asp:BoundField  DataField="nombre_concepto" HeaderText="Concepto" ItemStyle-CssClass="black13" ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Bold="true"/>
                                            <asp:BoundField  DataField="nombre_tipo_concepto" HeaderText="Tipo Concepto" ItemStyle-CssClass="black13" ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Bold="true"/>
                                            <asp:BoundField  DataField="importe" HeaderText="Importe (€)" ItemStyle-CssClass="black15" ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Bold="true"/>
                                            <asp:CommandField ButtonType="Link" SelectText="X" DeleteText="Eliminar" EditText="Editar" InsertText="Insertar" ShowSelectButton="true" ItemStyle-Font-Size="14px" HeaderStyle-Width="15px" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="15px" />
                                        </Columns>
                                </asp:GridView>
                            </div>
                            <p class="totalCaja2">
                                <asp:Label ID="lblTotalCaja1" runat="server" Text="" CssClass="darkGreyB"></asp:Label>
                                <asp:Label ID="lblTotalCaja2" runat="server" Text="" CssClass="darkBlue"></asp:Label>
                                -
                                <asp:Label ID="lblRelativoCaja1" runat="server" Text="" CssClass="darkGreyB"></asp:Label>
                                <asp:Label ID="lblRelativoCaja2" runat="server" Text="" CssClass="darkBlue"></asp:Label>
                            </p>
                    </div>

                </div>

            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger  ControlID="ibListadoWord"/>
        </Triggers>
    </asp:UpdatePanel>


</asp:Content>