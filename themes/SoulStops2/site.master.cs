using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlogEngine.Web.themes.Indigo
{
    public partial class site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*
            #region recommendations
            String csname1 = "recommnedations";
            Type cstype = this.GetType();

            // Get a ClientScriptManager reference from the Page class.
            ClientScriptManager cs = Page.ClientScript;

            // Check to see if the startup script is already registered.
            if (!cs.IsStartupScriptRegistered(cstype, csname1))
            {
                StringBuilder cstext1 = new StringBuilder();

                string url = ResolveUrl("~/page/recommendations.aspx");

                cstext1.Append("<script type=text/javascript>");
                cstext1.Append("$(document).ready(function () {");
                cstext1.Append("$('#divbooks').load('" + url + " #books', '', function (response, status, xhr) {");
                //cstext1.Append("alert('" + url + "');");
                //cstext1.Append("alert(status);");
                cstext1.Append("if (status == 'error') {");
                cstext1.Append(string.Format(@" var msg = ""Sorry but there was an error: "";"));
                cstext1.Append(string.Format(@"  $("".content"").html(msg + xhr.status + "" "" + xhr.statusText);"));
                cstext1.Append("}");
                cstext1.Append("});");
                cstext1.Append("});");

            
             
                 $(document).ready(function () {
                $('#test').load('<%=ResolveUrl("~/pages/recommendations.aspx") %> #books', '', function (response, status, xhr) {
                    if (status == 'error') {
                        var msg = "Sorry but there was an error: ";
                        $(".content").html(msg + xhr.status + " " + xhr.statusText);
                    }
                });
            });
             


                cstext1.Append("</script>");

                cs.RegisterStartupScript(cstype, csname1, cstext1.ToString());
            }
            #endregion
             * */

            if (!IsPostBack)
            {
                if (Request.QueryString["nocount"] != null)
                {
                    HttpCookie c = new HttpCookie("nocount");
                    c.Expires = DateTime.Now.AddDays(3650);
                    c.Value = "1";
                    Response.Cookies.Add(c);
                }
            }



            if (Page.User.Identity.IsAuthenticated || Request.Cookies["nocount"] != null)
            {
                phGA.Visible = false;
            }

        }

        protected string GetColoredHeading(string title)
        {
            string[] splitTitle;
            splitTitle = title.Split(' ');

            if (splitTitle.Length == 1)
                return title;
            else
            {
                string result = splitTitle[0];
                int iCounter = 0;
                for (int i = 1; i < splitTitle.Length; i++)
                {
                    iCounter++;
                    switch (iCounter)
                    {
                        case 1:
                            result += string.Format(@"<span class=""green"">{0}</span>", splitTitle[i]);
                            break;
                        case 3:
                            result += string.Format(@"<span class=""gray"">{0}</span>", splitTitle[i]);
                            iCounter = 0;
                            break;
                        default:
                            result += splitTitle[i];
                            break;
                    }
                }

                return result;
            }

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