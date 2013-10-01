<%@ Page Language="C#" AutoEventWireup="true" Inherits="_default" CodeBehind="default.aspx.cs" %>

<%@ Register Src="Custom/PostList.ascx" TagName="PostList" TagPrefix="uc1" %>


<asp:content id="Content3" contentplaceholderid="cphBreadcrumbs" runat="Server">
    
    
    
    
    <asp:MultiView runat="server" ID="mvBreadcrumbs">
        <asp:View runat="server" ID="View0">
        <ul class="bxslider">
          <li><img style="position: relative; " src="/pics/slide3.jpg" /><div style="position: absolute; 
           top: 100px; background-color: white;
           left: 20px; 
           width: 20%;">asdfasfdasfas asd asdfasdf asdfa s</div></li>
                    <li>hello world <a href="#">clicke here</a></li>
        </ul>
            

        </asp:View>
        <asp:View runat="server" ID="View1">
            
                        <nav id="breadcrumbs1" class="breadcrumbs lw">
                
                
                <ol>
                    <li class="bc-home"><a href="~">&nbsp;</a></li>
                    <li><span class="bc-current"><asp:Literal runat="server" ID="litCategory"></asp:Literal></span></li>
                </ol>
            </nav>
            

        </asp:View>
        <asp:View runat="server" ID="View2"></asp:View>
    </asp:MultiView>

</asp:content>


<asp:content id="Content1" contentplaceholderid="cphBody" runat="Server">
    
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
</asp:content>


<asp:content id="Content2" contentplaceholderid="cphBodyScript" runat="Server">
    <script>
        $(document).ready(function () {
            $('.bxslider').bxSlider({
                auto: true,
                autoControls: true,
                controls: false,
                pause: 6000
               /* easing: "easeOutCirc",
                speed: 2000 */
            });
        });
    </script>
</asp:content>


