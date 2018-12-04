using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
//using Excel = Microsoft.Office.Interop.Excel;

namespace FLOE.Admin
{
    public partial class ChargeDetailsBilled : System.Web.UI.Page
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

        //protected void btnGenerateReport_Click(object sender, EventArgs e)
        //{
            //string batchNo = RadDropDownList1.SelectedValue;
            //sqltoExcel(batchNo);

            /*string idString = string.Empty;

            foreach (GridDataItem item in RadGrid7.Items)
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PUPMconnection"].ConnectionString))
                {
                    idString = item.GetDataKeyValue("ID").ToString();
                    int ID = Convert.ToInt32(idString);
                    using (SqlCommand cmd = new SqlCommand("PUPM_Insert_RefNobyVerificationFlow", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@input", ID);
                        cmd.Parameters.AddWithValue("@Type", "Billed");
                        cmd.Parameters.AddWithValue("@Action", "Billed & Generated Report-"+batchNo);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }*/
        //}

        //protected void sqltoExcel(string batchNo)
        //{
        //    Microsoft.Office.Interop.Excel.Application excel = new Microsoft.Office.Interop.Excel.Application();
        //    Excel.Workbook workbook = excel.Application.Workbooks.Add(true);

        //    try
        //    {
        //        object missing = System.Reflection.Missing.Value;
        //        DataSet ds = new DataSet("All Tables");
        //        string file = batchNo + ".xlsx";
        //        var destination = Server.MapPath("~/BatchReport/") + file;
        //        string[] serviceNames = new string[7];

        //        serviceNames[0] = "Anti-Virus";
        //        serviceNames[1] = "eDMS-KP4";
        //        serviceNames[2] = "Lotus Traveler";
        //        //serviceNames[3] = "Blackberry";
        //        serviceNames[3] = "HRMS";
        //        serviceNames[4] = "Citrix";
        //        serviceNames[5] = "Internet";
        //        serviceNames[6] = "SmartCloud Mail";

        //        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PUPMconnection"].ConnectionString))
        //        {
        //            for (int i = 0; i < 7; i++)
        //            {
        //                using (SqlCommand cmd = new SqlCommand("PUPM_Select_BatchNo_Excel", con))
        //                {
        //                    cmd.CommandType = CommandType.StoredProcedure;
        //                    cmd.Parameters.AddWithValue("@batch_no", batchNo);
        //                    cmd.Parameters.AddWithValue("@service", serviceNames[i]);
        //                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
        //                    {
        //                        DataTable dt = ds.Tables.Add(serviceNames[i]);
        //                        con.Open();
        //                        da.Fill(dt);
        //                        con.Close();
        //                    }
        //                }
        //            }

        //            using (SqlCommand cmd = new SqlCommand("PUPM_Select_BatchNo_Excel_Summary", con))
        //            {
        //                cmd.CommandType = CommandType.StoredProcedure;
        //                cmd.Parameters.AddWithValue("@batch_no", batchNo);
        //                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
        //                {
        //                    using (DataTable dt = ds.Tables.Add("Summary"))
        //                    {
        //                        int numberOfColumns = dt.Columns.Count;
        //                        int increment = 1;
        //                        con.Open();
        //                        da.Fill(dt);
        //                        con.Close();

        //                        foreach (DataRow dr in dt.Rows)
        //                        {
        //                            for (int i = 1; i < numberOfColumns; i++)
        //                            {
        //                                cmd.Parameters.AddWithValue("@BUPIC_Name ", Session["user"].ToString());
        //                                Object cellValue = dt.Rows[increment][i];
        //                                if (cellValue.ToString() == "0" || cellValue.ToString() == "0.00")
        //                                {
        //                                    dt.Rows[increment][i] = "-";
        //                                }
        //                                LblService.Text = cellValue.ToString();
        //                            }
        //                            increment++;
        //                        }

        //                    }
        //                    //ExcelLibrary.DataSetHelper.CreateWorkbook(@"C:\Users\joshuanyk\Desktop\" + batchNo +".xls", ds);
        //                }
        //            }

        //            foreach (System.Data.DataTable dt in ds.Tables)
        //            {
        //                int i = 1;
        //                addTableSheet(ref workbook, ref excel, dt, true, i);
        //                i++;
        //            }
        //            excel.DisplayAlerts = false;
        //            workbook.SaveAs(destination, Microsoft.Office.Interop.Excel.XlFileFormat.xlOpenXMLWorkbook, missing, missing, false, false, Excel.XlSaveAsAccessMode.xlNoChange, Excel.XlSaveConflictResolution.xlUserResolution, true, missing, missing, missing);
        //            Excel.Worksheet worksheet = (Excel.Worksheet)excel.ActiveSheet;
        //            worksheet.Activate();
        //            workbook.Close();
        //            excel.Quit();
        //            downloadExcelFile(destination, file);
        //        }
        //    }
        //    catch (Exception)
        //    {
        //        workbook.Close();
        //        excel.Quit();
        //    }
        //}

        //public void downloadExcelFile(string destination, string fileName)
        //{
        //    FileInfo fileInfo = new FileInfo(destination);
        //    if (fileInfo.Exists)
        //    {
        //        System.Web.HttpResponse response = System.Web.HttpContext.Current.Response;
        //        response.ClearContent();
        //        response.Clear();
        //        response.ContentType = "text/plain";
        //        response.AddHeader("Content-Disposition", "attachment; filename=" + fileName + ";");
        //        response.TransmitFile(destination);
        //        response.Flush();
        //        response.End();
        //    }
        //}

        //public void addTableSheet(ref Excel.Workbook wb, ref Microsoft.Office.Interop.Excel.Application excel, System.Data.DataTable dt, bool _IsHeaderIncluded, int i)
        //{
        //    Excel.Worksheet ws = (Excel.Worksheet)excel.Worksheets.get_Item(1);

        //    //Rename the first/default sheet name
        //    if (dt.TableName.ToString().Trim() != string.Empty)
        //    {

        //        if (ws.Name.ToLower() != "sheet1")
        //        {
        //            ws = (Excel.Worksheet)wb.Worksheets.Add();
        //        }
        //        ws.Name = dt.TableName.ToString();
        //    }


        //    int iCol = 0;
        //    // Add column headings...
        //    if (_IsHeaderIncluded == true)
        //    {
        //        foreach (DataColumn c in dt.Columns)
        //        {
        //            iCol++;
        //            excel.Cells[1, iCol] = c.ColumnName;
        //            if (dt.TableName == "Summary")
        //            {
        //                //Total Sum
        //                ws.Cells[2, 16] = "=SUM(C2+E2+G2+I2+K2+M2+O2)";
        //                ws.Range["P2", "P2"].Interior.Color = Excel.XlRgbColor.rgbPurple;
        //                ws.Range["A2", "P2"].Font.Color = Excel.XlRgbColor.rgbWhite;

        //                Excel.Range cell = ws.Range["A1", "P2"];
        //                Excel.Borders border = cell.Borders;
        //                border.LineStyle = Excel.XlLineStyle.xlContinuous;
        //                border.Weight = 2d;

        //                border.LineStyle = Excel.XlLineStyle.xlContinuous;
        //                border.Weight = 2d;

        //                //Colors
        //                ws.Range["A1", "O1"].Interior.Color = Excel.XlRgbColor.rgbDeepSkyBlue;
        //                ws.Range["A2", "A2"].Interior.Color = Excel.XlRgbColor.rgbFireBrick;
        //                ws.Range["B2", "C2"].Interior.Color = Excel.XlRgbColor.rgbDarkOliveGreen;
        //                ws.Range["D2", "E2"].Interior.Color = Excel.XlRgbColor.rgbOrange;
        //                ws.Range["F2", "G2"].Interior.Color = Excel.XlRgbColor.rgbPurple;
        //                ws.Range["H2", "I2"].Interior.Color = Excel.XlRgbColor.rgbGreen;
        //                ws.Range["J2", "K2"].Interior.Color = Excel.XlRgbColor.rgbTeal;
        //                ws.Range["L2", "M2"].Interior.Color = Excel.XlRgbColor.rgbBlue;
        //                ws.Range["N2", "O2"].Interior.Color = Excel.XlRgbColor.rgbDarkBlue;
        //                //ws.Range["P2", "Q2"].Interior.Color = Excel.XlRgbColor.rgbBlueViolet;

        //                ws.Range["A1", "O1"].Font.Color = Excel.XlRgbColor.rgbWhite;
        //                ws.Range["A1", "O1"].Font.Bold = true;

        //                ws.Range["C2", "C2"].NumberFormat = "_(* #,##0.00_);_(* (#,##0.00);_(* -??_);_()";
        //                ws.Range["E2", "E2"].NumberFormat = "_(* #,##0.00_);_(* (#,##0.00);_(* -??_);_()";
        //                ws.Range["G2", "G2"].NumberFormat = "_(* #,##0.00_);_(* (#,##0.00);_(* -??_);_()";
        //                ws.Range["I2", "I2"].NumberFormat = "_(* #,##0.00_);_(* (#,##0.00);_(* -??_);_()";
        //                ws.Range["K2", "K2"].NumberFormat = "_(* #,##0.00_);_(* (#,##0.00);_(* -??_);_()";
        //                ws.Range["M2", "M2"].NumberFormat = "_(* #,##0.00_);_(* (#,##0.00);_(* -??_);_()";
        //                ws.Range["O2", "O2"].NumberFormat = "_(* #,##0.00_);_(* (#,##0.00);_(* -??_);_()";
        //                //ws.Range["Q2", "Q2"].NumberFormat = "_(* #,##0.00_);_(* (#,##0.00);_(* -??_);_()";

        //                ws.Range["B2", "B2"].NumberFormat = "_(* #,##0_);_(* (#,##0);_(* -??_);_()";
        //                ws.Range["D2", "D2"].NumberFormat = "_(* #,##0_);_(* (#,##0);_(* -??_);_()";
        //                ws.Range["F2", "F2"].NumberFormat = "_(* #,##0_);_(* (#,##0);_(* -??_);_()";
        //                ws.Range["H2", "H2"].NumberFormat = "_(* #,##0_);_(* (#,##0);_(* -??_);_()";
        //                ws.Range["J2", "J2"].NumberFormat = "_(* #,##0_);_(* (#,##0);_(* -??_);_()";
        //                ws.Range["L2", "L2"].NumberFormat = "_(* #,##0_);_(* (#,##0);_(* -??_);_()";
        //                ws.Range["N2", "N2"].NumberFormat = "_(* #,##0_);_(* (#,##0);_(* -??_);_()";
        //                //ws.Range["P2", "P2"].NumberFormat = "_(* #,##0_);_(* (#,##0);_(* -??_);_()";

        //                ws.Range["P2", "P2"].NumberFormat = "_(* #,##0.00_);_(* (#,##0.00);_(* -??_);_()";
        //                ws.Range["B2", "P2"].Columns.ColumnWidth = 20;

        //                //Size of Width 
        //                Excel.Range er = ws.get_Range("A:A", System.Type.Missing);
        //                er.WrapText = true;
        //                Excel.Range range = ws.get_Range("A1:O1", System.Type.Missing);
        //                er.Columns.ColumnWidth = 26;
        //                range.HorizontalAlignment = Excel.XlHAlign.xlHAlignCenter;
        //            }
        //            else
        //            {
        //                //Excel.FormatCondition format = ws.Rows.FormatConditions.Add(Excel.XlFormatConditionType.xlExpression, XlFormatConditionOperator.xlEqual, "=MOD(ROW(),2) = 0");
        //                //format.Interior.Color = Excel.XlRgbColor.rgbLightBlue;

        //                //Colors
        //                ws.Range["A1", "G1"].Interior.Color = Excel.XlRgbColor.rgbDeepSkyBlue;
        //                ws.Range["A1", "G1"].Font.Color = Excel.XlRgbColor.rgbWhite;

        //                //Size or Width
        //                Excel.Range AC = ws.get_Range("A:C", System.Type.Missing);
        //                Excel.Range D = ws.get_Range("D:D", System.Type.Missing);
        //                Excel.Range EF = ws.get_Range("E:F", System.Type.Missing);
        //                Excel.Range G = ws.get_Range("G:G", System.Type.Missing);
        //                Excel.Range range = ws.get_Range("A1:G1", System.Type.Missing);
        //                range.HorizontalAlignment = Excel.XlHAlign.xlHAlignCenter;
        //                excel.Columns.ColumnWidth = 10;
        //                AC.Columns.ColumnWidth = 31;
        //                D.Columns.ColumnWidth = 43;
        //                EF.Columns.ColumnWidth = 15;
        //                G.Columns.ColumnWidth = 32;

        //                //Set Filter
        //                Excel.Range firstRow = (Excel.Range)ws.Rows[1];
        //                firstRow.AutoFilter(1, Type.Missing, Excel.XlAutoFilterOperator.xlAnd, Type.Missing, true);
        //            }

        //        }

        //    }

        //    // for each row of data...
        //    int iRow = 0;
        //    foreach (DataRow r in dt.Rows)
        //    {
        //        iRow++;
        //        // add each row's cell data...
        //        iCol = 0;
        //        foreach (DataColumn c in dt.Columns)
        //        {
        //            iCol++;
        //            if (_IsHeaderIncluded == true)
        //            {
        //                excel.Cells[iRow + 1, iCol] = r[c.ColumnName];
        //            }
        //            else
        //            {
        //                excel.Cells[iRow, iCol] = r[c.ColumnName];
        //            }
        //        }
        //        if (r.ToString() == "0.00")
        //        {
        //            r.Equals("-");
        //        }
        //    }
        //}
    }
}