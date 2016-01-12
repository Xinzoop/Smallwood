<%@ Page Title="Registration" Language="C#" MasterPageFile="main.Master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script language="C#" runat="server">
    
        // Skills for selection
        private String[] skilllist = { "C#", "JAVA", "PHP", "C++", "VB"};
        // Fill page content
        protected void Page_Load()
        {
            if (!IsPostBack)
            {
                // Fill available skills
                foreach (String skill in skilllist)
                {
                    lbSkills.Items.Add(skill);
                }
                lbSkills.SelectionMode = ListSelectionMode.Multiple;
            }
        }
        
        // User submit registration
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;
                        
            pnlDetails.Visible = true;
            lblEmail.Text = tbxEmail.Text;
            lblName.Text = tbxFName.Text + " " + tbxLName.Text;
            lblGender.Text = rblGender.SelectedValue;
            lblPosition.Text = ddlPosition.SelectedValue;
            String skills = "";
            foreach (int i in lbSkills.GetSelectedIndices())
            {
                skills += ", " + skilllist[i];
            }
            if (skills != "")
                lblSkills.Text = skills.Substring(2);
            lblYear.Text = tbxYear.Text;
            if (tbxURL.Text.ToUpper().StartsWith("http"))
                lnkURL.NavigateUrl = lnkURL.Text = tbxURL.Text;
            else
                lnkURL.NavigateUrl = lnkURL.Text = "http://" + tbxURL.Text;
            
            // Store into database
            dsUser.Insert();
        }

        // Validate user password using customized validator
        protected void cvPwd_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = false;

            // Password should be lenght 8-15, including only number, leters, 
            // special characters and at least one for each
            Regex reg = new Regex("^(?=.*[a-zA-Z])(?=.*\\d)(?=.*[^\\da-zA-Z]).{8,15}$");
            if(reg.IsMatch(args.Value)){
                args.IsValid = true;
            }
        }
        
</script>
    <asp:AccessDataSource ID="dsUser" runat="server" DataFile="~/App_Data/users.accdb" SelectCommand="SELECT * FROM [user]" 
        InsertCommand="INSERT INTO [USER] ([email], [password], [fname], [lname], [gender], [notify], [position], [skills], [years], [url]) VALUES (@email, @pwd, @fname, @lname, @gender, @notify, @pos, @skills, @years, @url)"
        >
        <InsertParameters>
            <asp:ControlParameter ControlID="lblEmail" Name="email" PropertyName="Text" />
            <asp:ControlParameter ControlID="tbxPwd" Name="pwd" PropertyName="Text" />
            <asp:ControlParameter ControlID="tbxFName" Name="fname" PropertyName="Text" />
            <asp:ControlParameter ControlID="tbxLName" Name="lname" PropertyName="Text" />
            <asp:ControlParameter ControlID="rblGender" Name="gender" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="cbSend" Name="notify" PropertyName="Checked" />
            <asp:ControlParameter ControlID="lblPosition" Name="pos" PropertyName="Text" />
            <asp:ControlParameter ControlID="lblSkills" Name="skills" PropertyName="Text" />
            <asp:ControlParameter ControlID="lblYear" Name="years" PropertyName="Text" />
            <asp:ControlParameter ControlID="lnkURL" Name="url" PropertyName="NavigateUrl" />
        </InsertParameters>
    </asp:AccessDataSource>

    <h2>User Registration</h2>

    <hr />
    <asp:HyperLink ID="HyperLink1" Target="_blank" NavigateUrl="~/locked/code.aspx?name=~/registration.aspx" runat="server"><asp:Image ID="Image3" runat="server" SkinID="codebuttonAddRecords" /></asp:HyperLink>
    <asp:HyperLink ID="HyperLink2" runat="server" Target="_blank" NavigateUrl="~/locked/records.aspx">Click here to see all the users</asp:HyperLink>
    <asp:HyperLink ID="HyperLink3" runat="server" Target="_blank" NavigateUrl="~/locked/searchuser.aspx">Click here to search user</asp:HyperLink>
    <hr />

    <p class="note"><strong>Note: </strong>Fields with blue border are required.</p>
    <asp:Panel ID="pnlReg" CssClass="reg" runat="server">
        <table>
            <tr>
                <td class="reg_cat" colspan="2">
                    <asp:Label ID="Label1" runat="server" Text="Account Information"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="reg_left">
                    <asp:Label ID="Label4" runat="server" AssociatedControlID="tbxEmail" Text="Email:"></asp:Label>
                </td>
                <td class="reg_middle">
                    <asp:TextBox ID="tbxEmail" CssClass="reg_req" runat="server" ToolTip="Your email address."></asp:TextBox>
                </td>
                <td class="reg_right">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxEmail"
                        Display="Dynamic" ErrorMessage="Please input email address." SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbxEmail"
                        ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" ErrorMessage="Invalid email address." SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="reg_left">
                    <asp:Label ID="Label5" runat="server" AssociatedControlID="tbxPwd" Text="Password:"></asp:Label>
                </td>
                <td class="reg_middle">
                    <asp:TextBox ID="tbxPwd" runat="server" CssClass="reg_req" TextMode="Password" ToolTip="Your password (8-15 characters. Must contain at least one number, one letter and one special character)."></asp:TextBox>
                </td>
                <td class="reg_right">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbxPwd"
                        Display="Dynamic" ErrorMessage="Please input your password."></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="cvPwd" runat="server" ControlToValidate="tbxPwd"
                        OnServerValidate="cvPwd_ServerValidate" ErrorMessage="Invalid password (8-15 characters. Must contain at least one number, one letter and one special character)." SetFocusOnError="True" Display="Dynamic"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td class="reg_left">
                    <asp:Label ID="Label6" runat="server" AssociatedControlID="tbxPwd2" Text="Confirm Password:"></asp:Label>
                </td>
                <td class="reg_middle">
                    <asp:TextBox ID="tbxPwd2" runat="server" CssClass="reg_req" TextMode="Password" ToolTip="Type in your password again."></asp:TextBox>
                </td>
                <td class="reg_right">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbxPwd2"
                        Display="Dynamic" ErrorMessage="Please confirm your password."></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="tbxPwd2" ControlToCompare="tbxPwd"
                        ErrorMessage="Your passwords do not match." Display="Dynamic"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td></td>
                <td colspan="2">
                    <asp:CheckBox ID="cbSend" runat="server" Text="Send me newsletter and updates." ToolTip="Whether request our newsletter and updates." />
                </td>
            </tr>

            <tr>
                <td class="reg_cat" colspan="2">
                    <asp:Label ID="Label2" runat="server" Text="Personal Details"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="reg_left">
                    <asp:Label ID="Label7" runat="server" AssociatedControlID="tbxFName" Text="First Name:"></asp:Label>
                </td>
                <td class="reg_middle">
                    <asp:TextBox ID="tbxFName" runat="server" CssClass="reg_req" ToolTip="Your first name."></asp:TextBox>
                </td>
                <td class="reg_right">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbxFName"
                        Display="Dynamic" ErrorMessage="Please input your first name." SetFocusOnError="True"></asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td class="reg_left">
                    <asp:Label ID="Label8" runat="server" AssociatedControlID="tbxLName" Text="Last Name:"></asp:Label>
                </td>
                <td class="reg_middle">
                    <asp:TextBox ID="tbxLName" runat="server" CssClass="reg_req" ToolTip="Your family name."></asp:TextBox>
                </td>
                <td class="reg_right">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbxLName"
                        Display="Dynamic" ErrorMessage="Please input your sur name." SetFocusOnError="True"></asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td class="reg_left">
                    <asp:Label ID="Label9" runat="server" AssociatedControlID="rblGender" Text="Gender:"></asp:Label>
                </td>
                <td class="reg_middle">
                    <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>


            <tr>
                <td class="reg_cat" colspan="2">
                    <asp:Label ID="Label3" runat="server" Text="IT Experience"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="reg_left">
                    <asp:Label ID="Label10" runat="server" AssociatedControlID="ddlPosition" Text="Position:"></asp:Label>
                </td>
                <td class="reg_middle">
                    <asp:DropDownList ID="ddlPosition" runat="server" ToolTip="Your current employment status.">
                        <asp:ListItem>Student</asp:ListItem>
                        <asp:ListItem>Internship</asp:ListItem>
                        <asp:ListItem>Part Time</asp:ListItem>
                        <asp:ListItem>Full Time</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="reg_left">
                    <asp:Label ID="Label11" runat="server" AssociatedControlID="lbSkills" Text="Skills:"></asp:Label>
                </td>
                <td class="reg_middle">
                    <asp:ListBox ID="lbSkills" runat="server" ToolTip="Your skill abilities.">
                    </asp:ListBox>
                </td>
            </tr>
            <tr>
                <td class="reg_left">
                    <asp:Label ID="Label12" runat="server" Text="Learning Years:"></asp:Label>
                </td>
                <td class="reg_middle">
                    <asp:TextBox ID="tbxYear" runat="server" CssClass="reg_req" ToolTip="How many years have you learnt IT?"></asp:TextBox>
                </td>
                <td class="reg_right">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="tbxYear"
                        Display="Dynamic" ErrorMessage="Please input your learning years."></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="tbxYear"
                        Type="Integer" MinimumValue="0" MaximumValue="100" ErrorMessage="Incorrect learning years (Need non-negative integer)." SetFocusOnError="True" Display="Dynamic"></asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td class="reg_left">
                    <asp:Label ID="Label15" runat="server" Text="Your Site:"></asp:Label>
                </td>
                <td class="reg_middle">
                    <asp:TextBox ID="tbxURL" runat="server" ToolTip="A website enables us to know you more."></asp:TextBox>
                </td>
                <td class="reg_right">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tbxURL"
                        ValidationExpression="^(http(s)?://)?([\w-]+.)+[\w-]+(/[\w- ./?%&=])?$" ErrorMessage="Invalid URL." SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="submit">
                    <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>

    <br />

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
                    <asp:Label ID="lblPwd" runat="server" Visible="false"></asp:Label>
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

</asp:Content>
