<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Delicious.ascx.cs" Inherits="BlogEngine.Web.Custom.Delicious" %>
<asp:PlaceHolder runat="server" ID="phDeli">


    
<asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate><dl></HeaderTemplate>
    <ItemTemplate>
        <dt><a href="<%#Eval("Url") %>"><%#Eval("Title") %></a></dt>
        <dd><%#Eval("Description") %></dd>
    </ItemTemplate>
    <FooterTemplate></dl></FooterTemplate>
</asp:Repeater>


<asp:LinkButton ID="lbMore" runat="server" onclick="lbMore_Click" Visible="False">[More]</asp:LinkButton>

<asp:HiddenField runat="server" ID="hfCount" Value="5" />
   
</asp:PlaceHolder>