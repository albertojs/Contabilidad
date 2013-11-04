using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;
using System.Web.UI.HtmlControls;

public partial class Contabilidad_entradaSalida : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        comprobarSesion();

        if (!IsPostBack)
        {    
            cargarDatosIniciales();
            cargarTipoConceptos();
        }
        divError.Visible = false;
        divError.Attributes["class"] = "error";
    }
    protected void cargarDatosIniciales()
    {
        Label nombreUsuario = (Label)Master.FindControl("lblNombreUsuarioConectado");
        nombreUsuario.Text = Session["NOMBRE_OPERADOR"].ToString();
        CalendarFechaInsercion.SelectedDate = DateTime.Now;
        lblFechaInsercion.Text = CalendarFechaInsercion.SelectedDate.ToShortDateString();
        
    }
    protected void comprobarSesion()
    {
        if (Session["ID_OPERADOR"] == null)
        {
            Response.Redirect("../Login.aspx");
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
            ddlConcepto.CssClass = "textboxBlue";
        }
        else if (rblTipoConcepto.SelectedValue == "2")
        {
            ddlConcepto.CssClass = "textboxRed"; 
        }
    }
    protected void cargarConceptosInsertar()
    {
        DataSet ds = MasterBD.listarConceptoInsertar(Convert.ToInt32(rblTipoConcepto.SelectedValue));
        ddlConcepto.DataSource = ds;
        ddlConcepto.DataValueField = "id_concepto";
        ddlConcepto.DataTextField = "nombre";
        ddlConcepto.DataBind();
    }
    protected void btGuardarInsercionCaja_OnClick(object sender, EventArgs e)
    {

        if (rblTipoConcepto.SelectedIndex == -1)
        {
            divError.Visible = true;
            lblError.Text="Es obligatorio seleccionar un Tipo de Concepto a Insertar";
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

            DateTime fecha = Convert.ToDateTime(CalendarFechaInsercion.SelectedDate.ToShortDateString() + " " + DateTime.Now.ToShortTimeString());
            int id_operador = Convert.ToInt32(Session["ID_OPERADOR"]);

            MasterBD.insertarMovimientoCaja(id_operador, fecha, Convert.ToInt32(ddlConcepto.SelectedValue), Importe);

            reiniciarDatos();
            divError.Visible = true;
            lblError.Text = "El movimiento de caja se ha guardado correctamente";

            divError.Attributes["class"] = "correcto";
        }

    }
    protected void reiniciarDatos()
    {
        rblTipoConcepto.SelectedIndex = -1;
        DataSet ds = null;
        ddlConcepto.DataSource = ds;
        ddlConcepto.DataBind();
        ddlConcepto.Items.Clear();
        txtImporte.Text = "";
    }
    protected Boolean isNumeric(String numero)
    {
        Decimal valor;
        Boolean resultado = Decimal.TryParse(numero, out valor);

        return resultado;
    }
    protected void cargarTipoConceptos()
    {
        DataSet ds = MasterBD.listarTipoConceptos();
        
        rblTipoConcepto.DataSource = ds;
        rblTipoConcepto.DataTextField = "nombre";
        rblTipoConcepto.DataValueField = "id_tipo_concepto";
        rblTipoConcepto.DataBind();

    }
}