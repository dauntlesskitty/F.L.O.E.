using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Web;
using System.Web.Security;

namespace FLOE.Admin
{
    public partial class Upload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //if (Session["user"] == null)
                //{
                //    LOGOUT();
                //}
            }
        }

        //protected void LOGOUT()
        //{
        //    // clear authentication cookie
        //    HttpCookie cookie1 = new HttpCookie(FormsAuthentication.FormsCookieName, "");
        //    cookie1.Expires = DateTime.Now.AddYears(-1);
        //    Response.Cookies.Add(cookie1);

        //    FormsAuthentication.RedirectToLoginPage();
        //}

        //#region Button
        //protected void import_Click(object sender, EventArgs e)
        //{
        //    string dropdownText = RDDServices.SelectedText;
        //    if (!FileUpload1.HasFile)
        //    {
        //        lblSuccess.Text = "Failed to add to Database! No file provided";
        //        historyLogUpdate("Uploading Records", "FAILED TO ADD TO DATABASE");
        //        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "setTimeout();", true);
        //    }
        //    else
        //    {
        //        try
        //        {
        //            if (dropdownText.Equals("Citrix"))
        //            {
        //                DataTable CitrixTable = CitrixCreateTable();
        //                insertCitrixdatatoDB(CitrixTable);
        //                historyLogUpdate("Uploading Records", "SUCCESSFULLY RECORDED IN THE DATABASE");
        //            }
        //            else
        //            {
        //                DataTable TableForAll = createTable();
        //                insertdatatoDB(TableForAll);
        //                historyLogUpdate("Uploading Records", "SUCCESSFULLY RECORDED IN THE DATABASE");
        //            }
        //            lblSuccess.Text = "Succesfully added to Database!";
        //        }
        //        catch (Exception ex)
        //        {
        //            lblSuccess.Text = "Failed to add to Database!";
        //            historyLogUpdate("Uploading Records", "FAILED TO ADD TO DATABASE");
        //            Debug.WriteLine(ex.ToString());
        //        }
        //        finally
        //        {
        //            lblSuccess.Visible = true;
        //            //ClientScript.RegisterStartupScript(this.GetType(), "", "setTimeout();", true);
        //        }
        //    }
        //}

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    string dropdownText = RDDServicesMonthly.SelectedText;
        //    if (!FileUpload2.HasFile)
        //    {
        //        lblSuccessMonthly.Text = "Failed to add to Database! No file provided";
        //        historyLogUpdate("Uploading Records", "FAILED TO ADD TO DATABASE");
        //        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "setTimeout();", true);
        //    }
        //    else
        //    {
        //        try
        //        {
        //            if (dropdownText.Equals("Citrix"))
        //            {
        //                DataTable CitrixTable = CitrixMonthlyCreateTable();
        //                insertCitrixdatatoMonthlyDB(CitrixTable);
        //                historyLogUpdate("Uploading Records", "SUCCESSFULLY RECORDED MONTHLY RECORDS IN THE DATABASE");
        //            }
        //            else
        //            {
        //                DataTable TableForAll = MonthlycreateTable();
        //                insertdatatoMonthlyDB(TableForAll);
        //                historyLogUpdate("Uploading Records", "SUCCESSFULLY RECORDED MONTHLY RECORDS IN THE DATABASE");
        //            }
        //            lblSuccessMonthly.Text = "Succesfully added to Database!";
        //        }
        //        catch (Exception ex)
        //        {
        //            lblSuccessMonthly.Text = "Failed to add to Database!";
        //            historyLogUpdate("Uploading Records", "FAILED TO ADD MONTHLY RECORDS TO DATABASE");
        //            Debug.WriteLine(ex.ToString());
        //        }
        //        finally
        //        {
        //            lblSuccessMonthly.Visible = true;
        //            //ClientScript.RegisterStartupScript(this.GetType(), "", "setTimeout();", true);
        //        }
        //    }
        //}
        //#endregion

        //#region Log Update
        //protected void historyLogUpdate(string message, string value)
        //{
        //    string services = RDDServices.SelectedText;
        //    string year = RDDYear.SelectedText;
        //    string uploadmessage = message;
        //    string remark = value;

        //    try
        //    {
        //        if (Session["user"] != null || Session["fullname"].ToString() != null)
        //        {
        //            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PUPMconnection"].ConnectionString))
        //            {
        //                using (SqlCommand cmd = new SqlCommand("PUPM_Insert_RefNobyUpload", con))
        //                {
        //                    cmd.CommandType = CommandType.StoredProcedure;
        //                    cmd.Parameters.AddWithValue("@AccountType", services);
        //                    cmd.Parameters.AddWithValue("@Year", year);
        //                    cmd.Parameters.AddWithValue("@Action", uploadmessage);
        //                    cmd.Parameters.AddWithValue("@Remark", remark);
        //                    cmd.Parameters.AddWithValue("@BUPIC_Name ", Session["fullname"].ToString());
        //                    con.Open();
        //                    cmd.ExecuteNonQuery();
        //                    con.Close();
        //                }
        //            }
        //        }
        //    }
        //    catch (Exception)
        //    {

        //    }
        //}
        //#endregion

        //#region YEARLY VERIFICATION (YEARLY)

        //#region Creating Tables 
        //private DataTable createTable()
        //{
        //    int lines = 0;
        //    string filepath = Server.MapPath("~/Files/ExcelFiles") + Path.GetFileName(FileUpload1.PostedFile.FileName);
        //    FileUpload1.SaveAs(filepath);

        //    DataTable dTable = new DataTable();
        //    dTable.Columns.Add("Year", typeof(int));
        //    dTable.Columns.Add("DivMat", typeof(string));
        //    dTable.Columns.Add("PayrollCompany", typeof(string));
        //    dTable.Columns.Add("NameIC", typeof(string));
        //    dTable.Columns.Add("SmartCloudMailID", typeof(string));
        //    dTable.Columns.Add("ShortName", typeof(string));
        //    dTable.Columns.Add("ServiceType", typeof(string));
        //    dTable.Columns.Add("MfoStatus_IDQ1Q2", typeof(string));

        //    String data = File.ReadAllText(filepath);

        //    foreach (string row in data.Split('\n'))
        //    {
        //        if (!string.IsNullOrEmpty(row))
        //        {
        //            dTable.Rows.Add();
        //            int counter = 1;
        //            string serviceTypeString = RDDServices.SelectedText;

        //            string yearyear = RDDYear.SelectedText;
        //            int x = Int32.Parse(yearyear);
        //            dTable.Rows[dTable.Rows.Count - 1][0] = x;
        //            dTable.Rows[dTable.Rows.Count - 1][6] = serviceTypeString;
        //            dTable.Rows[dTable.Rows.Count - 1][7] = "10";

        //            foreach (string cell in row.Split(','))
        //            {
        //                dTable.Rows[dTable.Rows.Count - 1][counter] = cell;
        //                counter++;
        //            }
        //        }
        //        lines++;
        //    }
        //    lblLines.Visible = true;
        //    lblLines.Text = lines - 1 + " records have been added";
        //    return dTable;
        //}

        //private DataTable CitrixCreateTable()
        //{
        //    int lines = 0;
        //    string filepath = Server.MapPath("~/Files/ExcelFiles") + Path.GetFileName(FileUpload1.PostedFile.FileName);
        //    FileUpload1.SaveAs(filepath);

        //    DataTable dTable = new DataTable();
        //    dTable.Columns.Add("Year", typeof(int));
        //    dTable.Columns.Add("DivMat", typeof(string));
        //    dTable.Columns.Add("PayrollCompany", typeof(string));
        //    dTable.Columns.Add("NameIC", typeof(string));
        //    dTable.Columns.Add("SmartCloudMailID", typeof(string));
        //    dTable.Columns.Add("ShortName", typeof(string));
        //    dTable.Columns.Add("ServiceType", typeof(string));
        //    dTable.Columns.Add("CitrixServices", typeof(string));
        //    dTable.Columns.Add("MfoStatus_IDQ1Q2", typeof(string));

        //    String data = File.ReadAllText(filepath);

        //    foreach (string row in data.Split('\n'))
        //    {
        //        if (!string.IsNullOrEmpty(row))
        //        {
        //            dTable.Rows.Add();
        //            int counter = 1;
        //            string serviceTypeString = RDDServices.SelectedText;

        //            string yearyear = RDDYear.SelectedText;
        //            int x = Int32.Parse(yearyear);
        //            dTable.Rows[dTable.Rows.Count - 1][0] = x;
        //            dTable.Rows[dTable.Rows.Count - 1][8] = "10";

        //            foreach (string cell in row.Split(','))
        //            {
        //                if (counter == 6)
        //                {
        //                    dTable.Rows[dTable.Rows.Count - 1][6] = serviceTypeString;
        //                    counter++;
        //                }
        //                else
        //                {
        //                    dTable.Rows[dTable.Rows.Count - 1][counter] = cell;
        //                    counter++;
        //                }
        //            }
        //        }
        //        lines++;
        //    }
        //    lblLines.Visible = true;
        //    lblLines.Text = lines - 1 + " records have been added";
        //    return dTable;
        //}

        //#endregion

        //#region Storing to database
        //private void insertdatatoDB(DataTable dTable)
        //{
        //    string mainConnection = ConfigurationManager.ConnectionStrings["PUPMconnection"].ConnectionString;

        //    using (SqlConnection sqlconn = new SqlConnection(mainConnection))
        //    {
        //        using (SqlBulkCopy sqlbkcpy = new SqlBulkCopy(sqlconn))
        //        {
        //            sqlbkcpy.DestinationTableName = "dbo.PUPM_Tran_Main";
        //            sqlbkcpy.ColumnMappings.Add("Year", "Year");
        //            sqlbkcpy.ColumnMappings.Add("DivMat", "Division_Matrix");
        //            sqlbkcpy.ColumnMappings.Add("PayrollCompany", "Payroll_Company");
        //            sqlbkcpy.ColumnMappings.Add("NameIC", "Name_IC");
        //            sqlbkcpy.ColumnMappings.Add("SmartCloudMailID", "ID_Name");
        //            sqlbkcpy.ColumnMappings.Add("ShortName", "Short_Name");
        //            sqlbkcpy.ColumnMappings.Add("ServiceType", "MfoService_Name");
        //            sqlbkcpy.ColumnMappings.Add("PayrollCompany", "MfoCompany_Bill_To");
        //            sqlbkcpy.ColumnMappings.Add("MfoStatus_IDQ1Q2", "MfoStatus_IDQ1Q2");
        //            sqlconn.Open();
        //            sqlbkcpy.WriteToServer(dTable);
        //            sqlconn.Close();
        //            lblSuccess.Visible = true;
        //        }
        //    }
        //}

        //private void insertCitrixdatatoDB(DataTable dTable)
        //{
        //    string mainConnection = ConfigurationManager.ConnectionStrings["PUPMconnection"].ConnectionString;

        //    using (SqlConnection sqlconn = new SqlConnection(mainConnection))
        //    {
        //        using (SqlBulkCopy sqlbkcpy = new SqlBulkCopy(sqlconn))
        //        {
        //            sqlbkcpy.DestinationTableName = "dbo.PUPM_Tran_Main";
        //            sqlbkcpy.ColumnMappings.Add("Year", "Year");
        //            sqlbkcpy.ColumnMappings.Add("DivMat", "Division_Matrix");
        //            sqlbkcpy.ColumnMappings.Add("PayrollCompany", "Payroll_Company");
        //            sqlbkcpy.ColumnMappings.Add("NameIC", "Name_IC");
        //            sqlbkcpy.ColumnMappings.Add("SmartCloudMailID", "ID_Name");
        //            sqlbkcpy.ColumnMappings.Add("ShortName", "Short_Name");
        //            sqlbkcpy.ColumnMappings.Add("ServiceType", "MfoService_Name");
        //            sqlbkcpy.ColumnMappings.Add("CitrixServices", "Citrix_Services");
        //            sqlbkcpy.ColumnMappings.Add("PayrollCompany", "MfoCompany_Bill_To");
        //            sqlbkcpy.ColumnMappings.Add("MfoStatus_IDQ1Q2", "MfoStatus_IDQ1Q2");
        //            sqlconn.Open();
        //            sqlbkcpy.WriteToServer(dTable);
        //            sqlconn.Close();
        //            lblSuccess.Visible = true;
        //        }
        //    }
        //}
        //#endregion

        //#endregion

        //#region MONTHLY VERIFICATION (MONTHLY)

        //#region Create Table (MONTHLY)
        //private DataTable CitrixMonthlyCreateTable()
        //{
        //    {
        //        int lines = 0;
        //        string filepath = Server.MapPath("~/Files/ExcelFiles") + Path.GetFileName(FileUpload2.PostedFile.FileName);
        //        FileUpload2.SaveAs(filepath);


        //        DataTable dTable = new DataTable();
        //        dTable.Columns.Add("Year", typeof(int));
        //        dTable.Columns.Add("DivMat", typeof(string));
        //        dTable.Columns.Add("PayrollCompany", typeof(string));
        //        dTable.Columns.Add("NameIC", typeof(string));
        //        dTable.Columns.Add("SmartCloudMailID", typeof(string));
        //        dTable.Columns.Add("ShortName", typeof(string));
        //        dTable.Columns.Add("ServiceType", typeof(string));
        //        dTable.Columns.Add("CitrixServices", typeof(string));
        //        dTable.Columns.Add("MfoStatus_IDQ1Q2", typeof(string));
        //        dTable.Columns.Add("Month", typeof(string));

        //        String data = File.ReadAllText(filepath);

        //        foreach (string row in data.Split('\n'))
        //        {
        //            if (!string.IsNullOrEmpty(row))
        //            {
        //                dTable.Rows.Add();
        //                int counter = 1;
        //                string serviceTypeString = RDDServicesMonthly.SelectedText;
        //                string month = RDDMonthly.SelectedText;
        //                string yearyear = RDDYearlyMonthly.SelectedText;

        //                int x = Int32.Parse(yearyear);

        //                foreach (string cell in row.Split(','))
        //                {
        //                    if (counter == 6)
        //                    {
        //                        dTable.Rows[dTable.Rows.Count - 1][6] = serviceTypeString;
        //                        counter++;
        //                    }
        //                    else
        //                    {
        //                        dTable.Rows[dTable.Rows.Count - 1][0] = x;
        //                        dTable.Rows[dTable.Rows.Count - 1][counter] = cell;
        //                        dTable.Rows[dTable.Rows.Count - 1][8] = "10";
        //                        dTable.Rows[dTable.Rows.Count - 1][9] = month;
        //                        counter++;
        //                    }
        //                }
        //            }
        //            lines++;
        //        }
        //        lblLinesMonthly.Visible = true;
        //        lblLinesMonthly.Text = lines - 1 + " records have been added";
        //        return dTable;
        //    }
        //}
        //private DataTable MonthlycreateTable()
        //{
        //    int lines = 0;
        //    string filepath = Server.MapPath("~/Files/ExcelFiles") + Path.GetFileName(FileUpload2.PostedFile.FileName);
        //    FileUpload2.SaveAs(filepath);

        //    DataTable dTable = new DataTable();
        //    dTable.Columns.Add("Year", typeof(int));
        //    dTable.Columns.Add("DivMat", typeof(string));
        //    dTable.Columns.Add("PayrollCompany", typeof(string));
        //    dTable.Columns.Add("NameIC", typeof(string));
        //    dTable.Columns.Add("SmartCloudMailID", typeof(string));
        //    dTable.Columns.Add("ShortName", typeof(string));
        //    dTable.Columns.Add("ServiceType", typeof(string));
        //    dTable.Columns.Add("MfoStatus_IDQ1Q2", typeof(string));
        //    dTable.Columns.Add("Month", typeof(string));

        //    String data = File.ReadAllText(filepath);

        //    foreach (string row in data.Split('\n'))
        //    {
        //        if (!string.IsNullOrEmpty(row))
        //        {
        //            dTable.Rows.Add();
        //            int counter = 1;
        //            string serviceTypeString = RDDServicesMonthly.SelectedText;
        //            string month = RDDMonthly.SelectedText;
        //            string yearyear = RDDYearlyMonthly.SelectedText;

        //            int x = Int32.Parse(yearyear);
        //            dTable.Rows[dTable.Rows.Count - 1][0] = x;
        //            dTable.Rows[dTable.Rows.Count - 1][6] = serviceTypeString;
        //            dTable.Rows[dTable.Rows.Count - 1][7] = "10";
        //            dTable.Rows[dTable.Rows.Count - 1][8] = month;

        //            foreach (string cell in row.Split(','))
        //            {
        //                dTable.Rows[dTable.Rows.Count - 1][counter] = cell;
        //                counter++;
        //            }
        //        }
        //        lines++;
        //    }
        //    lblLinesMonthly.Visible = true;
        //    lblLinesMonthly.Text = lines - 1 + " records have been added";
        //    return dTable;
        //}
        //#endregion

        //#region Storing to Database (MONTHLY)
        //private void insertdatatoMonthlyDB(DataTable dTable)
        //{
        //    string mainConnection = ConfigurationManager.ConnectionStrings["PUPMconnection"].ConnectionString;

        //    using (SqlConnection sqlconn = new SqlConnection(mainConnection))
        //    {
        //        using (SqlBulkCopy sqlbkcpy = new SqlBulkCopy(sqlconn))
        //        {
        //            sqlbkcpy.DestinationTableName = "dbo.PUPM_Tran_Monthly";
        //            sqlbkcpy.ColumnMappings.Add("Year", "Year");
        //            sqlbkcpy.ColumnMappings.Add("DivMat", "Division_Matrix");
        //            sqlbkcpy.ColumnMappings.Add("PayrollCompany", "Payroll_Company");
        //            sqlbkcpy.ColumnMappings.Add("NameIC", "Name_IC");
        //            sqlbkcpy.ColumnMappings.Add("SmartCloudMailID", "ID_Name");
        //            sqlbkcpy.ColumnMappings.Add("ShortName", "Short_Name");
        //            sqlbkcpy.ColumnMappings.Add("ServiceType", "MfoService_Name");
        //            sqlbkcpy.ColumnMappings.Add("PayrollCompany", "MfoCompany_Bill_To");
        //            sqlbkcpy.ColumnMappings.Add("MfoStatus_IDQ1Q2", "MfoStatus_IDQ1Q2");
        //            sqlbkcpy.ColumnMappings.Add("Month", "Month");
        //            sqlconn.Open();
        //            sqlbkcpy.WriteToServer(dTable);
        //            sqlconn.Close();
        //            lblSuccessMonthly.Visible = true;
        //        }
        //    }
        //}

        //private void insertCitrixdatatoMonthlyDB(DataTable dTable)
        //{
        //    string mainConnection = ConfigurationManager.ConnectionStrings["PUPMconnection"].ConnectionString;

        //    using (SqlConnection sqlconn = new SqlConnection(mainConnection))
        //    {
        //        using (SqlBulkCopy sqlbkcpy = new SqlBulkCopy(sqlconn))
        //        {
        //            sqlbkcpy.DestinationTableName = "dbo.PUPM_Tran_Monthly";
        //            sqlbkcpy.ColumnMappings.Add("Year", "Year");
        //            sqlbkcpy.ColumnMappings.Add("DivMat", "Division_Matrix");
        //            sqlbkcpy.ColumnMappings.Add("PayrollCompany", "Payroll_Company");
        //            sqlbkcpy.ColumnMappings.Add("NameIC", "Name_IC");
        //            sqlbkcpy.ColumnMappings.Add("SmartCloudMailID", "ID_Name");
        //            sqlbkcpy.ColumnMappings.Add("ShortName", "Short_Name");
        //            sqlbkcpy.ColumnMappings.Add("ServiceType", "MfoService_Name");
        //            sqlbkcpy.ColumnMappings.Add("CitrixServices", "Citrix_Services");
        //            sqlbkcpy.ColumnMappings.Add("PayrollCompany", "MfoCompany_Bill_To");
        //            sqlbkcpy.ColumnMappings.Add("MfoStatus_IDQ1Q2", "MfoStatus_IDQ1Q2");
        //            sqlbkcpy.ColumnMappings.Add("Month", "Month");

        //            sqlconn.Open();
        //            sqlbkcpy.WriteToServer(dTable);
        //            sqlconn.Close();
        //            lblSuccessMonthly.Visible = true;
        //        }
        //    }
        //}
        //#endregion

        //#endregion
    }
}