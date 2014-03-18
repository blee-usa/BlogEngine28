<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="false" Inherits="BlogEngine.Core.Web.Controls.PostViewBase" %>

<div class="post cf hentry">
			<h2>
                <span class="post-format"></span>
				<a rel="bookmark" href="<%=Post.RelativeLink %>" title="<%=Post.Title%>"><%=Post.Title%></a>
			</h2>

			<div class="post-footer">
                <%=Post.DateCreated.ToString("dd MMM yyyy")%>&nbsp;:<%=CategoryLinks("|")%>  
                
                <% if (Page.User.Identity.IsAuthenticated)
                       { %> 
                  [Admin: <%=AdminLinks %>]
                    <%} %>            
			</div>
    
			<div class="post-bodycopy cf">
                <%=Post.Content.Trim() %>
			</div>
         
            <div id="share-wrapper" class="rounded cf">
                 <h4 style="float: left; margin: 10px">Share this post:</h4>
        <ul class="share-inner-wrp">
            <!-- Facebook -->
            <li class="facebook button-wrap"><a href="#" style="color: transparent;" title="Facebook">share</a></li>

            <!-- Twitter -->
            <li class="twitter button-wrap"><a href="#" title="Twitter">share</a></li>
            
            <!-- Google -->
            <li class="google button-wrap" title="Google+"><a href="#">share</a></li>

            <!-- Digg -->
            <li class="digg button-wrap"><a href="#" title="Digg">share</a></li>

            <!-- Stumbleupon -->
            <li class="stumbleupon button-wrap" title="Stumbleupon"><a href="#">share</a></li>

            <!-- Delicious -->
            <li class="delicious button-wrap" title="Delicious"><a href="#">share</a></li>

            <!-- Email -->
            <li class="email button-wrap" title="Email"><a href="#">share</a></li>
        </ul>
    </div>
    <br/>
    <div class="cf">
        <a class="button" href="http://eepurl.com/H6rMX" style="float: left; width: 150px; margin-right: 5px; margin-top: 5px">Subscribe Here</a>
        <p style="margin: 0">           
        Sign up to receive new posts about finding the God-beauty and joy in the daily mess of life.
        </p>
    </div>


</div>  

