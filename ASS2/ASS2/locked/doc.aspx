<%@ Page Title="Documentation" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Document</h2>
    <div class="doc_wrapper">
        <table>
            <tr>
                <td class="doc_cat" colspan="2">
                    <asp:Label ID="Label1" runat="server" Text="Author"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="doc_left">
                    <asp:Label ID="Label4" runat="server" Text="Name: "></asp:Label>
                </td>
                <td class="doc_right">
                    <asp:Label ID="Label5" runat="server" Text="Peng Zhao"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="doc_left">
                    <asp:Label ID="Label6" runat="server" Text="Studeng ID: "></asp:Label>
                </td>
                <td class="doc_right">
                    <asp:Label ID="Label7" runat="server" Text="25661043"></asp:Label>
                </td>
            </tr>
                        <tr>
                <td class="doc_left">
                    <asp:Label ID="Label19" runat="server" Text="Email: "></asp:Label>
                </td>
                <td class="doc_right">
                    <asp:HyperLink ID="HyperLink2" NavigateUrl="mailto:pzha75@student.monash.edu" 
                        runat="server">pzha75@student.monash.edu</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="doc_cat" colspan="2">
                    <asp:Label ID="Label2" runat="server" Text="Unit"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="doc_left">
                    <asp:Label ID="Label8" runat="server" Text="Unit Name: "></asp:Label>
                </td>
                <td class="doc_right">
                    <asp:Label ID="Label9" runat="server" Text="FIT5032 Internet Application Development"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="doc_left">
                    <asp:Label ID="Label12" runat="server" Text="Provider: "></asp:Label>
                </td>
                <td class="doc_right">
                    <asp:Label ID="Label13" runat="server" Text="The Caulfield School of Information Technology, Monash University"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="doc_left">
                    <asp:Label ID="Label14" runat="server" Text="Tutor Name: "></asp:Label>
                </td>
                <td class="doc_right">
                    <asp:Label ID="Label15" runat="server" Text="Linh Nhat Chu"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="doc_cat" colspan="2">
                    <asp:Label ID="Label3" runat="server" Text="Assignment"></asp:Label>
                </td>
            </tr>
                        <tr>
                <td class="doc_left">
                    <asp:Label ID="Label10" runat="server" Text="Number: "></asp:Label>
                </td>
                <td class="doc_right">
                    <asp:Label ID="Label11" runat="server" Text="Assignment 2"></asp:Label>
                </td>
            </tr>
                        <tr>
                <td class="doc_left">
                    <asp:Label ID="Label16" runat="server" Text="Date of Submission: "></asp:Label>
                </td>
                <td class="doc_right">
                    <asp:Label ID="Label17" runat="server" Text="10/09/2015"></asp:Label>
                </td>
            </tr>
                        <tr>
                <td class="doc_left">
                    <asp:Label ID="Label18" runat="server" Text="Specification: "></asp:Label>
                </td>
                <td class="doc_right">
                    <asp:HyperLink ID="HyperLink1" NavigateUrl="~/res/FIT5032-A2-spec.pdf" runat="server">FIT5032-A2-spec.pdf</asp:HyperLink>
                </td>
            </tr>
        </table>
    </div>
    <hr />
    <asp:HyperLink ID="HyperLink3" Target="_blank" NavigateUrl="~/locked/code.aspx?name=~/App_Themes/default/default.css" runat="server"><asp:Image ID="Image3" runat="server" SkinID="codebuttonCSS" /></asp:HyperLink>
    <asp:HyperLink ID="HyperLink4" runat="server" Target="_blank" NavigateUrl="~/locked/code.aspx?name=~/App_Themes/default/default.skin"><asp:Image ID="Image4" runat="server" SkinID="codebuttonSkin" /></asp:HyperLink>
</asp:Content>
