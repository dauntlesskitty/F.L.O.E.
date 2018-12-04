using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.Web.Security;

namespace FLOE.Admin
{
    public partial class Summary : System.Web.UI.Page
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

        protected void OnDataBound(object sender, EventArgs e)
        {
            GridViewRow row = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Normal);
            TableHeaderCell cell = new TableHeaderCell();
            cell.Text = "";
            cell.ColumnSpan = 1;
            row.Controls.Add(cell);

            cell = new TableHeaderCell();
            cell.ColumnSpan = 2;
            cell.Text = "(A) INTERNET";
            row.Controls.Add(cell);

            cell = new TableHeaderCell();
            cell.ColumnSpan = 2;
            cell.Text = "(B) ANTIVIRUS";
            row.Controls.Add(cell);

            cell = new TableHeaderCell();
            cell.ColumnSpan = 2;
            cell.Text = "(C) SMART CLOUD MAIL";
            row.Controls.Add(cell);

            cell = new TableHeaderCell();
            cell.ColumnSpan = 2;
            cell.Text = "(D) HRMS";
            row.Controls.Add(cell);

            cell = new TableHeaderCell();
            cell.ColumnSpan = 2;
            cell.Text = "(E) CITRIX";
            row.Controls.Add(cell);

            cell = new TableHeaderCell();
            cell.ColumnSpan = 2;
            cell.Text = "(F) eDMSKP4";
            row.Controls.Add(cell);

            cell = new TableHeaderCell();
            cell.ColumnSpan = 2;
            cell.Text = "(G) LOTUS TRAVELER";
            row.Controls.Add(cell);

            //cell = new TableHeaderCell();
            //cell.ColumnSpan = 1;
            //cell.Text = "GRAND TOTAL (RM)";
            //row.Controls.Add(cell);

            row.BackColor = ColorTranslator.FromHtml("#337ab7");
            GridView1.HeaderRow.Parent.Controls.AddAt(0, row);
        }

        //protected void calculateSum(object sender, EventArgs e)
        //{
        //    foreach (GridViewRow gr in GridView1.Rows)
        //    {
        //        string cell_1 = GridView1.Rows[gr.RowIndex].Cells[1].Text;
        //        string cell_2 = GridView1.Rows[gr.RowIndex].Cells[3].Text;
        //        string cell_3 = GridView1.Rows[gr.RowIndex].Cells[5].Text;
        //        string cell_4 = GridView1.Rows[gr.RowIndex].Cells[7].Text;
        //        string cell_5 = GridView1.Rows[gr.RowIndex].Cells[9].Text;
        //        string cell_6 = GridView1.Rows[gr.RowIndex].Cells[11].Text;

        //        int grandTotal = Convert.ToInt32(cell_1) + Convert.ToInt32(cell_2);
        //        lblTot.Text = grandTotal.ToString();
        //    }
        //}
    }
}