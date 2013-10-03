using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.SessionState;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                comprobarSesion();
                cargarDatosIniciales();
                cargarDatosFijos();
                cargarConceptos();
                cargarTipoConceptos();
                cargarConceptoListados();
            }
            catch
            {
                Response.Redirect("../Login.aspx");
            }
        }
        divError.Visible = false;
        divError.Attributes["class"] = "error";
        
    }
    protected void comprobarSesion()
    {
        if (Request.QueryString["search"] == null)
        {
            Response.Redirect("../Login.aspx");
        }
    }
    protected void cargarDatosIniciales()
    {

        DataSet ds = new DataSet();
        try
        {
            int id_operador = Convert.ToInt32(Request.QueryString["search"]);
            Session.Clear();
            ViewState["ID_OPERADOR"] = id_operador;
            ds = MasterBD.cargarDatosIniciales(id_operador);

            lblNombreUsuarioConectado.Text = ds.Tables[0].Rows[0][0].ToString();
            gvInicio.DataSource = ds.Tables[1];
            gvInicio.DataBind();
        }
        catch
        {
            Response.Redirect("../Login.aspx");
        }


        if (ds.Tables[2].Rows[0][0].ToString() == "")
        {
            lblTotalCaja2.Text = "0  €";
            lblTotalCaja4.Text = "0  €";
        }
        else
        {
            if (Convert.ToDecimal(ds.Tables[2].Rows[0][0].ToString()) < 0)
            {
                lblTotalCaja2.ForeColor = Color.Red;
                lblTotalCaja4.ForeColor = Color.Red;
            }
            else
            {
                lblTotalCaja2.ForeColor = Color.Blue;
                lblTotalCaja4.ForeColor = Color.Blue;
            }

            lblTotalCaja2.Text = ds.Tables[2].Rows[0][0].ToString() + "  €";
            lblTotalCaja4.Text = ds.Tables[2].Rows[0][0].ToString() + "  €";
        }
    }
    protected void cargarDatosFijos()
    {
        CalendarFechaInsercion.SelectedDate = DateTime.Now;
        lblFechaInsercion.Text = DateTime.Now.ToShortDateString().ToString();

        txtFechaInicial.Text = DateTime.Now.ToShortDateString();
        txtFechaFinal.Text = DateTime.Now.ToShortDateString();
        CalendarListados.SelectedDate = DateTime.Now;
    }
    protected void cargarConceptosInsertar()
    {
        DataSet ds = MasterBD.listarConceptoInsertar(Convert.ToInt32(rblTipoConcepto.SelectedValue));
        ddlConcepto.DataSource = ds;
        ddlConcepto.DataValueField = "id_concepto";
        ddlConcepto.DataTextField = "nombre";
        ddlConcepto.DataBind();
    }
    protected void cargarConceptos()
    {
        DataSet ds = MasterBD.listarConceptos();
        gvConceptos.DataSource = ds;
        gvConceptos.DataBind();
    }
    protected void cargarTipoConceptos()
    {
        DataSet ds = MasterBD.listarTipoConceptos();
        ddlTipoConcepto.DataSource = ds;
        ddlTipoConcepto.DataValueField = "id_tipo_concepto";
        ddlTipoConcepto.DataTextField = "nombre";
        ddlTipoConcepto.DataBind();


        rblTipoConcepto.DataSource = ds;
        rblTipoConcepto.DataTextField = "nombre";
        rblTipoConcepto.DataValueField = "id_tipo_concepto";
        rblTipoConcepto.DataBind();


        rblTipoConceptoListados.DataSource = ds;
        rblTipoConceptoListados.DataTextField = "nombre";
        rblTipoConceptoListados.DataValueField = "id_tipo_concepto";
        rblTipoConceptoListados.DataBind();

        rblTipoConceptoListados.Items.Add(new ListItem("TODOS", "0"));
        rblTipoConceptoListados.SelectedIndex = 2;

        
    }
    protected void btGuardarConcepto_OnClick(object sender, EventArgs e)
    {
        if (txtNombreConcepto.Text.Trim() == "")
        {
            divError.Visible = true;
            lblError.Text = "Es Obligatorio introducir un nombre del Concepto";
        }
        else
        {
            MasterBD.insertarConcepto(txtNombreConcepto.Text.ToUpper().Trim(), Convert.ToInt32(ddlTipoConcepto.SelectedValue));
            cargarConceptos();
            ddlTipoConcepto.SelectedIndex = 0;
            txtNombreConcepto.Text = "";

            divError.Visible = true;
            divError.Attributes["class"] = "correcto";
            lblError.Text = "El concepto se ha guardado correctamente";
        }

    }
    protected void gvConceptos_OnRowDatBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.Cells[2].Text == "ENTRADA")
        {
            
            e.Row.Cells[2].ForeColor = Color.Blue;
        }
        else if (e.Row.Cells[2].Text == "SALIDA")
        {
            
            e.Row.Cells[2].ForeColor = Color.Red;
        }
    }
    protected void gvConceptos_OnRowCommand(object sender,GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            int id_concepto=Convert.ToInt32(gvConceptos.DataKeys[Convert.ToInt32(e.CommandArgument)].Values[0]);

            MasterBD.eliminarConcepto(id_concepto);
            cargarConceptos();

            divError.Visible = true;
            divError.Attributes["class"] = "correcto";
            lblError.Text = "El concepto se ha eliminado correctamente";
        }
    }
    protected void CalendarFechaInsercion_OnSelectionChanged(object sender, EventArgs e)
    {
        lblFechaInsercion.Text = CalendarFechaInsercion.SelectedDate.ToShortDateString();
    }
    protected void rblTipoConcepto_OnSelectedChanged(object sender, EventArgs e)
    {
        cargarConceptosInsertar();
        
        if (rblTipoConcepto.SelectedValue == "1")
        {
            ddlConcepto.ForeColor = Color.Blue;
        }
        else if (rblTipoConcepto.SelectedValue == "2")
        {
            ddlConcepto.ForeColor = Color.Red;
        }
    }
    protected void btGuardarInsercionCaja_OnClick(object sender, EventArgs e)
    {
        if (rblTipoConcepto.SelectedIndex == -1)
        {
            divError.Visible = true;
            lblError.Text = "Es obligatorio seleccionar un Tipo de Concepto a Insertar";
        }
        else if (ddlConcepto.SelectedIndex == -1)
        {
            divError.Visible = true;
            lblError.Text = "Es obligatorio seleccionar un Concepto a Insertar";
        }
        else if (txtImporte.Text.Trim() == "")
        {
            divError.Visible = true;
            lblError.Text = "Es obligatorio introducir un Importe en Euros (€)";
        }
        else if (!isNumeric(txtImporte.Text.Trim()))
        {
            divError.Visible = true;
            lblError.Text = "El Importe ha introducir ha de ser un valor numérico";
        }
        else
        {
            Decimal Importe = Convert.ToDecimal(txtImporte.Text.Replace("-", ""));

            if (rblTipoConcepto.SelectedValue == "2")
            {
                Importe = Convert.ToDecimal("-" + Importe.ToString());
            }

            DateTime fecha =Convert.ToDateTime( CalendarFechaInsercion.SelectedDate.ToShortDateString() + " " + DateTime.Now.ToShortTimeString());
            int id_operador = Convert.ToInt32(ViewState["ID_OPERADOR"]);

            MasterBD.insertarMovimientoCaja(id_operador,fecha, Convert.ToInt32(ddlConcepto.SelectedValue), Importe);

            reiniciarDatos();
            divError.Visible = true;
            lblError.Text = "El movimiento de caja se ha guardado correctamente";
            divError.Attributes["class"] = "correcto";
        }

    }
    protected void reiniciarDatos()
    {
        rblTipoConcepto.SelectedIndex = -1;
        DataSet ds=null;
        ddlConcepto.DataSource = ds;
        ddlConcepto.DataBind();
        ddlConcepto.Items.Clear();
        txtImporte.Text = "";
        txtNombreConcepto.Text = "";
        
    }
    protected Boolean isNumeric(String numero)
    {
        Decimal valor;
        Boolean resultado = Decimal.TryParse(numero, out valor);

        return resultado;
    }
    protected void gvInicio_OnRowDatBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.Cells[4].Text == "ENTRADA")
        {
            e.Row.Cells[4].ForeColor = Color.Blue;
            e.Row.Cells[5].ForeColor = Color.Blue;
        }
        else if (e.Row.Cells[4].Text == "SALIDA")
        {
            e.Row.Cells[4].ForeColor = Color.Red;
            e.Row.Cells[5].ForeColor = Color.Red;
        }

        e.Row.Cells[5].Text = e.Row.Cells[5].Text.Replace("-", "");

    }
    protected void lnkEliminarMovimientoCajaYes_OnClick(object sender, EventArgs e)
    {
        int id_caja = Convert.ToInt32(ViewState["ID_CAJA"]);
        MasterBD.eliminarMovimientoCaja(id_caja);

        DateTime fecha1 = Convert.ToDateTime(ViewState["FECHA_INICIAL"]);
        DateTime fecha2 = Convert.ToDateTime(ViewState["FECHA_FINAL"]);
        int id_tipo_concepto = Convert.ToInt32(ViewState["ID_TIPO_CONCEPTO"]);
        String concepto = ViewState["CONCEPTO"].ToString();

        DataSet ds = MasterBD.generarListados(fecha1, fecha2, id_tipo_concepto,concepto);
        gvListados.DataSource = ds.Tables[0];
        gvListados.DataBind();

        divError.Visible = true;
        divError.Attributes["class"] = "correcto";
        lblError.Text = "El movimiento de caja se ha eliminado correctamente";
        divConfirmacionEliminarMovimientoCaja.Visible = false;

        for (int i = 0; i < gvListados.Rows.Count; i++)
        {
            gvListados.Rows[Convert.ToInt32(i)].Cells[1].BackColor = Color.White;
            gvListados.Rows[Convert.ToInt32(i)].Cells[2].BackColor = Color.White;
            gvListados.Rows[Convert.ToInt32(i)].Cells[3].BackColor = Color.White;
            gvListados.Rows[Convert.ToInt32(i)].Cells[4].BackColor = Color.White;
            gvListados.Rows[Convert.ToInt32(i)].Cells[5].BackColor = Color.White;
            gvListados.Rows[Convert.ToInt32(i)].Cells[6].BackColor = Color.White;
        }
    }
    protected void lnkEliminarMovimientoCajaNo_OnClick(object sender, EventArgs e)
    {
        divConfirmacionEliminarMovimientoCaja.Visible = false;


        for (int i = 0; i < gvListados.Rows.Count; i++)
        {
            gvListados.Rows[Convert.ToInt32(i)].Cells[1].BackColor = Color.White;
            gvListados.Rows[Convert.ToInt32(i)].Cells[2].BackColor = Color.White;
            gvListados.Rows[Convert.ToInt32(i)].Cells[3].BackColor = Color.White;
            gvListados.Rows[Convert.ToInt32(i)].Cells[4].BackColor = Color.White;
            gvListados.Rows[Convert.ToInt32(i)].Cells[5].BackColor = Color.White;
            gvListados.Rows[Convert.ToInt32(i)].Cells[6].BackColor = Color.White;
        }
    }
    protected void mvOpciones_OnActiveViewChanged(object sender, EventArgs e)
    {
        if (mvOpciones.ActiveViewIndex == 0)
        {
            cargarDatosIniciales();
        }
        else if (mvOpciones.ActiveViewIndex == 1)
        {
            cargarDatosFijos();
            reiniciarDatos();
            CalendarFechaInsercion.SelectedDate = DateTime.Now;    
        }
        else if (mvOpciones.ActiveViewIndex == 2)
        {
            reiniciarDatos();
        }
        else if (mvOpciones.ActiveViewIndex == 3)
        {
            reiniciarListados();
            visibilidadListado(false);
        }
    }
    protected void reiniciarListados()
    {
        txtFechaInicial.Text = DateTime.Now.ToShortDateString();
        txtFechaFinal.Text = DateTime.Now.ToShortDateString();
        CalendarListados.SelectedDate = DateTime.Now;
        rblTipoConceptoListados.SelectedIndex = 2;
        DataSet ds = null;
        gvListados.DataSource = ds;
        gvListados.DataBind();
        ViewState["FECHA"] = null;
    }
    protected void CalendarListados_OnSelectionChanged(object sender, EventArgs e)
    {
        if (ViewState["FECHA"] == null)
        {
            ViewState["FECHA"] = "2";

            txtFechaInicial.Text = CalendarListados.SelectedDate.ToShortDateString();
            txtFechaFinal.Text = CalendarListados.SelectedDate.ToShortDateString();
        }
        else if (ViewState["FECHA"].ToString() == "1")
        {
            ViewState["FECHA"] = "2";

            txtFechaInicial.Text = CalendarListados.SelectedDate.ToShortDateString();
            txtFechaFinal.Text = CalendarListados.SelectedDate.ToShortDateString();
        }
        else if (ViewState["FECHA"].ToString() == "2")
        {
            ViewState["FECHA"] = "1";
            txtFechaFinal.Text = CalendarListados.SelectedDate.ToShortDateString();
        }
    }
    protected void gvListados_OnRowDatBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.Cells[4].Text == "ENTRADA")
        {
            e.Row.Cells[4].ForeColor = Color.Blue;
            e.Row.Cells[5].ForeColor = Color.Blue;
        }
        else if (e.Row.Cells[4].Text == "SALIDA")
        {
            e.Row.Cells[4].ForeColor = Color.Red;
            e.Row.Cells[5].ForeColor = Color.Red;
        }

        e.Row.Cells[5].Text = e.Row.Cells[5].Text.Replace("-", "");

    }
    protected void gvListados_OnRowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            int id_caja = Convert.ToInt32(gvListados.DataKeys[Convert.ToInt32(e.CommandArgument)].Values[0]);
            divConfirmacionEliminarMovimientoCaja.Visible = true;
            ViewState["ID_CAJA"] = id_caja;


            for (int i = 0; i < gvListados.Rows.Count; i++)
            {
                gvListados.Rows[Convert.ToInt32(i)].Cells[1].BackColor = Color.White;
                gvListados.Rows[Convert.ToInt32(i)].Cells[2].BackColor = Color.White;
                gvListados.Rows[Convert.ToInt32(i)].Cells[3].BackColor = Color.White;
                gvListados.Rows[Convert.ToInt32(i)].Cells[4].BackColor = Color.White;
                gvListados.Rows[Convert.ToInt32(i)].Cells[5].BackColor = Color.White;
                gvListados.Rows[Convert.ToInt32(i)].Cells[6].BackColor = Color.White;
            }

            gvListados.Rows[Convert.ToInt32(e.CommandArgument)].Cells[1].BackColor = Color.AliceBlue;
            gvListados.Rows[Convert.ToInt32(e.CommandArgument)].Cells[2].BackColor = Color.AliceBlue;
            gvListados.Rows[Convert.ToInt32(e.CommandArgument)].Cells[3].BackColor = Color.AliceBlue;
            gvListados.Rows[Convert.ToInt32(e.CommandArgument)].Cells[4].BackColor = Color.AliceBlue;
            gvListados.Rows[Convert.ToInt32(e.CommandArgument)].Cells[5].BackColor = Color.AliceBlue;
            gvListados.Rows[Convert.ToInt32(e.CommandArgument)].Cells[6].BackColor = Color.AliceBlue;
        }
    }
    protected Boolean validarFecha(String fecha)
    {
        DateTime fecha2;
        Boolean resultado = DateTime.TryParse(fecha, out fecha2);
        return resultado;

    }
    protected void btListados_OnClick(object sender, EventArgs e)
    {
        if(txtFechaInicial.Text.Trim() == "")
        {
            divError.Visible = true;
            lblError.Text = "La fecha inicial no puede dejarse en blanco";
        }
        else if (txtFechaFinal.Text.Trim() == "")
        {
            divError.Visible = true;
            lblError.Text = "La fecha final no puede dejarse en blanco";
        }
        else if(!validarFecha(txtFechaInicial.Text.Trim()))
        {
            divError.Visible = true;
            lblError.Text = "El formato de la fecha inicial no es correcto ha de ser (dd/mm/aaaa)";
        }
        else if(!validarFecha(txtFechaFinal.Text.Trim()))
        {
            divError.Visible = true;
            lblError.Text = "El formato de la fecha final no es correcto ha de ser (dd/mm/aaaa)";
        }
        else if (rblTipoConceptoListados.SelectedIndex == -1)
        {
            divError.Visible = true;
            lblError.Text = "Es obligatorio seleccionar un tipo de concepto";
        }
        else
        {
            DateTime fecha1 = Convert.ToDateTime(txtFechaInicial.Text.Trim());
            DateTime fecha2 = Convert.ToDateTime(txtFechaFinal.Text.Trim());
            int id_tipo_concepto = Convert.ToInt32(rblTipoConceptoListados.SelectedValue);
            String concepto = ddlConceptoListados.SelectedItem.Text.Trim();

            ViewState["FECHA_INICIAL"] = fecha1;
            ViewState["FECHA_FINAL"] = fecha2;
            ViewState["ID_TIPO_CONCEPTO"] = id_tipo_concepto;
            ViewState["CONCEPTO"] = concepto;

            DataSet ds = MasterBD.generarListados(fecha1, fecha2, id_tipo_concepto,concepto);

            gvListados.DataSource = ds.Tables[0];
            gvListados.DataBind();

            lblRelativoCaja.Text = "Caja entre el " + txtFechaInicial.Text.Trim() + " y el " + txtFechaFinal.Text.Trim()+" : ";
            lblRelativoCaja3.Text = "Caja entre el " + txtFechaInicial.Text.Trim() + " y el " + txtFechaFinal.Text.Trim() + " : ";

            if (ds.Tables[1].Rows[0][0].ToString() == "")
            {
                lblRelativoCaja2.Text = "0  €";
                lblRelativoCaja4.Text = "0  €";
            }
            else
            {
                if (Convert.ToDecimal(ds.Tables[1].Rows[0][0].ToString()) < 0)
                {
                    lblRelativoCaja2.ForeColor = Color.Red;
                    lblRelativoCaja4.ForeColor = Color.Red;
                }
                else
                {
                    lblRelativoCaja2.ForeColor = Color.Blue;
                    lblRelativoCaja4.ForeColor = Color.Blue;
                }

                lblRelativoCaja2.Text = ds.Tables[1].Rows[0][0].ToString() + "  €";
                lblRelativoCaja4.Text = ds.Tables[1].Rows[0][0].ToString() + "  €";
            }

            if (ds.Tables[2].Rows[0][0].ToString() == "")
            {
                lblTotalCaja6.Text = "0  €";
                lblTotalCaja8.Text = "0  €";
            }
            else
            {
                if (Convert.ToDecimal(ds.Tables[2].Rows[0][0].ToString()) < 0)
                {
                    lblTotalCaja6.ForeColor = Color.Red;
                    lblTotalCaja8.ForeColor = Color.Red;
                }
                else
                {
                    lblTotalCaja6.ForeColor = Color.Blue;
                    lblTotalCaja8.ForeColor = Color.Blue;
                }

                lblTotalCaja6.Text = ds.Tables[2].Rows[0][0].ToString() + "  €";
                lblTotalCaja8.Text = ds.Tables[2].Rows[0][0].ToString() + "  €";
            }
        }
        visibilidadListado(true);
    }
    protected void visibilidadListado(Boolean a)
    {
        lblRelativoCaja3.Visible = a;
        lblRelativoCaja4.Visible = a;
        lblTotalCaja7.Visible = a;
        lblTotalCaja8.Visible = a;
        lblRelativoCaja.Visible = a;
        lblRelativoCaja2.Visible = a;
        lblTotalCaja5.Visible = a;
        lblTotalCaja6.Visible = a;

    }
    protected void cargarConceptoListados()
    {
        DataSet ds = MasterBD.listarConceptosListados();
        ddlConceptoListados.DataSource = ds;
        ddlConceptoListados.DataValueField = "id_concepto";
        ddlConceptoListados.DataTextField = "nombre";
        ddlConceptoListados.DataBind();


        ListItem lt = new ListItem("--LISTAR TODOS--", "-1");
        ddlConceptoListados.Items.Add(lt);
        ddlConceptoListados.SelectedValue = "-1";

    }
    protected void ddlConceptoListados_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        if(ddlConceptoListados.SelectedValue == "-1")
        {
            rblTipoConceptoListados.SelectedIndex = 0;
            rblTipoConceptoListados.Enabled = true;
        }
        else
        {
            rblTipoConceptoListados.SelectedIndex = 0;
            rblTipoConceptoListados.Enabled = false;
        }
    }
    protected void ibListadoWord_OnClick(object sender, EventArgs e)
    {
        if (gvListados.Rows.Count > 0)
        {
            String html = "<html><body><table width='1000px' border='0'>";
            String filas="";
            String pie="</table></body></html>";
            String total = "<tr><td colspan='3'>Total </td><td>" + lblRelativoCaja2 .Text.Trim().Replace("€","")+ "</td></tr>";

            for (int i = 0; i < gvListados.Rows.Count; i++)
            {
                filas = filas + "<tr><td style='padding-top:10px; width:100px;'>" + Convert.ToDateTime(gvListados.Rows[i].Cells[1].Text.ToString()).ToShortDateString() + "</td><td style='padding-top:10px; width:600px;'>" + gvListados.Rows[i].Cells[3].Text.ToString() + "</td><td style='padding-top:10px; width:100px;'>" + gvListados.Rows[i].Cells[4].Text.ToString() + "</td><td style='padding-top:10px;  width:100px;'>" + gvListados.Rows[i].Cells[5].Text.ToString() + "</td></tr>";
            }
            
            
            html = html + filas + total + pie;
            
            Response.AddHeader("Content-Type","application/msword");
            Response.AddHeader("Content-disposition", "attachment; filename=Listado.doc");
            Response.Charset = "";
            Response.Write(html);

        }
    }

}