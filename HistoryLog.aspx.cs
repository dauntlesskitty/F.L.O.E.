using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;

namespace FLOE.Admin
{
    public partial class HistoryLog : System.Web.UI.Page
    {
        SqlDataReader reader;
        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    if (Session["user"] == null)
            //    {
            //        LOGOUT();
            //    }
            //}

        }

        protected void LOGOUT()
        {
            HttpCookie cookie1 = new HttpCookie(FormsAuthentication.FormsCookieName, "");
            cookie1.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(cookie1);

            FormsAuthentication.RedirectToLoginPage();
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
        }

        private SqlDataReader ReadRecords(string query)
        {
            String ConnString = ConfigurationManager.ConnectionStrings["SDM_PUPMConnectionString1"].ConnectionString;
            conn = new SqlConnection(ConnString);
            conn.Open();

            SqlCommand cmd = new SqlCommand(query, conn);
            reader = cmd.ExecuteReader();

            return reader;
        }

        protected void RadGrid1_DataBound(object sender, System.EventArgs e)
        {
            reader.Close();
            conn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                //SELECT LfoRefNo FROM[SDM_PUPM].[dbo].[PUPM_Tran_Log] WHERE LfoRefNo Like '%Anti-Virus%' Should be likethis

                string O=DropDownList1.SelectedValue;
                Response.Write(O);

                GridView1.Visible = false;
                GridView2.Visible = true;

                GridView2.DataSource=ReadRecords("SELECT * FROM [SDM_PUPM].[dbo].[PUPM_Tran_Log] WHERE LfoRefNo LIKE '%" + O + "%'");



                //RadGridHistoryLog.DataSource = ReadRecords("SELECT TOP 3 * FROM [SDM_PUPM].[dbo].[PUPM_Tran_Log] WHERE LfoRefNo LIKE '%"+ ICnameTextBox.Text + "%'");
                GridView2.DataBind();
            }
            catch (Exception)
            {

            }
        }


        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

 
    }
}