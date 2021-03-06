﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="page" Codebehind="page.aspx.cs" %>
<%@ Import Namespace="BlogEngine.Core"%>

<asp:content id="Content3" contentplaceholderid="cphBreadcrumbs" runat="Server">
    
                            <nav id="breadcrumbs1" class="breadcrumbs lw">
                
                
                <ol>
                    <li class="bc-home"><a href="/">&nbsp;</a></li>
                    <li><span class="bc-current"><%=h1Title.InnerText%></span></li>
                </ol>
            </nav>

</asp:content>


<asp:content id="Content1" contentplaceholderid="cphBody" runat="Server">
  <div id="page" class="hentry">
    <h1 runat="server" id="h1Title" class="title" />
    <div runat="server" id="divText" />    
    <%=AdminLinks %>
    
    <% if (BlogSettings.Instance.ModerationType == BlogSettings.Moderation.Disqus && BlogSettings.Instance.DisqusAddCommentsToPages)
       { %>
    <div id="disqus_box" runat="server">
    <div id="disqus_thread"></div>
    <script type="text/javascript">
        var disqus_url = '<%= PermaLink %>';
        var disqus_developer = '<%= BlogSettings.Instance.DisqusDevMode ? 1 : 0 %>';
        (function() {
            var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
            dsq.src = 'http://<%=BlogSettings.Instance.DisqusWebsiteName %>.disqus.com/embed.js';
            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
        })();
    </script>
    <noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript=<%=BlogSettings.Instance.DisqusWebsiteName %>">comments powered by Disqus.</a></noscript>
    <a href="http://disqus.com" class="dsq-brlink">blog comments powered by <span class="logo-disqus">Disqus</span></a>
  </div>
    <%} %>
      </div>
</asp:content>
