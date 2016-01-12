<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="System.IO" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Code View</title>
    <script language="C#" runat="server">            
        protected void Page_Load(object sender, EventArgs e)
        {
            // Display multiple files
            String fileNames = Request.QueryString["name"];
            foreach (String name in fileNames.Split('|'))
            {
                showCode(name);
            }
        }
        // Automatically create controls to show code
        private void showCode(String fileName)
        {
            // Display file name
            Label lblName = new Label();
            lblName.Text = fileName;
            
            pnlCode.Controls.Add(lblName);
            // Display code content
            Panel pCode = new Panel();
            pCode.CssClass = "code_wrapper";
            Label lblCode = new Label();
            lblCode.Text = readFile(Server.MapPath(fileName));
            pCode.Controls.Add(lblCode);
            pnlCode.Controls.Add(pCode);
        }
        // Read file
        private String readFile(String filePath)
        {
            try
            {
                using(StreamReader sr = new StreamReader(filePath))
                {
                    return Server.HtmlEncode(sr.ReadToEnd()).Replace("\n", "<br />");
                }
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
    </script>
</head>
<body>
    <asp:Panel ID="pnlCode" CssClass="code" runat="server">
        <h1>Source Code</h1>
    </asp:Panel>
</body>
</html>
