using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Diagnostics;

public partial class Index_winner_route : System.Web.UI.Page
{
    DataTable dt2 = new DataTable();
    DataTable dt1 = new DataTable();
    DataSet dtset = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session.Clear();
        }
        if (Session["dtreferencia"] != null)
        {
            dt2 = (DataTable)Session["dtreferencia"];
        }
        if (Session["dtreferencia1"] != null)
        {
            dt1 = (DataTable)Session["dtreferencia1"];
        }
        if (Session["dt_simulacion_drag"] != null)
        {
            dtset = (DataSet)Session["dt_simulacion_drag"];
            crearDiv(0);
        }

    }

    public SqlConnection cnx = new SqlConnection(ConfigurationManager.ConnectionStrings[".sipCristar.dbConnectionString"].ConnectionString);
    public SqlCommand cmd = new SqlCommand();



    public DataTable consultarSql(string sentenciaSql)
    {
        DataTable dt = new DataTable();
        cnx.Open();
        cmd = new SqlCommand(sentenciaSql, cnx);
        SqlDataAdapter dp2 = new SqlDataAdapter(cmd);
        dp2.Fill(dt);
        cnx.Close();
        return dt;
    }
    public void mensajeGrowl(string mensaje, string tipom, string nomscript)
    {
        //(null, 'info', 'error', 'success','warning')
        string script = "$.bootstrapGrowl('" + mensaje + "',{ type:'" + tipom + "',offset: {from: 'bottom', amount: 20},width:400});";
        ScriptManager.RegisterStartupScript(this, typeof(Page), nomscript, script, true);
    }

    public void Fill_Grid()
    {
        dt1 = consultarSql("SELECT referencia,proceso,velocidad,peso_gota,anillo,ext_aguja,ext_tijera,machos,premolde,boquilleras,moldes,llevadores " +
                                     "from winner_route_pmp  where proceso <> 'stretch' and  referencia = '" + txt_referencia.Text + "' ");


        Session.Add("dtreferencia1", dt1);

        if (dt1.Rows.Count != 0)
        {
            grid1.DataSource = dt1;
            grid1.DataBind();

            SqlParameter parameter = new SqlParameter();
            parameter.ParameterName = "@ref";
            parameter.SqlDbType = SqlDbType.VarChar;
            parameter.Value = txt_referencia.Text.Trim();

            dt2 = new DataTable();
            cnx.Open();
            cmd = new SqlCommand("sp_winner_route_pmp", cnx);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(parameter);
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            ad.Fill(dt2);
            cmd.Parameters.Clear();
            cnx.Close();

            grid2.DataSource = dt2;
            grid2.DataBind();


            Session.Add("dtreferencia", dt2);
        }
        else
        {
            mensajeGrowl("No se encontro Registro << " + txt_referencia.Text + " >>", "info", "grow");
        }

        foreach (GridViewRow gr2 in grid2.Rows)
        {
            for (int i = 0; i < grid1.Columns.Count; i++)
            {
                if (gr2.Cells[i].Text.Equals(grid1.Rows[0].Cells[i].Text))
                {
                    gr2.Cells[i].BackColor = System.Drawing.Color.FromArgb(0x5cb85c);
                }
            }
        }
    }
    protected void btn_onclick_fill_grw(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(txt_referencia.Text))
        {
            //(null, 'info', 'error', 'success','warning')
            mensajeGrowl("Debes ingresar Referencia", "info", "grow");
        }
        else
        {
            Fill_Grid();
        }
    }

    protected void bnt_new_registrer(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "popup", "$('#myModal3').modal();", true);
    }

    protected void btn_grafic_modal(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(txt_referencia.Text))
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "popup", "$('#myModal4').modal();", true);

            DataTable tb = consultarSql("EXEC sp_winner_route_pmp  " + txt_referencia.Text + "");

            if (tb != null)// si el dt tiene datos entra en la condicion para comenzar a construir el chart
            {

                String chart = "";
                chart = "<canvas id=\"line-chart\" width=\"100%\" height=\"50\"></canvas>";
                chart += "<script>";
                chart += "new Chart(document.getElementById(\"line-chart\"), { type: 'line', data: {labels: [";

                // llenar label
                for (int i = 0; i < tb.Rows.Count; i++)
                {
                    chart += "'" + tb.Rows[i]["referencia"].ToString() + "',";
                }
                chart = chart.Substring(0, chart.Length - 1);

                chart += "],datasets: [{ data: [";

                // llenar datos
                String value = "";
                for (int i = 0; i < tb.Rows.Count; i++)
                {
                    value += tb.Rows[i]["c"].ToString().Replace(",", ".") + ",";
                }
                value = value.Substring(0, value.Length - 1);
                chart += value;

                chart += "],label: \"Route\",borderColor: \"#e60000\",fill: true}"; // Chart color
                chart += "]},options: { title: { display: true,text: 'Winner Route'} }"; // Chart title
                chart += "});";
                chart += "</script>";

                ltChart.Text = chart;
            }
        }
        else
        {
            mensajeGrowl("Debes ingresar Referencia", "info", "grow");
        }
    }

    protected void btn_simulacion_modal(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "popup", "$('#myModal3').modal();", true);
    }


    #region actualizar tabla winner route ....................................................................................................................................>
    protected void btn_edit_modal(object sender, EventArgs e)
    {
        LinkButton lb = (LinkButton)sender;
        GridViewRow row = (GridViewRow)lb.NamingContainer;

        Label1.Text = dt1.Rows[row.RowIndex]["Referencia"].ToString();

        txt_proceso_edit.Text = dt1.Rows[row.RowIndex]["proceso"].ToString();
        txt_peso_gota_edit.Text = dt1.Rows[row.RowIndex]["peso_gota"].ToString();
        txt_exc_aguja_edit.Text = dt1.Rows[row.RowIndex]["ext_aguja"].ToString();
        txt_machos_edit.Text = dt1.Rows[row.RowIndex]["machos"].ToString();
        txt_boquilleras_edit.Text = dt1.Rows[row.RowIndex]["boquilleras"].ToString();
        txt_llevadores_edit.Text = dt1.Rows[row.RowIndex]["llevadores"].ToString();
        txt_veloc_edit.Text = dt1.Rows[row.RowIndex]["velocidad"].ToString();
        txt_anillo_edit.Text = dt1.Rows[row.RowIndex]["anillo"].ToString();
        txt_exc_tijera_edit.Text = dt1.Rows[row.RowIndex]["ext_tijera"].ToString();
        txt_premolde_edit.Text = dt1.Rows[row.RowIndex]["premolde"].ToString();
        txt_moldes_edit.Text = dt1.Rows[row.RowIndex]["moldes"].ToString();

        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "popup", "$('#myModal6').modal();", true);

    }
    protected void btn_actualizar_tbl_winer_route(object sender, EventArgs e)
    {
        string senetencia = " update winner_route_pmp set proceso = @proceso, velocidad = @velocidad, peso_gota = @peso_gota, anillo = @anillo, ext_aguja = @ext_aguja, ext_tijera = @ext_tijera, " +
                            " machos = @machos, premolde = @premolde, boquilleras = @boquilleras, moldes = @molde, llevadores =@llevadores  where referencia = '" + Label1.Text + "'";

        using (SqlCommand cmd = new SqlCommand(senetencia, cnx))
        {

            cmd.Parameters.AddWithValue("@proceso", txt_proceso_edit.Text);
            cmd.Parameters.AddWithValue("@velocidad", txt_veloc_edit.Text);
            cmd.Parameters.AddWithValue("@peso_gota", txt_peso_gota_edit.Text);
            cmd.Parameters.AddWithValue("@anillo", txt_anillo_edit.Text);
            cmd.Parameters.AddWithValue("@ext_aguja", txt_exc_aguja_edit.Text);
            cmd.Parameters.AddWithValue("@ext_tijera", txt_exc_tijera_edit.Text);
            cmd.Parameters.AddWithValue("@machos", txt_machos_edit.Text);
            cmd.Parameters.AddWithValue("@premolde", txt_premolde_edit.Text);
            cmd.Parameters.AddWithValue("@boquilleras", txt_boquilleras_edit.Text);
            cmd.Parameters.AddWithValue("@molde", txt_moldes_edit.Text);
            cmd.Parameters.AddWithValue("@llevadores", txt_llevadores_edit.Text);

            cnx.Open();
            cmd.ExecuteNonQuery();
            cnx.Close();
        }

        mensajeGrowl("Campos Actualizados ", "info", "grow");
        Fill_Grid();
    }

    #endregion

    protected void btn_buscar_options(object sender, EventArgs e)
    {
        DataTable dt = consultarSql("select referencia,proceso,velocidad,peso_gota,anillo,ext_aguja,ext_tijera,machos,premolde,boquilleras,moldes,llevadores from winner_route_pmp where referencia = '" + txt_buscar_options.Text + "'");

        griv_editar.DataSource = dt;
        griv_editar.DataBind();

    }

    #region Eliminar............................>

    protected void btn_eliminar_Click(object sender, EventArgs e)
    {
        Button b = (Button)sender;

        if (b.ID == "btn_yes_conditional_modal")
        {
            //cnx.Open();
            //cmd = new SqlCommand("delete winner_route_pmp where referencia = '" + Label1.Text + "'", cnx);
            //cmd.ExecuteNonQuery();
            //cnx.Close();
            mensajeGrowl("Campos Eliminados ", "info", "grow");

        }
        else if (b.ID == "btn_eliminar")
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "popup", "$('#myModal7').modal();", true);
        }
    }


    public void Create_Referenc_New()
    {

        string sentencia = "insert into winner_route_pmp values ( @proceso, @velocidad, @peso_gota, @anillo, @extr_aguja, @ext_tijera, @machos, @premolde, @boquilleras, @moldes, @llevadores, @referencia)";


        using (SqlCommand cmd = new SqlCommand(sentencia, cnx))
        {

            cmd.Parameters.AddWithValue("@proceso", txt_create_proceso.Text.Trim());
            cmd.Parameters.AddWithValue("@velocidad", txt_create_velocidad.Text.Trim());
            cmd.Parameters.AddWithValue("@peso_gota", txt_create_peso_gota.Text.Trim());
            cmd.Parameters.AddWithValue("@anillo", txt_create_anillo.Text.Trim());
            cmd.Parameters.AddWithValue("@extr_aguja", txt_create_extr_aguja.Text.Trim());
            cmd.Parameters.AddWithValue("@ext_tijera", txt_create_ext_tijera.Text.Trim());
            cmd.Parameters.AddWithValue("@machos", txt_create_machos.Text.Trim());
            cmd.Parameters.AddWithValue("@premolde", txt_create_premolde.Text.Trim());
            cmd.Parameters.AddWithValue("@boquilleras", txt_create_boquilleras.Text.Trim());
            cmd.Parameters.AddWithValue("@moldes", txt_create_moldes.Text.Trim());
            cmd.Parameters.AddWithValue("@llevadores", txt_create_llevadores.Text.Trim());
            cmd.Parameters.AddWithValue("@referencia", txt_create_referencia.Text.Trim());


            cnx.Open();
            cmd.ExecuteNonQuery();
            cnx.Close();


            mensajeGrowl("Campos Registrados ", "info", "grow");
        }

    }



    #endregion


    #region Region Simlaciom........................................................................................................................................................................................



    protected void btn_agregar_refer_simula(object sender, EventArgs e)
    {
        DataTable dt = consultarSql("select referencia,proceso,velocidad,peso_gota,anillo,ext_aguja,ext_tijera,machos,premolde,boquilleras,moldes,llevadores " +
                                        "from winner_route_pmp where proceso <> 'stretch' and  referencia = '" + Txt_simular_referencia.Text + "' ");

        dtset.Tables.Add(dt);

        Session.Add("dt_simulacion_drag", dtset);
        crearDiv(dtset.Tables.Count - 1);

    }

    public void crearDiv(int ini)
    {
        for (int i = ini; i < dtset.Tables.Count; i++)
        {
            divcont.Controls.Add(new LiteralControl("<div draggable=\"true\" class=\"box_drag\">"));
            GridView gr = new GridView();
            gr.ID = "gri" + i;
            gr.AutoGenerateColumns = false;
            gr.CssClass = "table table-striped";
            gr.RowCommand += new GridViewCommandEventHandler(GridView1_RowCommand);

            ButtonField tempDesc = new ButtonField();
            tempDesc.HeaderText = "Referencia";
            tempDesc.DataTextField = "referencia";
            //tempDesc.ButtonType = ButtonType.Link;
            tempDesc.CommandName = "referencia";
            gr.Columns.Add(tempDesc);

            for (int j = 1 ;j < dtset.Tables[i].Columns.Count; j++)
            {
                gr = crearboundfields(gr, dtset.Tables[i].Columns[j].ColumnName, dtset.Tables[i].Columns[j].ColumnName);
            }

            gr.DataSource = dtset.Tables[i];
            gr.DataBind();
            divcont.Controls.Add(gr);
            divcont.Controls.Add(new LiteralControl("</div>"));
        }
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "addeventsdivs", "addevents();", true);
    }
    public GridView crearboundfields(GridView g, string headertext, string datafield)
    {
        BoundField f = new BoundField();
        f.HeaderText = headertext;
        f.DataField = datafield;
        g.Columns.Add(f);
        return g;
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "referencia" & e.CommandArgument.ToString() != "")
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "popup", "$('#myModal5').modal();", true);
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session.Clear();
    }

    #endregion


}












