using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contabilidad_listados : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            comprobarSesion();
            cargarDatosIniciales();
        }
    }
    protected void cargarDatosIniciales()
    {
        Label nombreUsuario = (Label)Master.FindControl("lblNombreUsuarioConectado");
        nombreUsuario.Text = Session["NOMBRE_OPERADOR"].ToString();

    }
    protected void comprobarSesion()
    {
        if (Session["ID_OPERADOR"] == null)
        {
            Response.Redirect("../Login.aspx");
        }
    }
}