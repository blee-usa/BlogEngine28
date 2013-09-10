using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BlogEngine.Core;
using BlogEngine.Core.Web.Controls;

namespace BlogEngine.Web.Custom
{
    public partial class PostView : PostViewBase
    {
        private const int PostExcerptLength = 500;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string GetFirstImageSource(Post post)
        {
            return Helpers.FetchFirstImageSource(post.Content);
        }
    }
}