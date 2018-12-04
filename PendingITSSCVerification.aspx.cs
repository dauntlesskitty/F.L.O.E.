using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FLOE.Admin
{
    public partial class PendingITSSCVerification : System.Web.UI.Page
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

            row.BackColor = ColorTranslator.FromHtml("#f0ad4e");
            GridView1.HeaderRow.Parent.Controls.AddAt(0, row);
        }
    }
}