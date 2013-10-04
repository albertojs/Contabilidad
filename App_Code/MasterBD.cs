using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
/// <summary>
/// Descripción breve de Master
/// </summary>
public class MasterBD
{
	public MasterBD()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
    static public DataSet listarTipoConceptos()
    {
        // Crear la conexión con la BBDD y el comando
        SqlConnection cnn = new SqlConnection(ConfigurationSettings.AppSettings["connectionString"]);
        SqlDataAdapter da = new SqlDataAdapter("Index_STipoConceptos", cnn);

        da.SelectCommand.CommandType = CommandType.StoredProcedure;

        // Añadir parámetros al procedimiento almacenado
        /*SqlParameter pid_usuario = new SqlParameter("@id_usuario", SqlDbType.Int);
        pid_usuario.Value = id_usuario;
        da.SelectCommand.Parameters.Add(pid_usuario);*/

        DataSet ds = new DataSet();
        da.Fill(ds);

        // Comprobar si existe el operador indicado

        return ds;
    }
    static public DataSet listarConceptos()
    {
        // Crear la conexión con la BBDD y el comando
        SqlConnection cnn = new SqlConnection(ConfigurationSettings.AppSettings["connectionString"]);
        SqlDataAdapter da = new SqlDataAdapter("Index_SConceptos", cnn);

        da.SelectCommand.CommandType = CommandType.StoredProcedure;

        // Añadir parámetros al procedimiento almacenado
        /*SqlParameter pid_usuario = new SqlParameter("@id_usuario", SqlDbType.Int);
        pid_usuario.Value = id_usuario;
        da.SelectCommand.Parameters.Add(pid_usuario);*/

        DataSet ds = new DataSet();
        da.Fill(ds);

        // Comprobar si existe el operador indicado

        return ds;
    }
    static public DataSet insertarConcepto(String nombre,int id_tipo_concepto)
    {
        // Crear la conexión con la BBDD y el comando
        SqlConnection cnn = new SqlConnection(ConfigurationSettings.AppSettings["connectionString"]);
        SqlDataAdapter da = new SqlDataAdapter("Index_IConcepto", cnn);

        da.SelectCommand.CommandType = CommandType.StoredProcedure;

        // Añadir parámetros al procedimiento almacenado
        SqlParameter pnombre = new SqlParameter("@nombre", SqlDbType.VarChar);
        pnombre.Value = nombre;
        da.SelectCommand.Parameters.Add(pnombre);

        SqlParameter pid_tipo_concepto = new SqlParameter("@id_tipo_concepto", SqlDbType.Int);
        pid_tipo_concepto.Value = id_tipo_concepto;
        da.SelectCommand.Parameters.Add(pid_tipo_concepto);

        DataSet ds = new DataSet();
        da.Fill(ds);

        // Comprobar si existe el operador indicado

        return ds;
    }
    static public DataSet eliminarConcepto(int id_concepto)
    {
        // Crear la conexión con la BBDD y el comando
        SqlConnection cnn = new SqlConnection(ConfigurationSettings.AppSettings["connectionString"]);
        SqlDataAdapter da = new SqlDataAdapter("Index_EConcepto", cnn);

        da.SelectCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter pid_concepto = new SqlParameter("@id_concepto", SqlDbType.Int);
        pid_concepto.Value = id_concepto;
        da.SelectCommand.Parameters.Add(pid_concepto);


        DataSet ds = new DataSet();
        da.Fill(ds);

        // Comprobar si existe el operador indicado

        return ds;
    }
    static public DataSet listarConceptoInsertar(int id_tipo_concepto)
    {
        // Crear la conexión con la BBDD y el comando
        SqlConnection cnn = new SqlConnection(ConfigurationSettings.AppSettings["connectionString"]);
        SqlDataAdapter da = new SqlDataAdapter("Index_SconceptosInsertar", cnn);

        da.SelectCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter pid_tipo_concepto = new SqlParameter("@id_tipo_concepto", SqlDbType.Int);
        pid_tipo_concepto.Value = id_tipo_concepto;
        da.SelectCommand.Parameters.Add(pid_tipo_concepto);


        DataSet ds = new DataSet();
        da.Fill(ds);

        // Comprobar si existe el operador indicado

        return ds;
    }
    static public DataSet insertarMovimientoCaja(int id_operador,DateTime fecha_caja,int id_concepto,Decimal importe)
    {
        // Crear la conexión con la BBDD y el comando
        SqlConnection cnn = new SqlConnection(ConfigurationSettings.AppSettings["connectionString"]);
        SqlDataAdapter da = new SqlDataAdapter("Index_ImovimientoCaja", cnn);

        da.SelectCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter pid_operador = new SqlParameter("@id_operador", SqlDbType.Int);
        pid_operador.Value = id_operador;
        da.SelectCommand.Parameters.Add(pid_operador);

        SqlParameter pfecha_caja = new SqlParameter("@fecha_caja", SqlDbType.DateTime);
        pfecha_caja.Value = fecha_caja;
        da.SelectCommand.Parameters.Add(pfecha_caja);

        SqlParameter pid_concepto = new SqlParameter("@id_concepto", SqlDbType.Int);
        pid_concepto.Value = id_concepto;
        da.SelectCommand.Parameters.Add(pid_concepto);

        SqlParameter pimporte = new SqlParameter("@importe", SqlDbType.Decimal);
        pimporte.Value = importe;
        da.SelectCommand.Parameters.Add(pimporte);


        DataSet ds = new DataSet();
        da.Fill(ds);

        // Comprobar si existe el operador indicado

        return ds;
    }
    static public DataSet cargarDatosIniciales(int id_operador)
    {
        // Crear la conexión con la BBDD y el comando
        SqlConnection cnn = new SqlConnection(ConfigurationSettings.AppSettings["connectionString"]);
        SqlDataAdapter da = new SqlDataAdapter("Index_SobtenerDatosInicio", cnn);

        da.SelectCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter pid_operador = new SqlParameter("@id_operador", SqlDbType.Int);
        pid_operador.Value = id_operador;
        da.SelectCommand.Parameters.Add(pid_operador);


        DataSet ds = new DataSet();
        da.Fill(ds);

        // Comprobar si existe el operador indicado

        return ds;
    }
    static public DataSet eliminarMovimientoCaja(int id_caja)
    {
        // Crear la conexión con la BBDD y el comando
        SqlConnection cnn = new SqlConnection(ConfigurationSettings.AppSettings["connectionString"]);
        SqlDataAdapter da = new SqlDataAdapter("Index_Ecaja", cnn);

        da.SelectCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter pid_caja = new SqlParameter("@id_caja", SqlDbType.Int);
        pid_caja.Value = id_caja;
        da.SelectCommand.Parameters.Add(pid_caja);


        DataSet ds = new DataSet();
        da.Fill(ds);

        // Comprobar si existe el operador indicado

        return ds;
    }
    static public DataSet generarListados(DateTime fecha_inicial, DateTime fecha_final, int id_tipo_concepto, String concepto, String concepto2, String concepto3)
    {
        // Crear la conexión con la BBDD y el comando
        SqlConnection cnn = new SqlConnection(ConfigurationSettings.AppSettings["connectionString"]);
        SqlDataAdapter da = new SqlDataAdapter("Index_Slistados", cnn);

        da.SelectCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter pfecha_inicial = new SqlParameter("@fecha_inicial", SqlDbType.DateTime);
        pfecha_inicial.Value = fecha_inicial;
        da.SelectCommand.Parameters.Add(pfecha_inicial);

        SqlParameter pfecha_final = new SqlParameter("@fecha_final", SqlDbType.DateTime);
        pfecha_final.Value = fecha_final;
        da.SelectCommand.Parameters.Add(pfecha_final);

        SqlParameter pid_tipo_concepto = new SqlParameter("@id_tipo_concepto", SqlDbType.Int);
        pid_tipo_concepto.Value = id_tipo_concepto;
        da.SelectCommand.Parameters.Add(pid_tipo_concepto);


        SqlParameter pconcepto = new SqlParameter("@concepto", SqlDbType.VarChar);
        pconcepto.Value = concepto;
        da.SelectCommand.Parameters.Add(pconcepto);

        SqlParameter pconcepto2 = new SqlParameter("@concepto2", SqlDbType.VarChar);
        pconcepto2.Value = concepto2;
        da.SelectCommand.Parameters.Add(pconcepto2);

        SqlParameter pconcepto3 = new SqlParameter("@concepto3", SqlDbType.VarChar);
        pconcepto3.Value = concepto3;
        da.SelectCommand.Parameters.Add(pconcepto3);

        DataSet ds = new DataSet();
        da.Fill(ds);

        // Comprobar si existe el operador indicado

        return ds;
    }
    static public DataSet iniciarSesion(String nombre_operador)
    {
        // Crear la conexión con la BBDD y el comando
        SqlConnection cnn = new SqlConnection(ConfigurationSettings.AppSettings["connectionString"]);
        SqlDataAdapter da = new SqlDataAdapter("Login_ScomprobarOperador", cnn);

        da.SelectCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter pnombre_operador = new SqlParameter("@nombre_operador", SqlDbType.VarChar);
        pnombre_operador.Value = nombre_operador;
        da.SelectCommand.Parameters.Add(pnombre_operador);

        DataSet ds = new DataSet();
        da.Fill(ds);

        // Comprobar si existe el operador indicado

        return ds;
    }
    static public DataSet listarConceptosListados()
    {
        // Crear la conexión con la BBDD y el comando
        SqlConnection cnn = new SqlConnection(ConfigurationSettings.AppSettings["connectionString"]);
        SqlDataAdapter da = new SqlDataAdapter("Index_SconceptosListados", cnn);

        da.SelectCommand.CommandType = CommandType.StoredProcedure;

        DataSet ds = new DataSet();
        da.Fill(ds);

        // Comprobar si existe el operador indicado

        return ds;
    }
    static public DataSet generarGraficos()
    {
        // Crear la conexión con la BBDD y el comando
        SqlConnection cnn = new SqlConnection(ConfigurationSettings.AppSettings["connectionString"]);
        SqlDataAdapter da = new SqlDataAdapter("Index_SlistadoGraficas", cnn);

        da.SelectCommand.CommandType = CommandType.StoredProcedure;

        DataSet ds = new DataSet();
        da.Fill(ds);

        // Comprobar si existe el operador indicado

        return ds;
    }
}
