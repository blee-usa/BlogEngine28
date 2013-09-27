<%@ Page Language="C#" AutoEventWireup="true" Inherits="_default" Codebehind="default.aspx.cs" %>
<%@ Register Src="Custom/PostList.ascx" TagName="PostList" TagPrefix="uc1" %>


<asp:Content ID="Content3" ContentPlaceHolderID="cphBreadcrumbs" Runat="Server">
        <ul class="bxslider">
  <li><img src="/pics/slide1.jpg" /></li>
  <li><img src="/pics/slide2.jpg" /></li>
  <li><img style="position: relative; " src="/pics/slide3.jpg" /><div style="position: absolute; 
   top: 100px; background-color: white;
   left: 20px; 
   width: 20%;">asdfasfdasfas asd asdfasdf asdfa s</div></li>
            <li>hello world <a href="#">clicke here</a></li>
</ul>
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="cphBody" Runat="Server">
    
  <div id="divError" runat="Server" />
    

    

  <uc1:PostList ID="PostList1" runat="server" />
  <blog:PostCalendar runat="server" ID="calendar" 
    EnableViewState="false"
    ShowPostTitles="true" 
    BorderWidth="0"
    NextPrevStyle-CssClass="header"
    CssClass="calendar" 
    WeekendDayStyle-CssClass="weekend" 
    OtherMonthDayStyle-CssClass="other" 
    UseAccessibleHeader="true" 
    Visible="false" 
    Width="100%" />    
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="cphBodyScript" Runat="Server">
    <script>
    $(document).ready(function(){
        $('.bxslider').bxSlider({
            auto: true,
            autoControls: true,
            controls: false,
            easing: "easeOutCirc",
            speed: 2000
        });
    });
    </script>
</asp:Content>


