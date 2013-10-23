using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;

public partial class Contabilidad_listados : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        comprobarSesion();
        if (!IsPostBack)
        {
            cargarDatosIniciales();
            cargarTipoConceptos();
            cargarConceptoListados();
        }

        divError.Visible = false;
        divError.Attributes["class"] = "error";
    }
    protected void cargarDatosIniciales()
    {
        Label nombreUsuario = (Label)Master.FindControl("lblNombreUsuarioConectado");
        nombreUsuario.Text = Session["NOMBRE_OPERADOR"].ToString();

        txtFechaInicial.Text = DateTime.Now.ToShortDateString();
        txtFechaFinal.Text = DateTime.Now.ToShortDateString();

    }
    protected void comprobarSesion()
    {
        if (Session["ID_OPERADOR"] == null)
        {
            Response.Redirect("../Login.aspx");
        }
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
    protected void ddlConceptoListados_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlConceptoListados.SelectedValue == "-1")
        {
            rblTipoConceptoListados.SelectedIndex = 0;
            rblTipoConceptoListados.Enabled = true;

            lbConceptos.Enabled = false;
            lbConceptos.Items.Clear();
            
        }
        else
        {
            rblTipoConceptoListados.SelectedIndex = 0;
            rblTipoConceptoListados.Enabled = false;

            lbConceptos.Enabled = true;
            String texto = ddlConceptoListados.SelectedItem.Text;
            lbConceptos.Items.Add(texto);
        }

        
    }

    protected Boolean validarFecha(String fecha)
    {
        DateTime fecha2;
        Boolean resultado = DateTime.TryParse(fecha, out fecha2);
        return resultado;

    }
    protected String obtenerConceptos()
    {
        String conceptos = "(";

        for (int i = 0; i < lbConceptos.Items.Count; i++)
        {

            conceptos += "'" + lbConceptos.Items[i].Text+ "'";

            if (lbConceptos.Items[i] != lbConceptos.Items[lbConceptos.Items.Count - 1])
            {
                conceptos += ",";
            }
        }

        conceptos += ")";

        return conceptos;
    }
    protected String formarConsulta(String conceptos,DateTime fecha1,DateTime fecha2)
    {
        String query = "select a.id_caja as id_caja,Convert(varchar,a.fecha_caja,103) as fecha_caja,b.nombre_persona as nombre_persona,a.nombre_concepto as nombre_concepto,a.nombre_tipo_concepto as nombre_tipo_concepto,a.importe as importe "+
                        "from caja a,operador b "+
		                "where	a.id_operador=b.id_operador and "+
				        "a.nombre_concepto IN "+conceptos;

        query +=    " and Convert(datetime,a.fecha_caja,103) >=Convert(datetime,'"+fecha1+"',103) and " +
                    "Convert(datetime,a.fecha_caja,103)<=Convert(datetime,'"+fecha2+"',103)" +
                    "order by a.fecha_caja ";

        return query;
    }
    protected String formarConsulta2(String conceptos,DateTime fecha1, DateTime fecha2)
    {
       
        String query = "select sum(a.importe) " +
                        "from caja a " +
                        " where a.nombre_concepto IN " + conceptos;

        query += " and Convert(datetime,a.fecha_caja,103) >=Convert(datetime,'" + fecha1 + "',103) and " +
                    "Convert(datetime,a.fecha_caja,103)<=Convert(datetime,'" + fecha2 + "',103)";


        return query;
    }
    protected void btListados_OnClick(object sender, EventArgs e)
    {
        if (txtFechaInicial.Text.Trim() == "")
        {
            divError.Visible = true;
            lblError.Text = "La fecha inicial no puede dejarse en blanco";
        }
        else if (txtFechaFinal.Text.Trim() == "")
        {
            divError.Visible = true;
            lblError.Text = "La fecha final no puede dejarse en blanco";
        }
        else if (!validarFecha(txtFechaInicial.Text.Trim()))
        {
            divError.Visible = true;
            lblError.Text = "El formato de la fecha inicial no es correcto ha de ser (dd/mm/aaaa)";
        }
        else if (!validarFecha(txtFechaFinal.Text.Trim()))
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
            fecha2 = fecha2.AddHours(23);
            fecha2 = fecha2.AddMinutes(59);
            fecha2 = fecha2.AddSeconds(59);

            int id_tipo_concepto = Convert.ToInt32(rblTipoConceptoListados.SelectedValue);

            String consulta ="";
            String consulta2="";

            if (lbConceptos.Items.Count > 0)
            {
                String conceptos = obtenerConceptos();
                consulta = formarConsulta(conceptos,fecha1, fecha2);
                consulta2 = formarConsulta2(conceptos, fecha1, fecha2);
            }
            
            

            ViewState["FECHA_INICIAL"] = fecha1;
            ViewState["FECHA_FINAL"] = fecha2;
            ViewState["ID_TIPO_CONCEPTO"] = id_tipo_concepto;
            ViewState["CONSULTA1"] = consulta;
            ViewState["CONSULTA2"] = consulta2;

            DataSet ds = MasterBD.generarListados(fecha1, fecha2, id_tipo_concepto, consulta,consulta2);

            gvListados.DataSource = ds.Tables[0];
            gvListados.DataBind();

            lblTotalCaja1.Text = "Estado Total de la caja hasta la fecha :  ";
            lblRelativoCaja1.Text = "Caja entre el " + txtFechaInicial.Text.Trim() + " y el " + txtFechaFinal.Text.Trim() + " : ";
            

            if (ds.Tables[1].Rows[0][0].ToString() == "")
            {
                lblRelativoCaja2.Text = "0  €";
            
            }
            else
            {
                if (Convert.ToDecimal(ds.Tables[1].Rows[0][0].ToString()) < 0)
                {
                    lblRelativoCaja2.ForeColor = Color.Red;
                }
                else
                {
                    lblRelativoCaja2.ForeColor = Color.Blue;
                }

                lblRelativoCaja2.Text = ds.Tables[1].Rows[0][0].ToString() + "  €";
            }

            if (ds.Tables[2].Rows[0][0].ToString() == "")
            {
                lblTotalCaja2.Text = "0  €";
            }
            else
            {
                if (Convert.ToDecimal(ds.Tables[2].Rows[0][0].ToString()) < 0)
                {
                    lblTotalCaja2.ForeColor = Color.Red;
                }
                else
                {
                    lblTotalCaja2.ForeColor = Color.Blue;
                }

                lblTotalCaja2.Text = ds.Tables[2].Rows[0][0].ToString() + "  €";
            }

            divError.Visible = true;
            lblError.Text = "Se ha generado el listado";
            divError.Attributes["class"] = "correcto";

            visibilidadListado(true);
        }
    }
    protected void visibilidadListado(Boolean a)
    {
        lblRelativoCaja1.Visible = a;
        lblRelativoCaja2.Visible = a;
        lblTotalCaja1.Visible = a;
        lblTotalCaja2.Visible = a;
        divGvListados.Visible = a;
    }
    protected void lnkEliminarMovimientoCajaYes_OnClick(object sender, EventArgs e)
    {
        int id_caja = Convert.ToInt32(ViewState["ID_CAJA"]);
        MasterBD.eliminarMovimientoCaja(id_caja);

        DateTime fecha1 = Convert.ToDateTime(ViewState["FECHA_INICIAL"]);

        DateTime fecha2 = Convert.ToDateTime(ViewState["FECHA_FINAL"]);
        fecha2.AddHours(23);
        fecha2.AddMinutes(59);
        fecha2.AddSeconds(59);


        int id_tipo_concepto = Convert.ToInt32(ViewState["ID_TIPO_CONCEPTO"]);
        String consulta = ViewState["CONSULTA1"].ToString();
        String consulta2 = ViewState["CONSULTA2"].ToString();


        DataSet ds = MasterBD.generarListados(fecha1, fecha2, id_tipo_concepto,consulta,consulta2);
        gvListados.DataSource = ds.Tables[0];
        gvListados.DataBind();


        if (ds.Tables[1].Rows[0][0].ToString() == "")
        {
            lblRelativoCaja2.Text = "0  €";

        }
        else
        {
            if (Convert.ToDecimal(ds.Tables[1].Rows[0][0].ToString()) < 0)
            {
                lblRelativoCaja2.ForeColor = Color.Red;
            }
            else
            {
                lblRelativoCaja2.ForeColor = Color.Blue;
            }

            lblRelativoCaja2.Text = ds.Tables[1].Rows[0][0].ToString() + "  €";
        }

        if (ds.Tables[2].Rows[0][0].ToString() == "")
        {
            lblTotalCaja2.Text = "0  €";
        }
        else
        {
            if (Convert.ToDecimal(ds.Tables[2].Rows[0][0].ToString()) < 0)
            {
                lblTotalCaja2.ForeColor = Color.Red;
            }
            else
            {
                lblTotalCaja2.ForeColor = Color.Blue;
            }

            lblTotalCaja2.Text = ds.Tables[2].Rows[0][0].ToString() + "  €";
        }


        divError.Visible = true;
        divError.Attributes["class"] = "correcto";
        lblError.Text = "El movimiento de caja se ha eliminado correctamente";
        divConfirmacionEliminarMovimientoCaja.Visible = false;

    }
    protected void lnkEliminarMovimientoCajaNo_OnClick(object sender, EventArgs e)
    {
        divConfirmacionEliminarMovimientoCaja.Visible = false;
        gvListados.Rows[Convert.ToInt32(ViewState["FILA"])].CssClass = "";
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
            ViewState["FILA"] = Convert.ToInt32(e.CommandArgument);
            gvListados.Rows[Convert.ToInt32(e.CommandArgument)].CssClass = "filaSeleccionada";
           
        }
    }
    protected void ibListadoWord_OnClick(object sender, EventArgs e)
    {
        if (gvListados.Rows.Count > 0)
        {
            String cabecera = "<h3>Listado entre " + Convert.ToDateTime(ViewState["FECHA_INICIAL"]).ToShortDateString() + " y " + Convert.ToDateTime(ViewState["FECHA_FINAL"]).ToShortDateString();
            String html = "<html><body>" + cabecera + "<table width='1000px' border='0'>";
            String filas = "";
            String pie = "</table></body></html>";
            String total = "<tr><td colspan='3'><b>Total</b> </td><td><hr /><b>" + lblRelativoCaja2.Text.Trim().Replace("€", "") + "</b></td></tr>";

            for (int i = 0; i < gvListados.Rows.Count; i++)
            {
                filas = filas + "<tr><td style='padding-top:10px; width:100px;'>" + Convert.ToDateTime(gvListados.Rows[i].Cells[1].Text.ToString()).ToShortDateString() + "</td><td style='padding-top:10px;'>" + gvListados.Rows[i].Cells[3].Text.ToString();

                if (gvListados.Rows[i].Cells[4].Text.ToString() == "ENTRADA")
                {
                    filas = filas + "</td><td style='padding-top:10px; width:100px;'><span style='color:Blue;'>" + gvListados.Rows[i].Cells[4].Text.ToString() + "</span></td><td style='padding-top:10px;  width:100px;'><span style='color:Blue;'>" + gvListados.Rows[i].Cells[5].Text.ToString() + "</span></td></tr>";
                }
                else
                {
                    filas = filas + "</td><td style='padding-top:10px; width:100px;'><span style='color:Red;'>" + gvListados.Rows[i].Cells[4].Text.ToString() + "</span></td><td style='padding-top:10px;  width:100px;'><span style='color:Red;'>" + gvListados.Rows[i].Cells[5].Text.ToString() + "</span></td></tr>";
                }


            }


            html = html + filas + total + pie;

            Response.AddHeader("Content-Type", "application/msword");
            Response.AddHeader("Content-disposition", "attachment; filename=Listado_" + DateTime.Now.ToShortDateString() + ".doc");
            Response.Charset = "";
            Response.Write(html);

        }
        else
        {
            divError.Visible = true;
            lblError.Text = "No hay ningún dato para sacar en un listado Word";
        }
    }
    protected void cargarTipoConceptos()
    {
        DataSet ds = MasterBD.listarTipoConceptos();
        
        rblTipoConceptoListados.DataSource = ds;
        rblTipoConceptoListados.DataTextField = "nombre";
        rblTipoConceptoListados.DataValueField = "id_tipo_concepto";
        rblTipoConceptoListados.DataBind();

        rblTipoConceptoListados.Items.Add(new ListItem("TODOS", "0"));
        rblTipoConceptoListados.SelectedIndex = 2;


    }
    protected void cargarConceptoListados()
    {
        /*Primero concepto a listar*/
        DataSet ds = MasterBD.listarConceptosListados();
        ddlConceptoListados.DataSource = ds;
        ddlConceptoListados.DataValueField = "id_concepto";
        ddlConceptoListados.DataTextField = "nombre";
        ddlConceptoListados.DataBind();


        ListItem lt = new ListItem("--LISTAR TODOS--", "-1");
        ddlConceptoListados.Items.Add(lt);
        ddlConceptoListados.SelectedValue = "-1";
    }
    protected void lbConceptos_SelectedIndexChanged(object sender, EventArgs e)
    {
        lbConceptos.Items.Remove(lbConceptos.SelectedItem);
    }
}