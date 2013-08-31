<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RecentTopPosts.ascx.cs" Inherits="BlogEngine.Web.Custom.RecentTopPosts" %>
<asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
        <ul>
    </HeaderTemplate>
    <ItemTemplate>
        <li><%# GetPage(Container.DataItem)%></li>
    </ItemTemplate>
    <FooterTemplate>
        </ul>
    </FooterTemplate>
</asp:Repeater>