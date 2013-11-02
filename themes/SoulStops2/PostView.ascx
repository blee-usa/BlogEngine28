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


         
            <div id="share-wrapper" class="rounded cf">
                 <h4 style="float: left; margin: 10px">Share this post:</h4>
        <ul class="share-inner-wrp">
            <!-- Facebook -->
            <li class="facebook button-wrap"><a href="#" style="color: transparent;">share</a></li>

            <!-- Twitter -->
            <li class="twitter button-wrap"><a href="#">share</a></li>

            <!-- Digg -->
            <li class="digg button-wrap"><a href="#">share</a></li>

            <!-- Stumbleupon -->
            <li class="stumbleupon button-wrap"><a href="#">share</a></li>

            <!-- Delicious -->
            <li class="delicious button-wrap"><a href="#">share</a></li>

            <!-- Google -->
            <li class="google button-wrap"><a href="#">share</a></li>

            <!-- Email -->
            <li class="email button-wrap"><a href="#">share</a></li>
        </ul>
    </div>


</div>  

