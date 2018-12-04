using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FLOE.Admin
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        string userName = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                LOGOUT();
            }
            else
            {
                userName = Session["user"].ToString();
                profile.Text = userName;
            }
        }

        protected void LOGOUT()
        {
            Session["user"] = null;
            Session.Clear();
            Session.Abandon();

            // clear authentication cookie
            HttpCookie cookie1 = new HttpCookie(FormsAuthentication.FormsCookieName, "");
            cookie1.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(cookie1);
            SessionStateSection sessionStateSection = (SessionStateSection)WebConfigurationManager.GetSection("system.web/sessionState");
            HttpContext.Current.Request.Cookies.AllKeys.ToList().ForEach‌​(s => HttpContext.Current.Request.Cookies[s].Expires = DateTime.Now.AddDays(-1));

            Response.Redirect("~/LogOut.aspx");
        }
    }
}