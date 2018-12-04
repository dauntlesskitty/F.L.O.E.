using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using System.Configuration;

namespace FLOE.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            setAmount();
            if (!IsPostBack)
            {
                if (Session["user"] == null)
                {
                    LOGOUT();
                }
            }
        }

        protected void LOGOUT()
        {
            // clear authentication cookie
            HttpCookie cookie1 = new HttpCookie(FormsAuthentication.FormsCookieName, "");
            cookie1.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(cookie1);

            FormsAuthentication.RedirectToLoginPage();
        }

        protected void setAmount()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SDM_PUPMConnectionString1"].ConnectionString);
            SqlCommand one = new SqlCommand("DashboardTest");
            SqlCommand two = new SqlCommand("DashboardTest");
            SqlCommand three = new SqlCommand("DashboardTest");
            SqlCommand four = new SqlCommand("DashboardTest");
            SqlCommand five = new SqlCommand("DashboardTest");
            SqlCommand six = new SqlCommand("DashboardTest");

            one.CommandType = CommandType.StoredProcedure;
            two.CommandType = CommandType.StoredProcedure;
            three.CommandType = CommandType.StoredProcedure;
            four.CommandType = CommandType.StoredProcedure;
            five.CommandType = CommandType.StoredProcedure;
            six.CommandType = CommandType.StoredProcedure;


            one.Parameters.AddWithValue("@Type", "30");
            two.Parameters.AddWithValue("@Type", "10");
            three.Parameters.AddWithValue("@Type", "25");
            four.Parameters.AddWithValue("@Type", "40");
            five.Parameters.AddWithValue("@Type", "22");
            six.Parameters.AddWithValue("@Type", "50");

            one.Connection = conn;
            two.Connection = conn;
            three.Connection = conn;
            four.Connection = conn;
            five.Connection = conn;
            six.Connection = conn;

            conn.Open();
            int ITSCC = (int)one.ExecuteScalar();
            int PendingBUV = (int)two.ExecuteScalar();
            int Summary = (int)three.ExecuteScalar();
            int ChangeRL = (int)four.ExecuteScalar();
            int BillingIP = (int)five.ExecuteScalar();
            int Billed = (int)six.ExecuteScalar();

            conn.Close();
            itsscAMT.Text = Convert.ToString(ITSCC);
            pBUAMT.Text = Convert.ToString(PendingBUV);
            sumAMT.Text = Convert.ToString(Summary);
            CRLAMT.Text = Convert.ToString(ChangeRL);
            BIPAMT.Text = Convert.ToString(BillingIP); //unbilled Summar
            BilledAMT.Text = Convert.ToString(Billed);
        }
    }
}