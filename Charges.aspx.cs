using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FLOE.Admin
{
    public partial class Charges : System.Web.UI.Page
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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (e.Exception != null)
            //{
            //    e.ExceptionHandled = true;
            //}
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
        }

        protected void Search_ButtonClick(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "1")
            {
                Panel1.Visible = true;
            }
        }
    }
}