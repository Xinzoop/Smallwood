<%@ Page Title="About Us" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>About Us</h2>
    <p>Smallwood is dedicated to provide a free, open and active platform for people who are enthusiastic in learning, using, enjoying information technologies. The author will 
        continue to share his problem solving experience in the pages. Visitors are welcomed to ask questions and leave comments. The resources in this website is free to read,
        use in your IT learnings. Just remember to refer the author and this site in your work.
    </p>
    <hr />
    <h3>About the author</h3>
    <p>My name is Peng Zhao, currently a student in Monash University doing Master of Information Technology / Master of Business Information System. I have been working as a developer
        for several years and is still passionate in exploring new IT technologies.
    </p>
    <hr />
    <h3>About the works</h3>
    <p>
        At this stage, the resources in this site mainly comprises of the author's previous learning notes, exercises / examples used in assignments and useful resources learnt from
        the internet. All the examples and codes are well tested and copyright free to use.
    </p>

    <hr />
    <asp:HyperLink ID="HyperLink1" Target="_blank" NavigateUrl="~/locked/code.aspx?name=~/locked/aboutus.aspx|~/locked/history.aspx|~/locked/faq.aspx" runat="server"><asp:Image ID="Image3" runat="server" SkinID="codebuttonAboutus" /></asp:HyperLink>
</asp:Content>
