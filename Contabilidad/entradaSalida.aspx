<%@ Page Language="C#" AutoEventWireup="true" CodeFile="entradaSalida.aspx.cs" Inherits="Contabilidad_entradaSalida" MasterPageFile="~/MasterPage.master" Theme="main" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>



<asp:Content ContentPlaceHolderID="head" runat="server">
    <title>
        Contabilidad - Entrada y Salida
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
                
                <div id="entradaSalida">
                    <p>Control de Entradas/Salidas de Caja</p>

                        <div id="formEntradasSalidas"> 
                        
                            <ul>
                                <li>
                                    <div id="calendarioEntradaSalida">
                                        <asp:Calendar ID="CalendarFechaInsercion" runat="server" Height="100px" 
                                            DayHeaderStyle-HorizontalAlign="Center" CssClass="calendarioEntradaSalida" 
                                            OnSelectionChanged="CalendarFechaInsercion_OnSelectionChanged">
                                            <TitleStyle BackColor="#ffb400" Font-Size="14px" HorizontalAlign="Center" Font-Bold="true"/>
                                            <SelectedDayStyle  BackColor="#4dbbe5" HorizontalAlign="Center"/>
                                            <DayStyle Font-Underline="false" HorizontalAlign="Center" BackColor="White"/>
                                            <TodayDayStyle BackColor="#ffb400" HorizontalAlign="Center"/>
                                            <OtherMonthDayStyle BackColor="white"/>
                                            <NextPrevStyle HorizontalAlign="Center" Font-Bold="true"/>
                                            <DayHeaderStyle  BackColor="#ffb400"/>
                                        </asp:Calendar>
                                    </div>
                                </li>
                                <li>
                                    <ul>
                                        <li>
                                            <asp:Label ID="lblFechaInsercionTitulo" runat="server" CssClass="lightGrey" Text="Fecha Seleccionada : "></asp:Label>
                                            <asp:Label ID="lblFechaInsercion" runat="server" CssClass="darkGreyB" Text=""></asp:Label>
                                        </li>
                                        <li>
                            
                                            <asp:Label ID="lblTipoConcepto2" runat="server" CssClass="lightGrey" Text="Tipo de Concepto a insertar : "></asp:Label>
                                            <asp:RadioButtonList ID="rblTipoConcepto" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" CssClass="rblEntradasSalidas" OnSelectedIndexChanged="rblTipoConcepto_OnSelectedChanged">
                                            </asp:RadioButtonList>
                            
                                        </li>
                                        <li>
                                            <asp:Label ID="lblConcepto2" runat="server" CssClass="black14b" Text="Concepto a insertar : "></asp:Label>
                                            <asp:DropDownList ID="ddlConcepto" runat="server" CssClass="black14b">
                                            </asp:DropDownList>
                                            
                                        </li>
                                        <li>
                                            <asp:Label ID="lblImporte" runat="server" CssClass="black14b" Text="Importe de la Entrada/Salida : "></asp:Label>
                                            <asp:TextBox ID="txtImporte" runat="server" CssClass="black14b" Width="150px"></asp:TextBox>
                                        </li>
                                        <li>
                                            <asp:Button ID="btGuardarInsercionCaja" runat="server" Text="Guardar" CssClass="botonEntradaSalida" OnClick="btGuardarInsercionCaja_OnClick"/>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>