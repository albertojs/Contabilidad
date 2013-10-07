<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="_Default" Title="Contabilidad" Theme="principal" EnableSessionState="True"%>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register Src="../Controles/Menu.ascx" TagName="Menu" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript" src="../Scripts/jquery.js"></script>
    <script type="text/javascript" src="../Scripts/jsPropio.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
            
                <div class="principal">
                    <div class="menu">
                        <uc1:Menu ID="Menu1" runat="server" />
                    </div>
                    <div class="bordeMenu"></div>
                    <div id="divError" runat="server"  visible="false" class="error">
                        <asp:Label runat="server" ID="lblError"></asp:Label>
                    </div>
                    
                    <asp:MultiView ID="mvOpciones" runat="server" ActiveViewIndex="0" OnActiveViewChanged="mvOpciones_OnActiveViewChanged">
                        <asp:View ID="View1" runat="server">
                            <div class="inicio">
                                <table width="100%">
                                    <tr>
                                        <td align="center" style="height:40px;">
                                            <asp:Label ID="lblUsuarioConectado" runat="server" CssClass="black18b" Text="BIENVENIDO "></asp:Label>&nbsp;
                                            <asp:Label ID="lblNombreUsuarioConectado" runat="server" CssClass="black18b" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="height:50px;">
                                            <asp:Label ID="lblTituloInicio" runat="server" CssClass="black18b underline" Text="Últimos Movimientos de Caja"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="height:40px;">
                                            <asp:Label ID="lblTotalCaja3" runat="server" CssClass="black18b" Text="Estado Actual de la caja :  "></asp:Label>&nbsp;&nbsp;&nbsp;
                                            <asp:Label ID="lblTotalCaja4" runat="server" CssClass="black18b" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <div class="gridViewInicio">
                                                <asp:GridView ID="gvInicio" runat="server" AutoGenerateColumns="false" GridLines="Horizontal" OnRowDataBound="gvInicio_OnRowDatBound" DataKeyNames="id_caja">
                                                    <HeaderStyle CssClass="black15b" BackColor="#58CCF1" HorizontalAlign="Left"/>
                                                    <Columns>
                                                        <asp:BoundField DataField="id_caja" Visible="false" />
                                                        <asp:BoundField  DataField="fecha_caja" HeaderText="Fecha" ItemStyle-CssClass="black13" ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Bold="true"/>
                                                        <asp:BoundField  DataField="nombre_persona" HeaderText="Operador" ItemStyle-CssClass="black13" ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Bold="true"/>
                                                        <asp:BoundField  DataField="nombre_concepto" HeaderText="Concepto" ItemStyle-CssClass="black13" ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Bold="true"/>
                                                        <asp:BoundField  DataField="nombre_tipo_concepto" HeaderText="Tipo Concepto" ItemStyle-CssClass="black13" ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Bold="true"/>
                                                        <asp:BoundField  DataField="importe" HeaderText="Importe (€)" ItemStyle-CssClass="black15" ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Bold="true"/>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="height:40px;">
                                            <asp:Label ID="lblTotalCaja" runat="server" CssClass="black18b" Text="Estado Actual de la caja :  "></asp:Label>&nbsp;&nbsp;&nbsp;
                                            <asp:Label ID="lblTotalCaja2" runat="server" CssClass="black18b" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </asp:View>
                        <asp:View ID="View2" runat="server">
                            <div class="entradaSalidas">
                                <table width="100%">
                                    <tr>
                                        <td valign="top" style=" height:50px;" align="center" colspan="2">
                                            <asp:Label ID="lblTituloEntradaSalida" runat="server" CssClass="black18b underline" Text="Control de Entradas/Salidas de Caja"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height:40px;" colspan="2" align="center" valign="top">
                                            <asp:Label ID="lblFechaInsercionCaja" runat="server" CssClass="black14b" Text="Selecciona una fecha de inserción en caja"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="padding:0px;">
                                            
                                            <asp:Calendar ID="CalendarFechaInsercion" runat="server" Height="100px" DayHeaderStyle-HorizontalAlign="Center" CssClass="calendario" OnSelectionChanged="CalendarFechaInsercion_OnSelectionChanged">
                                                <TitleStyle BackColor="#58CCF1" ForeColor="black" Font-Size="14px" HorizontalAlign="Center" Font-Bold="true"/>
                                                <SelectedDayStyle  BackColor="orange" HorizontalAlign="Center"/>
                                                <DayStyle Font-Underline="false" HorizontalAlign="Center" BackColor="#F3F3F3"/>
                                                <TodayDayStyle BackColor="#58CCF1" HorizontalAlign="Center"/>
                                                <OtherMonthDayStyle BackColor="white"/>
                                                <NextPrevStyle HorizontalAlign="Center" Font-Bold="true"/>
                                                <DayHeaderStyle  BackColor="#58CCF1"/>
                                            </asp:Calendar>
                                            
                                        </td>
                                        <td align="left">
                                            <asp:Label ID="lblFechaInsercionTitulo" runat="server" CssClass="black14b" Text="Fecha Seleccionada : "></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:Label ID="lblFechaInsercion" runat="server" CssClass="black16b" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style=" height:40px;">
                                            <asp:Label ID="lblTipoConcepto2" runat="server" CssClass="black14b" Text="Tipo de Concepto a insertar : "></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                        <td align="left" style="padding:0px;">
                                            <asp:RadioButtonList ID="rblTipoConcepto" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" CssClass="black14b" OnSelectedIndexChanged="rblTipoConcepto_OnSelectedChanged">
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style=" height:40px;">
                                            <asp:Label ID="lblConcepto2" runat="server" CssClass="black14b" Text="Concepto a insertar : "></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                        <td align="left">
    
                                            <asp:DropDownList ID="ddlConcepto" runat="server" CssClass="black14b">
                                            </asp:DropDownList>
                                            
 
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style=" height:40px;">
                                            <asp:Label ID="lblImporte" runat="server" CssClass="black14b" Text="Importe de la Entrada/Salida : "></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="txtImporte" runat="server" CssClass="black14b" Width="150px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style=" height:70px;">
                                            <asp:Button ID="btGuardarInsercionCaja" runat="server" Text="Guardar" CssClass="button" OnClick="btGuardarInsercionCaja_OnClick"/>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </asp:View>
                        <asp:View ID="View3" runat="server">
                            <div class="conceptos">
                                <table  width="100%">
                                    <tr>
                                        <td valign="top" style="width:530px;">
                                            <table>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:Label ID="lblTituloConcepto" runat="server" CssClass="black18b underline" Text="Introduce los conceptos de Entrada/Salida y pulsa guardar"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblNombreConcepto" runat="server" CssClass="black14b" Text="Nombre del Concepto : "></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtNombreConcepto" MaxLength="1000" runat="server" Width="300px" CssClass="black14"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblTipoConcepto" runat="server" Text="Tipo de Concepto :" CssClass="black14b"></asp:Label>
                                                    </td>
                                                    <td>
                                                            <asp:DropDownList ID="ddlTipoConcepto" runat="server" CssClass="black14">
                                                            </asp:DropDownList>    
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" align="center">
                                                        <asp:Button ID="btGuardarConcepto" runat="server" Text="Guardar" CssClass="button" OnClick="btGuardarConcepto_OnClick"/>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="padding:0px;" align="center">
                                            <div class="gridViewConceptos">
                                                <asp:GridView ID="gvConceptos" runat="server" AutoGenerateColumns="false" GridLines="Horizontal" OnRowDataBound="gvConceptos_OnRowDatBound" OnRowCommand="gvConceptos_OnRowCommand" DataKeyNames="id_concepto">
                                                    <HeaderStyle CssClass="black15b" BackColor="#58CCF1" HorizontalAlign="Left"/>
                                                    <Columns>
                                                        <asp:BoundField DataField="id_concepto" Visible="false" />
                                                        <asp:BoundField  DataField="nombre" HeaderText="Nombre" ItemStyle-CssClass="black13" ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Bold="true"/>
                                                        <asp:BoundField  DataField="tipo_concepto" HeaderText="Tipo" ItemStyle-CssClass="black13" ItemStyle-HorizontalAlign="Left" ItemStyle-Font-Bold="true"/>
                                                        <asp:CommandField ButtonType="Link" SelectText="X" DeleteText="Eliminar" EditText="Editar" InsertText="Insertar" ShowSelectButton="true" ItemStyle-Font-Size="14px" HeaderStyle-Width="15px" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="15px" />
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </asp:View>
                        <asp:View ID="View4" runat="server">
                            <div class="listados">
                                <table width="100%">
                                    <tr>
                                        <td align="center" colspan="2" style=" height:50px;">
                                            <asp:Label ID="lblTituloListados" CssClass="black18b underline" runat="server" Text="Listados de Caja"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Calendar ID="CalendarListados" runat="server" Height="100px" DayHeaderStyle-HorizontalAlign="Center" CssClass="calendario" OnSelectionChanged="CalendarListados_OnSelectionChanged">
                                                <TitleStyle BackColor="#58CCF1" ForeColor="black" Font-Size="14px" HorizontalAlign="Center" Font-Bold="true"/>
                                                <SelectedDayStyle  BackColor="orange" HorizontalAlign="Center"/>
                                                <DayStyle Font-Underline="false" HorizontalAlign="Center" BackColor="#F3F3F3"/>
                                                <TodayDayStyle BackColor="#58CCF1" HorizontalAlign="Center"/>
                                                <OtherMonthDayStyle BackColor="white"/>
                                                <NextPrevStyle HorizontalAlign="Center" Font-Bold="true"/>
                                                <DayHeaderStyle  BackColor="#58CCF1"/>
                                            </asp:Calendar>
                                        </td>
                                        <td align="left">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblFechaInicio" runat="server" CssClass="black14b" Text="Fecha Inicial"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtFechaInicial" runat="server" CssClass="black14b" Width="90px" MaxLength="10"></asp:TextBox>&nbsp;&nbsp;
                                                        <asp:Label ID="lblFormatofecha1" runat="server" Text="(dd/mm/aaaa)" CssClass="black14" ForeColor="olive"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblFechaFinal" runat="server" CssClass="black14b" Text="Fecha Final"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtFechaFinal" runat="server" CssClass="black14b" Width="90px" MaxLength="10"></asp:TextBox>&nbsp;&nbsp;
                                                        <asp:Label ID="lblFormatoFecha2" runat="server" Text="(dd/mm/aaaa)" CssClass="black14" ForeColor="olive"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="height:40px;">
                                            <asp:Label ID="lblTipoConceptoListados" runat="server" CssClass="black14b" Text="Selecciona el Tipo de Concepto a listar : "></asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:RadioButtonList ID="rblTipoConceptoListados" runat="server" RepeatDirection="Horizontal"  CssClass="black14b">
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="height:40px;">
                                            <asp:Label ID="lblConceptoListados" runat="server" CssClass="black14b" Text="Selecciona el Concepto a listar : "></asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:DropDownList ID="ddlConceptoListados" runat="server" CssClass="black14b" AutoPostBack="true" OnSelectedIndexChanged="ddlConceptoListados_OnSelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="height:40px;">
                                            <asp:Label ID="lblConceptoListados2" runat="server" CssClass="black14b" Text="Selecciona el 2º Concepto a listar : " Visible="false"></asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:DropDownList ID="ddlConceptoListados2" runat="server" CssClass="black14b" AutoPostBack="true" Visible="false" OnSelectedIndexChanged="ddlConceptoListados2_OnSelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="height:40px;">
                                            <asp:Label ID="lblConceptoListados3" runat="server" CssClass="black14b" Text="Selecciona el 3º Concepto a listar : " Visible="false"></asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:DropDownList ID="ddlConceptoListados3" runat="server" CssClass="black14b" AutoPostBack="true" Visible="false" OnSelectedIndexChanged="ddlConceptoListados3_OnSelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center" style="height:60px;">
                                            <asp:Button ID="btListados" runat="server" Text="Generar Listado" CssClass="button" Width="140px" OnClick="btListados_OnClick"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" style=" height:60px; width:500px;">
                                            <asp:Label ID="lblRelativoCaja3" runat="server" Text="" CssClass="black18b"></asp:Label>
                                            <asp:Label ID="lblRelativoCaja4" runat="server" Text="" CssClass="black18b"></asp:Label>
                                        </td>
                                        <td align="center">
                                            <asp:Label ID="lblTotalCaja7" runat="server" Text="Estado Total de la caja :  " CssClass="black18b"></asp:Label>
                                            <asp:Label ID="lblTotalCaja8" runat="server" Text="" CssClass="black18b"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <div id="divConfirmacionEliminarMovimientoCaja" runat="server" visible="false" style=" margin-top:20px; margin-bottom:20px;">
                                                <asp:Label ID="lblConfirmacionEliminarMovimientoCaja" runat="server" CssClass="black16b" ForeColor="red" Text="¿Estas Seguro de eliminar el movimiento de caja?"></asp:Label>&nbsp;&nbsp;&nbsp;
                                                <asp:LinkButton ID="lnkEliminarMovimientoCajaYes" runat="server" Text="Si" Font-Bold="true" Font-Size="18px" OnClick="lnkEliminarMovimientoCajaYes_OnClick"></asp:LinkButton>&nbsp;|&nbsp;
                                                <asp:LinkButton ID="lnkEliminarMovimientoCajaNo" runat="server" Text="No" Font-Bold="true" Font-Size="18px" OnClick="lnkEliminarMovimientoCajaNo_OnClick"></asp:LinkButton>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center" style=" padding:0px;">
                                            <asp:GridView ID="gvListados" runat="server" Width="100%" AutoGenerateColumns="false" GridLines="Horizontal" OnRowDataBound="gvListados_OnRowDatBound" OnRowCommand="gvListados_OnRowCommand" DataKeyNames="id_caja">
                                                    <HeaderStyle CssClass="black15b" BackColor="#58CCF1" HorizontalAlign="Left"/>
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
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" style=" height:60px; width:500px;">
                                            <asp:Label ID="lblRelativoCaja" runat="server" Text="" CssClass="black18b"></asp:Label>
                                            <asp:Label ID="lblRelativoCaja2" runat="server" Text="" CssClass="black18b"></asp:Label>
                                        </td>
                                        <td align="center">
                                            <asp:Label ID="lblTotalCaja5" runat="server" Text="Estado Total de la caja :  " CssClass="black18b"></asp:Label>
                                            <asp:Label ID="lblTotalCaja6" runat="server" Text="" CssClass="black18b"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="padding-top:10px;" align="center">
                                            <asp:ImageButton ID="ibListadoWord" runat="server" ImageUrl="~/App_Themes/imagenes/word.gif" OnClick="ibListadoWord_OnClick" ToolTip="Sacar Listado"/>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </asp:View>
                        <asp:View ID="View5" runat="server">
                            <div class="graficos">
                                    <table width="100%" >
                                    <tr>
                                        <td align="center" colspan="3" style=" height:50px;">
                                            <asp:Label ID="Label5" CssClass="black18b underline" runat="server" Text="Generar Gráficos"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Calendar ID="calendarioGrafico" runat="server" Height="100px" DayHeaderStyle-HorizontalAlign="Center" CssClass="calendario" OnSelectionChanged="calendarioGrafico_OnSelectionChanged">
                                                <TitleStyle BackColor="#58CCF1" ForeColor="black" Font-Size="14px" HorizontalAlign="Center" Font-Bold="true"/>
                                                <SelectedDayStyle  BackColor="orange" HorizontalAlign="Center"/>
                                                <DayStyle Font-Underline="false" HorizontalAlign="Center" BackColor="#F3F3F3"/>
                                                <TodayDayStyle BackColor="#58CCF1" HorizontalAlign="Center"/>
                                                <OtherMonthDayStyle BackColor="white"/>
                                                <NextPrevStyle HorizontalAlign="Center" Font-Bold="true"/>
                                                <DayHeaderStyle  BackColor="#58CCF1"/>
                                            </asp:Calendar>
                                        </td>
                                        <td align="center">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label1" runat="server" CssClass="black14b" Text="Fecha Inicial"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtFechaInicialGrafico" runat="server" CssClass="black14b" Width="90px" MaxLength="10"></asp:TextBox>&nbsp;&nbsp;
                                                        <asp:Label ID="Label2" runat="server" Text="(dd/mm/aaaa)" CssClass="black14" ForeColor="olive"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label3" runat="server" CssClass="black14b" Text="Fecha Final"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtFechaFinalGrafico" runat="server" CssClass="black14b" Width="90px" MaxLength="10"></asp:TextBox>&nbsp;&nbsp;
                                                        <asp:Label ID="Label4" runat="server" Text="(dd/mm/aaaa)" CssClass="black14" ForeColor="olive"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="margin-left:0px; width:300px;" align="left">
                                            <asp:Button ID="btGraficos" runat="server" Text="Generar gráficos" CssClass="button" Width="140px" OnClick="btGraficos_OnClick"/>
                                        </td>
                                    </tr>
                                    </table>
                                <ul id="listaGraficos">
                                    <li id="li1">
                                        <asp:LinkButton ID="lnkGrafico1" runat="server" OnClick="lnkGrafico1_OnClick"> Gráfico de Beneficios</asp:LinkButton>
                                        <div id="grafico1" class="grafico">
                                        <asp:Panel ID="panelGrafico1" runat="server" Visible="false">
                                            <asp:Chart ID="Chart3" runat="server" Width="800px" Height="400px" 
                                                BackColor="WhiteSmoke" BackSecondaryColor="224, 224, 224" 
                                                BackGradientStyle="TopBottom" ViewStateMode="Enabled"  EnableViewState="true">
                                                <Series>
                                                    <asp:Series Name="Beneficios" ChartType="StackedColumn" ChartArea="ChartArea1" 
                                                        YValuesPerPoint="10" >
                                                    </asp:Series>
                                        
                                                </Series>
                                                <ChartAreas>
                                                    <asp:ChartArea Name="ChartArea1" BackSecondaryColor="BlanchedAlmond" BackColor="White" BackGradientStyle="TopBottom">
                                                    <AxisY Title="€" TextOrientation="Horizontal"></AxisY>
                                                    <AxisX Title="Meses"></AxisX>
                                                        <Area3DStyle Enable3D="True" />
                                                    </asp:ChartArea>
                                                </ChartAreas>
                                                <Titles>
                                                    <asp:Title Text="Beneficios" TextStyle="Shadow" 
                                                        Font="Microsoft Sans Serif, 18pt" />
                                                </Titles>
                                                <Legends>
                                                    <asp:Legend Name="Default" BackSecondaryColor="White" BackColor="Gainsboro" BackGradientStyle="DiagonalLeft" />
                                                </Legends>
                                                <BorderSkin SkinStyle="Emboss" />
                                            </asp:Chart>
                                            </asp:Panel>
                                        </div>
                                    </li>
                                    <li id="li2">
                                        <asp:LinkButton ID="lnkGrafico2" runat="server" OnClick="lnkGrafico2_OnClick">Gráfico de Gastos</asp:LinkButton>
                                        <div id="grafico2" class="grafico">
                                        <asp:Panel ID="panelGrafico2" runat="server" Visible="false">
                                            <asp:Chart ID="Chart4" runat="server" Width="800px" Height="400px" 
                                                BackColor="WhiteSmoke" BackSecondaryColor="224, 224, 224" 
                                                BackGradientStyle="TopBottom"  ViewStateMode="Enabled"  EnableViewState="true">
                                                <Series>
                                                    <asp:Series Name="Gastos" ChartType="StackedColumn" ChartArea="ChartArea1" 
                                                        Color="IndianRed" >
                                                    </asp:Series>
                                                </Series>
                                                <ChartAreas>
                                                    <asp:ChartArea Name="ChartArea1" BackSecondaryColor="BlanchedAlmond" BackColor="White" BackGradientStyle="TopBottom">
                                                    <AxisY Title="€" TextOrientation="Horizontal"></AxisY>
                                                    <AxisX Title="Meses"></AxisX>
                                                        <Area3DStyle Enable3D="True" />
                                                    </asp:ChartArea>
                                                </ChartAreas>
                                                <Titles>
                                                    <asp:Title Text="Gastos" TextStyle="Shadow" 
                                                        Font="Microsoft Sans Serif, 18pt" />
                                                </Titles>
                                                <Legends>
                                                    <asp:Legend Name="Default" BackSecondaryColor="White" BackColor="Gainsboro" BackGradientStyle="DiagonalLeft" />
                                                </Legends>
                                                <BorderSkin SkinStyle="Emboss" />
                                            </asp:Chart>
                                            </asp:Panel>
                                        </div>
                                    </li>
                                    <li id="li3">
                                        <asp:LinkButton ID="lnkGrafico3" runat="server" OnClick="lnkGrafico3_OnClick">Gráfico de Ingresos y Gastos</asp:LinkButton>
                                        <div id="grafico3" class="grafico">
                                            <asp:Panel ID="panelGrafico3" runat="server" Visible="false">
                                            <asp:Chart ID="Chart1" runat="server" Width="800px" Height="400px" 
                                                BackColor="WhiteSmoke" BackSecondaryColor="224, 224, 224" 
                                                BackGradientStyle="TopBottom"  ViewStateMode="Enabled"  EnableViewState="true">
                                                <Series>
                                                    <asp:Series Name="Beneficios" ChartType="StackedColumn" ChartArea="ChartArea1" 
                                                        YValuesPerPoint="10" >
                                                    </asp:Series>
                                                    <asp:Series Name="Gastos" ChartType="StackedColumn" ChartArea="ChartArea1" 
                                                        Color="IndianRed" >
                                                    </asp:Series>
                                                </Series>
                                                <ChartAreas>
                                                    <asp:ChartArea Name="ChartArea1" BackSecondaryColor="BlanchedAlmond" BackColor="White" BackGradientStyle="TopBottom">
                                                    <AxisY Title="€" TextOrientation="Horizontal"></AxisY>
                                                    <AxisX Title="Meses"></AxisX>
                                                        <Area3DStyle Enable3D="True" />
                                                    </asp:ChartArea>
                                                </ChartAreas>
                                                <Titles>
                                                    <asp:Title Text="Beneficios y Gastos" TextStyle="Shadow" 
                                                        Font="Microsoft Sans Serif, 18pt" />
                                                </Titles>
                                                <Legends>
                                                    <asp:Legend Name="Default" BackSecondaryColor="White" BackColor="Gainsboro" BackGradientStyle="DiagonalLeft" />
                                                </Legends>
                                                <BorderSkin SkinStyle="Emboss" />
                                            </asp:Chart>
                                            </asp:Panel>
                                        </div>
                                    </li>
                                    <li id="li4">
                                        <asp:LinkButton ID="lnkGrafico4" runat="server" OnClick="lnkGrafico4_OnClick">Gráfico Top 10 Gastos</asp:LinkButton>
                                        <div id="grafico4" class="grafico">
                                        <asp:Panel ID="panelGrafico4" runat="server" Visible="false">
                                            <asp:Chart ID="Chart2" runat="server" Width="800px" Height="400px" 
                                                BackColor="WhiteSmoke" BackSecondaryColor="224, 224, 224" 
                                                BackGradientStyle="TopBottom"  ViewStateMode="Enabled"  EnableViewState="true">
                                                <Series>
                                                    <asp:Series Name="Series1" ChartType="Doughnut" ChartArea="ChartArea1" 
                                                        Legend="Default" Label="#PERCENT{P2}" LegendText="#VALX">
                                                    </asp:Series>
                                                </Series>
                                                <ChartAreas>
                                                    <asp:ChartArea Name="ChartArea1" BackColor="Transparent">
                                                        <Area3DStyle Enable3D="True" />
                                                    </asp:ChartArea>
                                                </ChartAreas>
                                                <Titles>
                                                    <asp:Title Text="Top 10 Gastos" TextStyle="Shadow" Font="Microsoft Sans Serif, 18pt" />
                                                </Titles>
                                                <Legends>
                                                    <asp:Legend Name="Default" BackSecondaryColor="White" BackColor="Gainsboro" BackGradientStyle="DiagonalLeft" />
                                                </Legends>
                                                <BorderSkin SkinStyle="Emboss" />
                                            </asp:Chart>
                                            </asp:Panel>
                                        </div>
                                    </li>
                                    <li id="li5">
                                        <asp:LinkButton ID="lnkGrafico5" runat="server" OnClick="lnkGrafico5_OnClick">Gráfico Recaudación Diaria Vs Fiestas</asp:LinkButton>
                                        <div id="grafico5" class="grafico">
                                        <asp:Panel ID="panelGrafico5" runat="server" Visible="false">
                                            <asp:Chart ID="Chart5" runat="server" Width="800px" Height="400px" 
                                                BackColor="WhiteSmoke" BackSecondaryColor="224, 224, 224" 
                                                BackGradientStyle="TopBottom"  ViewStateMode="Enabled" EnableViewState="true">
                                                <Series>
                                                    <asp:Series Name="recaudacion" ChartType="Doughnut" ChartArea="ChartArea1" 
                                                        Legend="Default" Label="#PERCENT{P2}" LegendText="#VALX">
                                                    </asp:Series>
                                                </Series>
                                                <ChartAreas>
                                                    <asp:ChartArea Name="ChartArea1" BackColor="Transparent">
                                                        <Area3DStyle Enable3D="True" />
                                                    </asp:ChartArea>
                                                </ChartAreas>
                                                <Titles>
                                                    <asp:Title Text="Recaudación diaria VS fiestas" TextStyle="Shadow" 
                                                        Font="Microsoft Sans Serif, 18pt" />
                                                </Titles>
                                                <Legends>
                                                    <asp:Legend Name="Default" BackSecondaryColor="White" BackColor="Gainsboro" BackGradientStyle="DiagonalLeft" />
                                                </Legends>
                                                <BorderSkin SkinStyle="Emboss" />
                                            </asp:Chart>
                                            </asp:Panel>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </asp:View>
                    </asp:MultiView>
                
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger  ControlID="ibListadoWord"/>
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
</html>
