using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lnkSalir_OnClick(object sender, EventArgs e)
    {
        Session["NOMBRE_OPERADOR"] = null;
        Session["ID_OPERADOR"] = null;
        Response.Redirect("~/login.aspx");
    }
}
