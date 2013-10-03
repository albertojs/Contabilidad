using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtNombre.Focus();
        }

        divError.Visible = false;
    }
    protected void btEntrar_OnClick(object sender, EventArgs e)
    {
        if (txtNombre.Text == "")
        {
            divError.Visible = true;
            lblError.Text = "El Nombre no se puede dejar en blanco";
        }
        else if (txtPassword.Text == "")
        {
            divError.Visible = true;
            lblError.Text = "La Contraseña no se puede dejar en blanco";
        }
        else
        {
            String nombre = txtNombre.Text.Trim();
            String password = txtPassword.Text.Trim();

            DataSet ds = MasterBD.iniciarSesion(nombre);

            if (ds.Tables[0].Rows[0][0].ToString() == "0")
            {
                divError.Visible = true;
                lblError.Text = "El nombre de Usuario o la Contraseña no son correctos";
            }
            else if (ds.Tables[0].Rows[0][0].ToString() == "1")
            {
                password = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "sha1");

                if (password == ds.Tables[0].Rows[0][1].ToString())
                {
                    int id_operador = Convert.ToInt32(ds.Tables[0].Rows[0][2].ToString());

                    Response.Redirect("Contabilidad/Index.aspx?search="+id_operador.ToString());
                }
                else
                {
                    divError.Visible = true;
                    lblError.Text = "El nombre de Usuario o la Contraseña no son correctos";
                }

            }

            
        }
    }
}
