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
using System.Diagnostics;

namespace FLOE.Admin
{
    public partial class ChargeDetailsBilling : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] == null)
                {
                    LOGOUT();
                }
            }
        }

        protected void btn_Process(object sender, EventArgs e)
        {
            try
            {
                string batchValue;

                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SDM_PUPMConnectionString1"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("PUPM_Select_BatchNo", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        con.Open();
                        batchValue = (string)cmd.ExecuteScalar();
                        con.Close();
                    }
                }

                foreach (GridViewRow row in GridView1.Rows)
                {
                    var ID = row.FindControl("ID") as Label; //ID
                    string sID = ID.Text;
                    int IDD = Convert.ToInt32(sID);

                    var Comp = row.FindControl("Company") as Label; //Company
                    string Payroll_Company = Comp.Text;
                    Response.Write(Payroll_Company);

                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SDM_PUPMConnectionString1"].ConnectionString))
                    {
                        using (SqlCommand cmd = new SqlCommand("PUPM_Update_BatchNumber", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@ID", IDD);
                            cmd.Parameters.AddWithValue("@Batch_No", batchValue + "-" + Payroll_Company);
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }

                        using (SqlCommand cmd2 = new SqlCommand("PUPM_Update_Status", con))
                        {
                            cmd2.CommandType = CommandType.StoredProcedure;
                            cmd2.Parameters.AddWithValue("@ID", IDD);
                            cmd2.Parameters.AddWithValue("@MfoStatus_IDQ1Q2", "50");
                            con.Open();
                            cmd2.ExecuteNonQuery();
                            con.Close();
                        }
                        updateHistoryLog(IDD, "UNBILL", "PROCESS TO BILL", con);
                    }
                }
                Response.Write("You have succesfully process all for the selected record(s)!");
                //RadWindowManager9.RadAlert("You have succesfully process all for the selected record(s)!", 300, 180, "Action Result", null);
            }
            catch (Exception ex)
            {
                var st = new StackTrace(ex, true);
                var frame = st.GetFrame(0);
                var line = frame.GetFileLineNumber();
            }
            finally
            {
                GridView1.DataBind();
            }

        }

        protected string getDate()
        {
            string date = DateTime.Now.ToString("ddMMyyyy");
            return date;
        }


        protected void updateHistoryLog(int ID, string type, string action, SqlConnection con)
        {
            if (Session["user"] != null || Session["fullname"].ToString() != null)
            {
                using (SqlCommand cmd = new SqlCommand("PUPM_Insert_RefNobyVerificationFlow", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@input", ID);
                    cmd.Parameters.AddWithValue("@Type", type);
                    cmd.Parameters.AddWithValue("@Action", action);
                    cmd.Parameters.AddWithValue("@BUPIC_Name ", Session["fullname"].ToString());
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }

        protected void LOGOUT()
        {
            FormsAuthentication.SignOut();
            Session.Clear();
            Session.Abandon();

            // clear authentication cookie
            HttpCookie cookie1 = new HttpCookie(FormsAuthentication.FormsCookieName, "");
            cookie1.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(cookie1);

            FormsAuthentication.RedirectToLoginPage();
        }

        protected void setCurrentYear()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["PUPMconnection"].ConnectionString);
            SqlCommand command = new SqlCommand("PUPM_Select_Summary_VerificationYear");
            command.CommandType = CommandType.StoredProcedure;
            command.Connection = conn;
            conn.Open();
            string yearyear = (string)command.ExecuteScalar();
            conn.Close();
            //LblYear.Text = "Year: " + yearyear;
        }
    }
}