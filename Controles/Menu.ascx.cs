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
using System.Text;
using System.ComponentModel;
using System.Drawing;
using System.Web.SessionState;
using System.Data.SqlClient;
using System.Resources;
using System.Threading;
using System.Globalization;
using System.IO;

public partial class Controles_Menu : System.Web.UI.UserControl
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            diseñoInicial();
        }
    }
    protected void diseñoInicial()
    {
        lnkMenu1.Style.Add("color", "blue");
        lnkMenu1.Style.Add("background-color", "#58CCF1");
        
    }
    protected void lnkMenu1_OnClick(object sender, EventArgs e)
    {
        reiniciarDiseño();
        lnkMenu1.Style.Add("color", "blue");
        lnkMenu1.Style.Add("background-color", "#58CCF1");

        MultiView mv = (MultiView)Parent.FindControl("mvOpciones");
        mv.ActiveViewIndex = 0;
    }
    protected void lnkMenu2_OnClick(object sender, EventArgs e)
    {
        reiniciarDiseño();
        lnkMenu2.Style.Add("color", "blue");
        lnkMenu2.Style.Add("background-color", "#58CCF1");

        MultiView mv = (MultiView)Parent.FindControl("mvOpciones");
        mv.ActiveViewIndex = 1;
    }
    protected void lnkMenu3_OnClick(object sender, EventArgs e)
    {
        reiniciarDiseño();
        lnkMenu3.Style.Add("color", "blue");
        lnkMenu3.Style.Add("background-color", "#58CCF1");

        MultiView mv = (MultiView)Parent.FindControl("mvOpciones");
        mv.ActiveViewIndex = 2;
    }
    protected void lnkMenu4_OnClick(object sender, EventArgs e)
    {
        reiniciarDiseño();
        lnkMenu4.Style.Add("color", "blue");
        lnkMenu4.Style.Add("background-color", "#58CCF1");

        MultiView mv = (MultiView)Parent.FindControl("mvOpciones");
        mv.ActiveViewIndex = 3;
    }
    protected void lnkMenu6_OnClick(object sender, EventArgs e)
    {
        reiniciarDiseño();
        lnkMenu6.Style.Add("color", "blue");
        lnkMenu6.Style.Add("background-color", "#58CCF1");

        MultiView mv = (MultiView)Parent.FindControl("mvOpciones");
        mv.ActiveViewIndex = 4;
    }
    protected void lnkMenu5_OnClick(object sender, EventArgs e)
    {
        Response.Redirect("../Login.aspx");
    }
    protected void reiniciarDiseño()
    {
        lnkMenu1.Style.Add("color", "");
        lnkMenu1.Style.Add("background-color", "");
        lnkMenu2.Style.Add("color", "");
        lnkMenu2.Style.Add("background-color", "");
        lnkMenu3.Style.Add("color", "");
        lnkMenu3.Style.Add("background-color", "");
        lnkMenu4.Style.Add("color", "");
        lnkMenu4.Style.Add("background-color", "");
        lnkMenu6.Style.Add("color", "");
        lnkMenu6.Style.Add("background-color", "");
    }
}
