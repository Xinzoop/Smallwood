<%@ Page Title="Login" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>

<script runat="server">
    protected void Page_Load()
    {
        if (!IsPostBack)
        {
            vs.ValidationGroup = login.UniqueID;
        }
    }
    // User authentication
    protected void login_Authenticate(object sender, AuthenticateEventArgs e)
    {
        e.Authenticated = false;

        using (OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["userDB"].ToString()))
        {
            try
            {
                conn.Open();
                String sql = "SELECT count(*) FROM [USER] WHERE [EMAIL]=@email AND [PASSWORD]=@pwd";
                OleDbCommand command = new OleDbCommand(sql, conn);
                command.Parameters.Add("@email", OleDbType.VarChar, 64);
                command.Parameters["@email"].Value = login.UserName;
                command.Parameters.Add("@pwd", OleDbType.VarChar, 32);
                command.Parameters["@pwd"].Value = login.Password;
                if ((int)command.ExecuteScalar() > 0)
                    e.Authenticated = true;   
            }
            catch (Exception ex)
            {
                login.FailureText = ex.Message;
            }
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Login ID="login" runat="server" CssClass="login" DisplayRememberMe="False" OnAuthenticate="login_Authenticate" UserNameLabelText="Email Address:" 
            UserNameRequiredErrorMessage="Email is required." TitleText="Log In to smallwood Community">
            <TitleTextStyle CssClass="login_title" />
            <LabelStyle CssClass="login_label" />
            <LoginButtonStyle CssClass="login_btn" />
            <FailureTextStyle CssClass="login_fail" />
            <TextBoxStyle CssClass="login_tbx" />
        </asp:Login>
        <asp:ValidationSummary ID="vs" CssClass="login_error" runat="server" ValidationGroup="login" HeaderText="Please correct the following errors:" />
    </div>
    <hr />
    <asp:HyperLink ID="HyperLink1" Target="_blank" NavigateUrl="~/locked/code.aspx?name=~/login.aspx" runat="server"><asp:Image ID="Image3" runat="server" SkinID="codebuttonlogin" /></asp:HyperLink>
</asp:Content>
