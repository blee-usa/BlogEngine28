<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="false" Inherits="BlogEngine.Core.Web.Controls.PostViewBase" %>

<script runat="server">

    protected string GetColoredTitle(string title)
    { 
        string[] splitTitle;
        splitTitle = title.Split(' ');

        if (splitTitle.Length == 1)
            return title;
        else
        {
            int iGreen = splitTitle.Length / 3;
            if (iGreen == 0)
                iGreen = 1;
            string result = String.Join(" ", splitTitle, 0, splitTitle.Length - iGreen);
            result += @" <span class=""green"">" + String.Join(" ", splitTitle, splitTitle.Length - iGreen, iGreen) + "</span>";

            return result;
        }
    
    }

</script>


<div id="post-35" class="post hentry cf">

	<h2>
		<span class="post-format"></span>
		<a href="<%=Post.RelativeLink %>" title="<%=Post.Title%>" rel="bookmark"><%=GetColoredTitle(Post.Title)%></a>
		
	</h2>

	<div class="thumb-shadow"><div class="post-thumb"><a href="http://localhost:2471/?p=35"><img src="http://localhost:2471/wp-content/uploads/2012/06/Lighthouse-620x 180-1.jpg" width="620" height=" 180" alt="Alphabet of Thanks: "M"ake "M"emories"/></a></div></div>
	
	<div class="post-bodycopy cf">
	
		<div class="post-date">		
			<p class="post-month"><%=Post.DateCreated.ToString("MMM")%></p>
			<p class="post-day"><%=Post.DateCreated.ToString("dd")%></p>
			<p class="post-year"><%=Post.DateCreated.ToString("yyyy")%></p>				
		</div>

		<%=Post.Content.Trim() %>
		
	</div>

	<div class="post-footer">
		<a class="post-readmore" href="<%=Post.RelativeLink %>" title="<%=Post.Title%>">
		read more &rarr;</a>
		<p class="post-categories"><%=CategoryLinks(" | ")%></p>

		
	</div>
	
</div>
