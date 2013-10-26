<%@ Page Language="C#" AutoEventWireup="true" Inherits="archive" EnableViewState="false" Codebehind="archive.aspx.cs" %>

<asp:content id="Content3" contentplaceholderid="cphBreadcrumbs" runat="Server">
    
                            <nav id="breadcrumbs1" class="breadcrumbs lw">
                
                
                <ol>
                    <li class="bc-home"><a href="/">&nbsp;</a></li>
                    <li><span class="bc-current">Archive</span></li>
                </ol>
            </nav>

</asp:content>
<asp:Content ID="Content1" ContentPlaceHolderID="cphBody" Runat="Server">
  <div id="archive" class="hentry">
    <h1><span><%=Resources.labels.archive %></span></h1>
    <ul runat="server" id="ulMenu" />
    <asp:placeholder runat="server" id="phArchive" />
    <br />
    
    <div id="totals">
      <h2><%=Resources.labels.total %></h2>
      <span><asp:literal runat="server" id="ltPosts" /></span><br />
      <asp:literal runat="server" id="ltComments" />
      <span><asp:literal runat="server" id="ltRaters" /></span>
    </div>
  </div>
</asp:Content>