using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlogEngine.Web.themes.SoulStops2
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void tbSearch_TextChanged(object sender, EventArgs e)
        {
            if (tbSearch.Text.ToLower().Trim() != "search" && tbSearch.Text.Length > 0)
            {
                Response.Redirect(ResolveUrl("~/search.aspx?q=" + Server.UrlEncode(tbSearch.Text.Trim())));
            }
        }
    }
}