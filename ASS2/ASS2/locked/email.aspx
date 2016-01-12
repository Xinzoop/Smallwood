<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" %>
<%@ Import Namespace="System.Net.Mail" %>

<script runat="server" language="C#">
    protected void Page_Load()
    {

    }
    // Send emails
    protected void btnSend_Click(object sender, EventArgs e)
    {
        MailMessage mail = new MailMessage();
        foreach (GridViewRow row in gvEmail.Rows)
        {
            if (row.RowType != DataControlRowType.DataRow)
                break;
            CheckBox cb = (CheckBox)row.FindControl("chkEmail");
            if (null != cb && cb.Checked)
            {
                mail.To.Add(new MailAddress(row.Cells[2].Text, row.Cells[0].Text + " " + row.Cells[1].Text));
            } 
        }
        
        if (mail.To.Count <= 0)
        {
            lblMsg.Text = "No recipients are selected.";
            lblMsg.ForeColor = System.Drawing.Color.Red;
        }
        
        mail.From = new MailAddress("pzha75@student.monash.edu", "Peng Zhao");
        mail.Subject = tbxSub.Text;
        mail.Body = tbxContent.Text;

        lblMsg.Visible = true;
        try
        {
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.monash.edu.au";
            smtp.Send(mail);
            lblMsg.Text = "Mails successfully sent.";
            lblMsg.ForeColor = System.Drawing.Color.Green;
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
            lblMsg.ForeColor = System.Drawing.Color.Red;
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Email Hub</h3>
    <asp:AccessDataSource ID="dsEmail" runat="server" DataFile="~/App_Data/users.accdb" SelectCommand="SELECT [email], [fname], [lname] FROM [user] WHERE [EMAIL] LIKE '%@%' ORDER BY [FNAME]"></asp:AccessDataSource>

    <h4>Please select users you want to send emails:</h4>
    <asp:GridView ID="gvEmail" CssClass="record_view" runat="server" AutoGenerateColumns="False" DataSourceID="dsEmail">
        <HeaderStyle CssClass="record_header" />
        <Columns>
            <asp:BoundField DataField="fname" HeaderText="First Name" SortExpression="fname" />
            <asp:BoundField DataField="lname" HeaderText="Given Name" SortExpression="lname" />
            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
            <asp:TemplateField HeaderText="Select">
                <ItemTemplate>
                    <asp:CheckBox runat="server" ID="chkEmail" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <h4>What do you want to say?</h4>
    <table class="email_wrapper">
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="From:"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Smallwood"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Subject:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="tbxSub" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Content:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="tbxContent" CssClass="email_content" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
    </table>

    <br />
    <asp:Button ID="btnSend" CssClass="btn" runat="server" Text="Send" OnClick="btnSend_Click" />
    <br />        
    <asp:Label ID="lblMsg" CssClass="email_msg" Visible="false" runat="server" Text="Label"></asp:Label>

    <hr />
    <asp:HyperLink ID="HyperLink1" Target="_blank" NavigateUrl="~/locked/code.aspx?name=~/locked/email.aspx" runat="server">
        <asp:Image ID="Image3" runat="server" SkinID="codebuttonEmail" />
    </asp:HyperLink>
</asp:Content>
