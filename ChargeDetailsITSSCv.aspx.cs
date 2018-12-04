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
    public partial class ChargeDetailsITSSCv : System.Web.UI.Page
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

        protected void LOGOUT()
        {
            HttpCookie cookie1 = new HttpCookie(FormsAuthentication.FormsCookieName, "");
            cookie1.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(cookie1);

            FormsAuthentication.RedirectToLoginPage();
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

        protected void updateInputsinTable(int ID, string Justification, string Remarks, string MfoCompany_Bill_To, SqlConnection con)
        {
            using (SqlCommand cmd = new SqlCommand("PUPM_Update_CompanytoBill&Justification&Remarks", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@input", ID);
                cmd.Parameters.AddWithValue("@Justification", Justification);
                cmd.Parameters.AddWithValue("@Remarks", Remarks);
                cmd.Parameters.AddWithValue("@MfoCompany_Bill_To", MfoCompany_Bill_To);
                //cmd.Parameters.AddWithValue("@MfoCompany_Bill_To", MfoCompany_Bill_To);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        protected void btnProceed_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox chkRow = (CheckBox)row.FindControl("CheckID");
                if (chkRow.Checked)
                {
                    try
                    {
                        var ID = row.FindControl("ID") as Label; //ID
                        string sID = ID.Text;
                        int IDD = Convert.ToInt32(sID);

                        DropDownList status = (DropDownList)row.FindControl("status"); //Status
                        string ss = status.SelectedItem.Value;
                        Response.Write(IDD + ss);

                        var r = row.FindControl("Remarks") as TextBox; //Remarks
                        string remarks = r.Text;
                        Response.Write(remarks);

                        var just = row.FindControl("Justification") as TextBox; //Justification
                        string justification = just.Text;
                        Response.Write(justification);

                        DropDownList company = row.FindControl("ddl1") as DropDownList; //Company
                        var ddl = row.FindControl("ddl1") as DropDownList;
                        string comp = ddl.SelectedValue;
                        Response.Write(comp);

                        CheckBox C = (CheckBox)row.FindControl("IDCharged");

                        string selectedID = null;
                        selectedID = selectedID + "," + sID;

                        if (ss.Equals("Approve"))
                        {
                            Response.Write(" Approve");
                            Response.Write(" GenerateEmail" + IDD + "<br>");
                            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SDM_PUPMConnectionString1"].ConnectionString))
                            {
                                updateInputsinTable(IDD, justification, remarks, comp, con);
                                using (SqlCommand cmd = new SqlCommand("PUPM_Update_Status", con))
                                {
                                    cmd.CommandType = CommandType.StoredProcedure;
                                    cmd.Parameters.AddWithValue("@ID", IDD);
                                    cmd.Parameters.AddWithValue("@MfoStatus_IDQ1Q2", "20");
                                    con.Open();
                                    cmd.ExecuteNonQuery();
                                    con.Close();
                                }
                                updateHistoryLog(IDD, "APPROVE", "APPROVED BY SDM", con); //Checkthis

                                //using (SqlCommand cmd = new SqlCommand("PUPM_Email_Generator", con))
                                //{
                                //    cmd.CommandType = CommandType.StoredProcedure;
                                //    cmd.Parameters.AddWithValue("@Type", "60");
                                //    cmd.Parameters.AddWithValue("@ItemID", selectedID);
                                //    con.Open();
                                //    cmd.ExecuteNonQuery();
                                //    con.Close();
                                //}
                            }
                            //("Your have succesfully approve the selected record(s)!", 300, 180, "Action Result", null);

                        }
                        if (ss.Equals("Reject"))
                        {
                            int isEmptycount = 0;

                            Response.Write("Rejected");
                            Response.Write("GenerateEmail" + IDD + "<br>");

                            if (string.IsNullOrEmpty(r.Text))
                            {
                                isEmptycount = isEmptycount + 1;
                                Response.Write("Please provide the reason to reject the record(s) in the remarks!" + "<br>");
                                break;
                            }
                            if (isEmptycount == 0)
                            {
                                Response.Write("Rejecting");

                                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SDM_PUPMConnectionString1"].ConnectionString))
                                {
                                    updateInputsinTable(IDD, justification, remarks, comp, con);
                                    using (SqlCommand cmd = new SqlCommand("PUPM_Update_Status", con))
                                    {
                                        cmd.CommandType = CommandType.StoredProcedure;
                                        cmd.Parameters.AddWithValue("@ID", IDD);
                                        cmd.Parameters.AddWithValue("@MfoStatus_IDQ1Q2", "40");
                                        con.Open();
                                        cmd.ExecuteNonQuery();
                                        con.Close();
                                    }
                                    updateHistoryLog(IDD, "REJECT", "ID REJECTED BY SDM", con);//Checkthis
                                    //using (SqlCommand cmd = new SqlCommand("PUPM_Email_Generator", con))
                                    //{
                                    //    cmd.CommandType = CommandType.StoredProcedure;
                                    //    cmd.Parameters.AddWithValue("@Type", "30");
                                    //    cmd.Parameters.AddWithValue("@ItemID", selectedID);
                                    //    con.Open();
                                    //    cmd.ExecuteNonQuery();
                                    //    con.Close();
                                    //}
                                }
                                //("Your have rejected the selected record(s)!", 300, 180, "Action Result", null);
                            }
                        }
                        if (C.Checked)
                        {
                            Response.Write("Checked");
                            //Not sure on Function
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

    }
}