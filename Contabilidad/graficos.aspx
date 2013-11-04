<%@ Page Language="C#" AutoEventWireup="true" CodeFile="graficos.aspx.cs" Inherits="Contabilidad_graficos" MasterPageFile="~/MasterPage.master" Theme="main" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <title>
        Contabilidad - Gráficos
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
                
            <div id="graficos">
                    <p>Generar Gráficos</p>
                        
                        <div id="formGraficos"> 

                            <div id="calendarioGraficos">
                            <asp:Calendar ID="calendarioGrafico" runat="server" Height="100px" DayHeaderStyle-HorizontalAlign="Center" CssClass="calendarioEntradaSalida" OnSelectionChanged="calendarioGrafico_OnSelectionChanged">
                                <TitleStyle BackColor="#ffb400" Font-Size="14px" HorizontalAlign="Center" Font-Bold="true"/>
                                <SelectedDayStyle  BackColor="#4dbbe5" HorizontalAlign="Center" CssClass="calendarSelectedDay"/>
                                <DayStyle Font-Underline="false" HorizontalAlign="Center" BackColor="White"/>
                                <TodayDayStyle BackColor="#ffb400" HorizontalAlign="Center" CssClass="calendarToday"/>
                                <OtherMonthDayStyle BackColor="white"/>
                                <NextPrevStyle HorizontalAlign="Center" Font-Bold="true"/>
                                <DayHeaderStyle  BackColor="#ffb400"/>
                            </asp:Calendar>
                            </div>
                           
                           <div id="formGraficos2">
                                <ul>
                                    <li>
                                        <asp:Label ID="Label1" runat="server" CssClass="lightGrey" Text="Fecha Inicial" Width="150px"></asp:Label>
                                        <asp:TextBox ID="txtFechaInicialGrafico" runat="server" CssClass="textbox" Width="90px" MaxLength="10"></asp:TextBox>&nbsp;&nbsp;
                                        <asp:Label ID="Label2" runat="server" Text="(dd/mm/aaaa)" CssClass="darkBlue" ></asp:Label>
                                    </li>
                                    <li>
                                        <asp:Label ID="Label3" runat="server" CssClass="lightGrey" Text="Fecha Final" Width="150px"></asp:Label>    
                                        <asp:TextBox ID="txtFechaFinalGrafico" runat="server" CssClass="textbox" Width="90px" MaxLength="10"></asp:TextBox>&nbsp;&nbsp;
                                        <asp:Label ID="Label4" runat="server" Text="(dd/mm/aaaa)" CssClass="darkBlue"></asp:Label>    
                                    </li>
                                    <li id="liBoton">
                                        <asp:Button ID="btGraficos" runat="server" Text="Generar gráficos" CssClass="botonEntradaSalida" Width="140px" OnClick="btGraficos_OnClick"/>    
                                    </li>
                                </ul>
                                    
                            </div>

                            <div id="listaGraficos">
                            <ul>
                                <li id="graf1">
                                    Beneficios
                                </li>
                                <li id="graf2">
                                    Gastos
                                </li>
                                <li id="graf3">
                                    Beneficios y Gastos
                                </li>
                                <li id="graf4">
                                    Top 10 Gastos
                                </li>
                                <li id="graf5">
                                    Recaudación diaria VS fiestas
                                </li>
                                <li id="graf6">
                                    Ganancias personales
                                </li>
                            </ul>
                            </div>
                        

                        <div id="grafico1" class="grafico">
                            <div class="grafico2">
                                <asp:Chart ID="Chart3" runat="server" Width="800px" Height="400px" 
                                    BackColor="WhiteSmoke" BackSecondaryColor="224, 224, 224" 
                                    BackGradientStyle="TopBottom"  EnableViewState="true">
                                    <Series>
                                        <asp:Series Name="Beneficios" ChartType="StackedColumn" ChartArea="ChartArea1"
                                            YValuesPerPoint="1" ToolTip="#VALX : #VALY €" >
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
                            </div>
                        </div>
                         <div id="grafico2" class="grafico">
                            <div class="grafico2">
                                <asp:Chart ID="Chart4" runat="server" Width="800px" Height="400px" 
                                    BackColor="WhiteSmoke" BackSecondaryColor="224, 224, 224" 
                                    BackGradientStyle="TopBottom"  EnableViewState="true">
                                    <Series>
                                        <asp:Series Name="Gastos" ChartType="StackedColumn" ChartArea="ChartArea1" 
                                            Color="IndianRed"  ToolTip="#VALX : #VALY €" >
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
                            </div>
                        </div>
                        <div id="grafico3" class="grafico">
                            <div class="grafico2">
                                <asp:Chart ID="Chart1" runat="server" Width="800px" Height="400px" 
                                    BackColor="WhiteSmoke" BackSecondaryColor="224, 224, 224" 
                                    BackGradientStyle="TopBottom"  EnableViewState="true">
                                    <Series>
                                        <asp:Series Name="Beneficios" ChartType="StackedColumn" ChartArea="ChartArea1" 
                                            YValuesPerPoint="10"  ToolTip="#VALX : #VALY €" >
                                        </asp:Series>
                                        <asp:Series Name="Gastos" ChartType="StackedColumn" ChartArea="ChartArea1" 
                                            Color="IndianRed"  ToolTip="#VALX : #VALY €" >
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
                            </div>
                        </div>
                        <div id="grafico4" class="grafico">
                            <div class="grafico2">
                                <asp:Chart ID="Chart2" runat="server" Width="800px" Height="400px" 
                                    BackColor="WhiteSmoke" BackSecondaryColor="224, 224, 224" 
                                    BackGradientStyle="TopBottom"   EnableViewState="true">
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
                            </div>
                        </div>
                        <div id="grafico5" class="grafico">
                            <div class="grafico2">
                                <asp:Chart ID="Chart5" runat="server" Width="800px" Height="400px" 
                                    BackColor="WhiteSmoke" BackSecondaryColor="224, 224, 224" 
                                    BackGradientStyle="TopBottom"   EnableViewState="true">
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
                            </div>
                        </div>
                        <div id="grafico6" class="grafico">
                            <div class="grafico2">
                                <asp:Chart ID="Chart6" runat="server" Width="800px" Height="400px" 
                                    BackColor="WhiteSmoke" BackSecondaryColor="224, 224, 224" 
                                    BackGradientStyle="TopBottom"  EnableViewState="true">
                                    <Series>
                                        <asp:Series Name="Ganancias" ChartType="StackedColumn" ChartArea="ChartArea1"
                                            YValuesPerPoint="1" ToolTip="#VALX : #VALY €" >
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
                                        <asp:Title Text="Ganancias" TextStyle="Shadow" 
                                            Font="Microsoft Sans Serif, 18pt" />
                                    </Titles>
                                    <Legends>
                                        <asp:Legend Name="Default" BackSecondaryColor="White" BackColor="Gainsboro" BackGradientStyle="DiagonalLeft" />
                                    </Legends>
                                    <BorderSkin SkinStyle="Emboss" />
                                </asp:Chart>
                            </div>
                        </div>
                    </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>