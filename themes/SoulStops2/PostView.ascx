<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="false" Inherits="BlogEngine.Core.Web.Controls.PostViewBase" %>

<div class="post cf hentry">

			<h2>
                <span class="post-format"></span>
				<a rel="bookmark" href="<%=Post.RelativeLink %>" title="<%=Post.Title%>"><%=Post.Title%></a>
			</h2>

			<div class="post-footer">
                <%=Post.DateCreated.ToString("dd MMM yyyy")%>&nbsp;:<%=CategoryLinks("|")%>
			</div>

			<div class="post-bodycopy cf">
                <%=Post.Content.Trim() %>
			</div>
</div>  

