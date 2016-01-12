<%@ Page Title="Sitemap" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h2>Sitemap</h2>
    <div class="sitemap_wrapper">
        <asp:TreeView ID="map" runat="server" DataSourceID="sitemapsrc" ShowLines="True"></asp:TreeView>
    <asp:SiteMapDataSource ID="sitemapsrc" runat="server" />
    </div>

    <hr />
    <asp:HyperLink ID="HyperLink1" Target="_blank" NavigateUrl="~/locked/code.aspx?name=~/locked/sitemap.aspx" runat="server"><asp:Image ID="Image3" runat="server" SkinID="codebuttonSiteMap" /></asp:HyperLink>
</asp:Content>
