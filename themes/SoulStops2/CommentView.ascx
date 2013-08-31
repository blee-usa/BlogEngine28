<%@ Control Language="C#" EnableViewState="False" Inherits="BlogEngine.Core.Web.Controls.CommentViewBase" %>

<div id="id_<%=Comment.Id %>" class="comment<%= Post.Author.Equals(Comment.Author, StringComparison.OrdinalIgnoreCase) ? " self" : "" %>">
  <p><%= ResolveLinks(Comment.Content) %></p>
  <p>Posted by: <%= Comment.Author + " | " + Comment.DateCreated.ToString("MM-dd-yyyy")%></p>
  <p class="author">
    <%= Comment.Website != null ? "<a href=\"" + Comment.Website + "\">" + Comment.Author + "</a>" : "" %>
    <%= AdminLinks %>
  </p>
  <hr />
</div>