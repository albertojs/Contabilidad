using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Contabilidad_graficos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        comprobarSesion();
        if (!IsPostBack)
        {
           cargarDatosIniciales();    
        }
        divError.Visible = false;
        divError.Attributes["class"] = "error";
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

        calendarioGrafico.SelectedDate = DateTime.Now;
        txtFechaInicialGrafico.Text = DateTime.Now.ToShortDateString();
        txtFechaFinalGrafico.Text = DateTime.Now.ToShortDateString();

    }
    protected void comprobarSesion()
    {
        if (Session["ID_OPERADOR"] == null)
        {
            Response.Redirect("../Login.aspx");
        }
    }
    protected void calendarioGrafico_OnSelectionChanged(object sender, EventArgs e)
    {
        if (ViewState["FECHA2"] == null)
        {
            ViewState["FECHA2"] = "2";

            txtFechaInicialGrafico.Text = calendarioGrafico.SelectedDate.ToShortDateString();
            txtFechaFinalGrafico.Text = calendarioGrafico.SelectedDate.ToShortDateString();
        }
        else if (ViewState["FECHA2"].ToString() == "1")
        {
            ViewState["FECHA2"] = "2";

            txtFechaInicialGrafico.Text = calendarioGrafico.SelectedDate.ToShortDateString();
            txtFechaFinalGrafico.Text = calendarioGrafico.SelectedDate.ToShortDateString();
        }
        else if (ViewState["FECHA2"].ToString() == "2")
        {
            ViewState["FECHA2"] = "1";
            txtFechaFinalGrafico.Text = calendarioGrafico.SelectedDate.ToShortDateString();
        }
    }
    protected Boolean validarFecha(String fecha)
    {
        DateTime fecha2;
        Boolean resultado = DateTime.TryParse(fecha, out fecha2);
        return resultado;

    }
    protected void btGraficos_OnClick(object sender, EventArgs e)
    {
        if (txtFechaInicialGrafico.Text.Trim() == "")
        {
            divError.Visible = true;
            lblError.Text = "La fecha inicial no puede dejarse en blanco";
        }
        else if (txtFechaFinalGrafico.Text.Trim() == "")
        {
            divError.Visible = true;
            lblError.Text = "La fecha final no puede dejarse en blanco";
        }
        else if (!validarFecha(txtFechaInicialGrafico.Text.Trim()))
        {
            divError.Visible = true;
            lblError.Text = "El formato de la fecha inicial no es correcto ha de ser (dd/mm/aaaa)";
        }
        else if (!validarFecha(txtFechaFinalGrafico.Text.Trim()))
        {
            divError.Visible = true;
            lblError.Text = "El formato de la fecha final no es correcto ha de ser (dd/mm/aaaa)";
        }
        else
        {
            DateTime fecha1 = Convert.ToDateTime(txtFechaInicialGrafico.Text.Trim());
            DateTime fecha2 = Convert.ToDateTime(txtFechaFinalGrafico.Text.Trim());
            fecha2 = fecha2.AddHours(23);
            fecha2 = fecha2.AddMinutes(59);
            fecha2 = fecha2.AddSeconds(59);
            cargarGraficos(fecha1, fecha2);
            divError.Visible = true;
            lblError.Text = "Se han generado los gráficos";
            divError.Attributes["class"] = "correcto";
        }
    }
    protected void cargarGraficos(DateTime fecha1, DateTime fecha2)
    {
        DataSet ds = MasterBD.generarGraficos(fecha1, fecha2);
        DataTable dt = ds.Tables[0];
        DataView data = new DataView(dt);

        Chart1.Series["Beneficios"].Points.DataBind(data, "Meses", "Ventas", "");
        Chart3.Series["Beneficios"].Points.DataBind(data, "Meses", "Ventas", "");

        dt = ds.Tables[1];
        data = new DataView(dt);
        Chart1.Series["Gastos"].Points.DataBind(data, "Meses", "Ventas", "");
        Chart4.Series["Gastos"].Points.DataBind(data, "Meses", "Ventas", "");

        dt = ds.Tables[2];
        data = new DataView(dt);

        Chart2.Series["Series1"].Points.DataBind(data, "concepto", "importe", "");

        dt = ds.Tables[3];
        data = new DataView(dt);
        Chart5.Series["recaudacion"].Points.DataBind(data, "concepto", "importe", "");


        dt = ds.Tables[4];
        data = new DataView(dt);
        Chart6.Series["Ganancias"].Points.DataBind(data, "Meses", "Ventas", "");


    }
}