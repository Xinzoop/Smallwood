<%@ Page Title="Home" Language="C#" MasterPageFile="main.Master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="pnlWelcom" runat="server">
        <div>
            <asp:Image CssClass="topic" ID="Image1" runat="server" SkinID="hut"/>
        </div>
        <h2>Welcome to smallwood</h2>
        <p>This is a free IT developer community. You are encourage to share your development experience and help other to solve painful technical problems. There are
            also some tips/tricks in software / website development here either shared by myself or by other developers. Feel free to learn.
        </p>
    </asp:Panel>

    <hr />

    <asp:Panel ID="pnlExteralLinks" runat="server">
        <h3>Useful external resources:</h3>
        <asp:UpdatePanel ID="pnlAd" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="tmAd" />
            </Triggers>
            <ContentTemplate>
                <asp:AdRotator ID="ad" runat="server" CssClass="ad" AdvertisementFile="~/res/ad.xml" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Timer ID="tmAd" runat="server" Interval="3000"></asp:Timer>
    </asp:Panel>

    <hr />

    <asp:Panel ID="pnlCopyright" runat="server">
        <h3>Copyright Notice</h3>
        <p>Smallwood and myself reserve the copyright of the whole website including the design and original materials (e.g. text, images). 
            You are free to refer and use these resources, but are responsible to keep a reference of this website.</p>
    </asp:Panel>

    <hr />

    <asp:Panel ID="pnlAck" runat="server">
        <h3>Acknowledgement</h3>
        <p>The 'hut' and 'computer' images in this page are from pixabay.com. They are explicitly declared as copyright free. The advertisement shown above, including w3school.com, tutorialpoint.com and opensourcetemplates.org are attributed to the copyright of their respective owners.</p>
    </asp:Panel>

    <hr />

    <asp:Panel ID="pnlLinks" runat="server" CssClass="links">
        <div>
            <asp:Image ID="Image2" CssClass="computer" runat="server" SkinID="computer"/>
        </div>
        <h3>Links:</h3>
        <asp:HyperLink ID="lkDisclaimer" runat="server" NavigateUrl="http://users.monash.edu.au/~sgrose/msh/disclaimer.htm" Target="_blank">Monash Disclaimer</asp:HyperLink>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Email: "></asp:Label>
        <asp:HyperLink ID="lkAuthor" runat="server" NavigateUrl="mailto:pzha75@student.monash.edu">Author</asp:HyperLink>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Email: "></asp:Label>
        <asp:HyperLink ID="lkMaster" runat="server" NavigateUrl="mailto:pzha75@student.monash.edu">Webmaster</asp:HyperLink>
    </asp:Panel>

    <hr />
    <asp:HyperLink ID="HyperLink1" Target="_blank" NavigateUrl="~/locked/code.aspx?name=~/index.aspx|~/res/ad.xml" runat="server"><asp:Image ID="Image3" runat="server" SkinID="codebuttonAddrotator" /></asp:HyperLink>
    <asp:HyperLink ID="HyperLink2" runat="server" Target="_blank" NavigateUrl="~/locked/code.aspx?name=~/main.Master"><asp:Image ID="Image4" runat="server" SkinID="codebuttonMasterPage" /></asp:HyperLink>
</asp:Content>
