using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;

public partial class Contabilidad_inicio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                //comprobarSesion();
                cargarDatosIniciales();
                /*cargarDatosFijos();
                cargarConceptos();
                cargarTipoConceptos();
                cargarConceptoListados();*/
            }
            catch
            {
                Response.Redirect("../Login.aspx");
            }
        }
    }
    protected void cargarDatosIniciales()
    {

        DataSet ds = new DataSet();
        try
        {
            if (Session["ID_OPERADOR"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
            else
            {
                
                int id_operador = Convert.ToInt32(Session["ID_OPERADOR"]);
                ds = MasterBD.cargarDatosIniciales(id_operador);


                Label nombreUsuario = (Label)Master.FindControl("lblNombreUsuarioConectado");
                nombreUsuario.Text = ds.Tables[0].Rows[0][0].ToString();
                Session["NOMBRE_OPERADOR"] = nombreUsuario.Text;
                gvInicio.DataSource = ds.Tables[1];
                gvInicio.DataBind();
            }
        }
        catch
        {
            Response.Redirect("../Login.aspx");
        }


        if (ds.Tables[2].Rows[0][0].ToString() == "")
        {
            lblTotalCaja.Text = "0  €";
        }
        else
        {
            if (Convert.ToDecimal(ds.Tables[2].Rows[0][0].ToString()) < 0)
            {
                lblTotalCaja.ForeColor = Color.Red;
            }
            else
            {
                lblTotalCaja.ForeColor = Color.Blue;
            }

            lblTotalCaja.Text = ds.Tables[2].Rows[0][0].ToString() + "  €";
           
        }
    }
    protected void gvInicio_OnRowDatBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.Cells[4].Text == "ENTRADA")
        {
            e.Row.Cells[4].ForeColor = Color.Blue;
            e.Row.Cells[5].ForeColor = Color.Blue;
            e.Row.Cells[5].HorizontalAlign = HorizontalAlign.Right;
        }
        else if (e.Row.Cells[4].Text == "SALIDA")
        {
            e.Row.Cells[4].ForeColor = Color.Red;
            e.Row.Cells[5].ForeColor = Color.Red;
            e.Row.Cells[5].HorizontalAlign = HorizontalAlign.Right;
        }

        e.Row.Cells[5].Text = e.Row.Cells[5].Text.Replace("-", "");

    }
}