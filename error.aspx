<%@ Page Language="C#" AutoEventWireup="true" Inherits="error_occurred" Codebehind="error.aspx.cs" %>


<asp:content id="Content3" contentplaceholderid="cphBreadcrumbs" runat="Server">
    
                            <nav id="breadcrumbs1" class="breadcrumbs lw">
                
                
                <ol>
                    <li class="bc-home"><a href="/">&nbsp;</a></li>
                    <li><span class="bc-current">Ooops!</span></li>
                </ol>
            </nav>
</asp:content>
<asp:Content ID="Content1" ContentPlaceHolderID="cphBody" Runat="Server">
  <div class="post hentry">
    <h1>Ooops! An unexpected error has occurred.</h1>
    
    <div>
      <p>
        This one's down to me! Please accept my apologies for this - I'll see to it
        that the developer responsible for this happening is given 20 lashes 
        (but only after he or she has fixed this problem).
      </p>
    </div>
    
    <div id="divErrorDetails" runat="server" visible="false">
        <h2>Error Details:</h2>
        <p id="pDetails" runat="server"></p>
    </div>
    
  </div>
</asp:Content>