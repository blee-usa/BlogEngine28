<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Quotes.ascx.cs" Inherits="BlogEngine.Web.Custom.Quotes" %>
<p><asp:Label ID="LblQuote" runat="server" Text="Quote" /></p>
<p class="align-right">- <asp:Label ID="LblSource" runat="server" Text="Source" /></p>
<asp:HiddenField ID="HfQuoteID" runat="server" />

<% if (Page.User.Identity.IsAuthenticated){ %>
<asp:Panel ID="PnlActions" runat="server">
    <asp:Button ID="BtnAdd" runat="server" Text="Add" OnClick="BtnAdd_Click" />
    <asp:Button ID="BtnEdit" runat="server" Text="Edit" OnClick="BtnEdit_Click" />
    <asp:Button ID="BtnDelete" runat="server" Text="Del" OnClick="BtnDelete_Click" />
    <asp:Button ID="BtnPrev" runat="server" Text="Prev" OnClick="BtnPrev_Click" />
    <asp:Button ID="BtnNext" runat="server" Text="Next" OnClick="BtnNext_Click" />
</asp:Panel>
<asp:Panel ID="PnlEditor" Visible="false" runat="server">
    <asp:TextBox ID="TxtContent" runat="server" TextMode="MultiLine" Rows="10" Style="width: 95%"></asp:TextBox>
    <asp:TextBox ID="TxtSource" runat="server"></asp:TextBox>
    <asp:HiddenField ID="HfEditID" runat="server" />
    <br />
    <asp:Button ID="BtnSave" runat="server" Text="Save" OnClick="BtnSave_Click" />
    <asp:Button ID="BtnCancel" runat="server" Text="Cancel" OnClick="BtnCancel_Click" />
</asp:Panel>
<asp:Panel ID="PnlDelete" Visible="false" runat="server">
    Are you sure?
    <br />
    <asp:Button ID="BtnYes" runat="server" Text="Yes" OnClick="BtnYes_Click" />
    <asp:Button ID="BtnNo" runat="server" Text="No" OnClick="BtnNo_Click" />
</asp:Panel>
<asp:Panel ID="PnlError" Visible="false" runat="server">
    Unable to delete last quote.
    <br />
    <asp:Button ID="BtnOk" runat="server" Text="Ok" OnClick="BtnOk_Click" />
</asp:Panel>
<%} %>