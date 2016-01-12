<%@ Page Title="Frequently Asked Questions" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

    <script type="text/javascript">

        $(document).ready(function () {
            $('.faq_q').click(function () {
                $(this).parent().toggleClass('faq_cur').find('p').slideToggle(300);
            });
        });

    </script>

    <h2>Frequently Asked Questions</h2>
    <br />
    <div class="faq_wrapper">
        <ul>
            <li>
                <h4 class="faq_q">(1) How to center a 'div' using css?</h4>
                <p class="faq_a">Set the width (like 80%) and set the margin as 'auto'.</p>
            </li>
            <li>
                <h4 class="faq_q">(2) How to center label text using css?</h4>
                <p class="faq_a">Using a 'div' to enclose the label. Then set the div's 'text-align' as 'center'.</p>
            </li>
            <li>
                <h4 class="faq_q">(3) What is the difference between asp:label and asp:literal?</h4>
                <p class="faq_a">
                    Asp:label is actually translated into a 'span' element while asp:literal has no equivelant HTML tag (pure text). However,
                    you are free to enclose other tags (like p, strong, span) in the text of asp:literal.
                </p>
            </li>
            <li>
                <h4 class="faq_q">(4) Why does the text in asp:hyperlink control NOT show as a proper link does (underline, blue color etc)?</h4>
                <p class="faq_a">Make sure you set the 'NavigativeURL' property. Then it should look as normal. </p>
            </li>
            <li>
                <h4 class="faq_q">(5) How to select the nth elements in a container using css selector?</h4>
                <p class="faq_a">
                    Use ':first-child' to choose its parent's first child. It is same for ':nth-child'. But sometimes ':last-child' does not
                    always work. Nevertheless, you can still use a specific class to refer the element you want.
                </p>
            </li>
        </ul>
    </div>

</asp:Content>
