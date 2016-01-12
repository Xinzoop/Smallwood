<%@ Page Title="Search for User" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" %>

<script language="C#" runat="server">
    protected void Page_Load()
    {

    }
    // After data source selecting, update the error message display
    protected void dsUsers_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        lblMsg.Visible = e.AffectedRows <= 0;
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="search_user">
        <h3>Search a user</h3>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" AssociatedControlID="tbxEmail" Text="Email:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="tbxEmail" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" AssociatedControlID="tbxFName" Text="First Name:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="tbxFName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" AssociatedControlID="tbxLName" Text="Last Name:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="tbxLName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnSearch" runat="server" CssClass="btn" Text="Search" />
                </td>
            </tr>
        </table>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnSearch" />
            </Triggers>
            <ContentTemplate>
                <asp:AccessDataSource ID="dsUsers" runat="server" DataFile="~/App_Data/users.accdb"
                    SelectCommand="SELECT * FROM [user] WHERE (([email] LIKE '%' + ? + '%') AND ([fname] LIKE '%' + ? + '%') AND ([lname] LIKE '%' + ? + '%'))"
                    OnSelected="dsUsers_Selected">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="tbxEmail" Name="email" PropertyName="Text" DefaultValue="" Type="String" ConvertEmptyStringToNull="False" />
                        <asp:ControlParameter ControlID="tbxFName" Name="fname" PropertyName="Text" DefaultValue="" Type="String" ConvertEmptyStringToNull="False" />
                        <asp:ControlParameter ControlID="tbxLName" Name="lname" PropertyName="Text" DefaultValue="" Type="String" ConvertEmptyStringToNull="False" />
                    </SelectParameters>
                </asp:AccessDataSource>
                <hr />
                <asp:Label ID="lblMsg" CssClass="err_msg" runat="server" Text="No matched records found."></asp:Label>
                <asp:GridView ID="gvRecords" CssClass="record_view" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="dsUsers">
                    <HeaderStyle CssClass="record_header" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                        <asp:BoundField DataField="password" HeaderText="Password" SortExpression="password" />
                        <asp:BoundField DataField="fname" HeaderText="First Name" SortExpression="fname" />
                        <asp:BoundField DataField="lname" HeaderText="Last Name" SortExpression="lname" />
                        <asp:BoundField DataField="gender" HeaderText="Gender" SortExpression="gender" />
                        <asp:CheckBoxField DataField="notify" HeaderText="Notify" SortExpression="notify" />
                        <asp:BoundField DataField="position" HeaderText="Position" SortExpression="position" />
                        <asp:BoundField DataField="skills" HeaderText="Skills" SortExpression="skills" />
                        <asp:BoundField DataField="years" HeaderText="Years" SortExpression="years" />
                        <asp:HyperLinkField DataNavigateUrlFields="url" HeaderText="URL" DataTextField="url" SortExpression="url" />
                    </Columns>
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>

        <hr />
        <asp:HyperLink ID="HyperLink1" Target="_blank" NavigateUrl="~/locked/code.aspx?name=~/locked/searchuser.aspx" runat="server">
            <asp:Image ID="Image3" runat="server" SkinID="codebuttonsearchrecords" />
        </asp:HyperLink>
    </div>
</asp:Content>
