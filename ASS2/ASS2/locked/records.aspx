<%@ Page Title="View Users" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" %>

<script runat="server">
    protected void Page_Load()
    {

    }

    // Gridview Button event
    protected void gvRecords_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        pnlDetails.Visible = true;
        if (e.CommandName == "showMore")
        {
            int rowindex = Int32.Parse(e.CommandArgument.ToString());
            GridView gv = sender as GridView;
            GridViewRow row = gv.Rows[rowindex];
            lblEmail.Text = row.Cells[1].Text;
            lblPwd.Text = row.Cells[2].Text;
            lblName.Text = row.Cells[3].Text + " " + row.Cells[4].Text;
            lblGender.Text = row.Cells[5].Text;
            lblPosition.Text = row.Cells[7].Text;
            lblSkills.Text = row.Cells[8].Text;
            lblYear.Text = row.Cells[9].Text;
            lnkURL.NavigateUrl = lnkURL.Text = ((HyperLink)row.Cells[10].Controls[0]).Text;
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="record_wrapper">
        <h2>Users</h2>
        <asp:AccessDataSource ID="dsUsers" runat="server" DataFile="~/App_Data/users.accdb" SelectCommand="SELECT * FROM [user]"></asp:AccessDataSource>
        <asp:GridView CssClass="record_view" ID="gvRecords" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="dsUsers" OnRowCommand="gvRecords_RowCommand">
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
                <asp:ButtonField Text="More" ButtonType="Button" CommandName="showMore" />
            </Columns>
        </asp:GridView>

        <br />

        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="gvRecords" />
            </Triggers>
            <ContentTemplate>
                <asp:Panel ID="pnlDetails" CssClass="detail" Visible="false" runat="server">
                    <hr />
                    <table>
                        <tr>
                            <td class="detail_title" colspan="2">
                                <asp:Label ID="Label13" runat="server" Text="Registration Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="detail_left">
                                <asp:Label ID="Label14" runat="server" Text="Email:"></asp:Label>
                            </td>
                            <td class="detail_right">
                                <asp:Label ID="lblEmail" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="detail_left">
                                <asp:Label ID="Label1" runat="server" Text="Password:"></asp:Label>
                            </td>
                            <td class="detail_right">
                                <asp:Label ID="lblPwd" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="detail_left">
                                <asp:Label ID="Label16" runat="server" Text="Name:"></asp:Label>
                            </td>
                            <td class="detail_right">
                                <asp:Label ID="lblName" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="detail_left">
                                <asp:Label ID="Label17" runat="server" Text="Gender:"></asp:Label>
                            </td>
                            <td class="detail_right">
                                <asp:Label ID="lblGender" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="detail_left">
                                <asp:Label ID="Label18" runat="server" Text="Position:"></asp:Label>
                            </td>
                            <td class="detail_right">
                                <asp:Label ID="lblPosition" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="detail_left">
                                <asp:Label ID="Label19" runat="server" Text="Skills:"></asp:Label>
                            </td>
                            <td class="detail_right">
                                <asp:Label ID="lblSkills" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="detail_left">
                                <asp:Label ID="Label20" runat="server" Text="Learning Years:"></asp:Label>
                            </td>
                            <td class="detail_right">
                                <asp:Label ID="lblYear" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="detail_left">
                                <asp:Label ID="Label21" runat="server" Text="Site URL:"></asp:Label>
                            </td>
                            <td class="detail_right">
                                <asp:HyperLink ID="lnkURL" runat="server" Target="_blank"></asp:HyperLink>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </ContentTemplate>


        </asp:UpdatePanel>

        <hr />
        <asp:HyperLink ID="HyperLink1" Target="_blank" NavigateUrl="~/locked/code.aspx?name=~/locked/records.aspx" runat="server">
            <asp:Image ID="Image3" runat="server" SkinID="codebuttondisplayrecords" />
        </asp:HyperLink>
    </div>

</asp:Content>
