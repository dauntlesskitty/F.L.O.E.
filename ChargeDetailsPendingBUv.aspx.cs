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
    public partial class ChargeDetailsPendingBUv : System.Web.UI.Page
    {
        string userName;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] == null)
                {
                    LOGOUT();
                }
                else
                {
                    userName = Session["user"].ToString();
                }
            }
        }

        protected void LOGOUT()
        {
            HttpCookie cookie1 = new HttpCookie(FormsAuthentication.FormsCookieName, "");
            cookie1.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(cookie1);

            FormsAuthentication.RedirectToLoginPage();
        }

        //BUTTON VERIFY FUNCTION
        protected void btnVerifyFunc(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox chkRow = (CheckBox)row.FindControl("CheckID");
                if (chkRow.Checked)
                {
                    try
                    {
                        var ID = row.FindControl("IDlbl") as Label;
                        string sID = ID.Text;
                        int IDD = Convert.ToInt32(sID);
                        Response.Write(IDD + "<br>"); //TO TEST
                        Response.Write("Selected Record has been successfully sent for verification" + DateTime.Now.ToString() + "<br>");

                        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SDM_PUPMConnectionString1"].ConnectionString))
                        {
                            using (SqlCommand cmd = new SqlCommand("PUPM_Update_Status", con))
                            {
                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.Parameters.AddWithValue("@ID", IDD);
                                cmd.Parameters.AddWithValue("@MfoStatus_IDQ1Q2", "20");
                                con.Open();
                                cmd.ExecuteNonQuery();
                                con.Close();
                            }
                            updateHistoryLog(IDD, "VERIFY", "VERIFIED", con);

                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.ToString());
                    }
                    finally
                    {
                        GridView1.DataBind();
                    }
                }
                else
                {
                    Response.Write("Checkbox not selected" + "<br>");
                }
            }
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

        //BUTTON REQUEST FUNCTION
        protected void btnRequestFunc(object sender, EventArgs e)
        {
            string selectedID = null;
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox chkRow = (CheckBox)row.FindControl("CheckID");
                if (chkRow.Checked)
                {
                    try
                    {
                        var j = row.FindControl("JustifyLbl") as Label;
                        int isEmptycount = 0;

                        if (string.IsNullOrEmpty(j.Text))
                        {
                            isEmptycount = isEmptycount + 1;
                            Response.Write("Please justify the reason to proceed for change!" + "<br>");
                            break;
                        }
                        if (isEmptycount == 0)
                        {
                            var ID = row.FindControl("IDlbl") as Label;
                            string sID = ID.Text;
                            int IDD = Convert.ToInt32(sID);
                            Response.Write(IDD); //TO TEST

                            selectedID = selectedID + "," + sID;

                            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SDM_PUPMConnectionString1"].ConnectionString))
                            {
                                if (chkRow.Checked == true)
                                {
                                    using (SqlCommand cmd = new SqlCommand("PUPM_Update_Status", con))
                                    {
                                        cmd.CommandType = CommandType.StoredProcedure;
                                        cmd.Parameters.AddWithValue("@ID", IDD);
                                        cmd.Parameters.AddWithValue("@MfoStatus_IDQ1Q2", "30");
                                        con.Open();
                                        cmd.ExecuteNonQuery();
                                        con.Close();
                                    }
                                    using (SqlCommand cmd = new SqlCommand("PUPM_Email_Generator", con))
                                    {
                                        cmd.CommandType = CommandType.StoredProcedure;
                                        cmd.Parameters.AddWithValue("@Type", "40");
                                        cmd.Parameters.AddWithValue("@ItemID", selectedID);
                                        con.Open();
                                        cmd.ExecuteNonQuery();
                                        con.Close();
                                    }
                                    updateHistoryLog(IDD, "REQUESTFORCHANGE", "REQUEST FOR CHANGE", con);
                                }
                            }
                        }

                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.ToString());
                    }
                    finally
                    {
                        GridView1.DataBind();
                    }
                }
                else
                {
                    Response.Write("Checkbox not selected" + "<br>");
                }
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }
    }
}