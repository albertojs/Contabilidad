using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;

public partial class Contabilidad_conceptos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        comprobarSesion();

        if (!IsPostBack)
        {
            cargarDatosIniciales();
            cargarConceptos();
            cargarTipoConceptos();
        }
        divError.Visible = false;
        divError.Attributes["class"] = "error";
    }
    protected void comprobarSesion()
    {
        if (Session["ID_OPERADOR"] == null)
        {
            Response.Redirect("../Login.aspx");
        }
    }
    protected void cargarDatosIniciales()
    {
        try
        {

            int id_operador = Convert.ToInt32(Session["ID_OPERADOR"]);

            Label nombreUsuario = (Label)Master.FindControl("lblNombreUsuarioConectado");
            nombreUsuario.Text = Session["NOMBRE_OPERADOR"].ToString();

        }
        catch
        {
            Response.Redirect("../Login.aspx");
        }
    }
    protected void btGuardarConcepto_OnClick(object sender, EventArgs e)
    {
        if (txtNombreConcepto.Text.Trim() == "")
        {
            divError.Visible = true;
            divError.Attributes["class"] = "error";
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
    protected void cargarConceptos()
    {
        DataSet ds = MasterBD.listarConceptos();
        gvConceptos.DataSource = ds;
        gvConceptos.DataBind();
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
    protected void gvConceptos_OnRowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            int id_concepto = Convert.ToInt32(gvConceptos.DataKeys[Convert.ToInt32(e.CommandArgument)].Values[0]);

            MasterBD.eliminarConcepto(id_concepto);
            cargarConceptos();

            divError.Visible = true;
            divError.Attributes["class"] = "correcto";
            lblError.Text = "El concepto se ha eliminado correctamente";
        }
    }
    protected void cargarTipoConceptos()
    {
        DataSet ds = MasterBD.listarTipoConceptos();
        ddlTipoConcepto.DataSource = ds;
        ddlTipoConcepto.DataValueField = "id_tipo_concepto";
        ddlTipoConcepto.DataTextField = "nombre";
        ddlTipoConcepto.DataBind();

    }
}