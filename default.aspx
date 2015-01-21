<%@ Page Language="C#" AutoEventWireup="true" Inherits="_default" CodeBehind="default.aspx.cs" %>

<%@ Register Src="Custom/PostList.ascx" TagName="PostList" TagPrefix="uc1" %>


<asp:content id="Content3" contentplaceholderid="cphBreadcrumbs" runat="Server">
       
    <asp:MultiView runat="server" ID="mvBreadcrumbs">
        <asp:View runat="server" ID="View0">
            <div class="slider-wrapper theme-default">
                <div id="slider" class="nivoSlider">
                    <a href="/post/2013/03/14/Five-Minute-Fridays-Rest.aspx"><img src="/assets/i/slides/bench960x320.JPG" title="#slide1" /></a>
                    <a href="http://soulstops.us5.list-manage1.com/subscribe?u=035eb92a4e5201ddbcdd5a9a3&id=8685882331"><img src="/assets/i/coverMan1.png" title="#slide2" /></a>
                    <a href="/post/2012/08/21/Gifting-God-Prayer.aspx"><img src="/assets/i/slides/fallenLeafLake960x320.JPG" title="#slide3" /></a>
                    <a href="http://soulstops.us5.list-manage1.com/subscribe?u=035eb92a4e5201ddbcdd5a9a3&id=8685882331"><img src="/assets/i/coverMan2.png" title="#slide4" /></a>
                    <a href="/post/Receiving-Gods-love-changes-you-from-the-inside-out.aspx"><img src="/assets/i/slides/flowers960x320.jpg" title="#slide5" /></a>
                </div>
           </div>
            <div id="slide1" class="nivo-html-caption">
                <h1><a href="/post/2013/03/14/Five-Minute-Fridays-Rest.aspx">Rest</a></h1> <p>Be still and know that I am God.<br/> -Psalm 46:10</p>
            </div>
            <div id="slide2" class="nivo-html-caption">
                <h1><a href="http://soulstops.us5.list-manage1.com/subscribe?u=035eb92a4e5201ddbcdd5a9a3&id=8685882331">Free eBook on Soul Care</a></h1> <p><q>I truly love it, I read it before going to sleep the other evening, and it was soothing...the soul needs focus.</q> ~ Nicky</p>

            </div>  
            <div id="slide3" class="nivo-html-caption">
                <h1> <a href="/post/2012/08/21/Gifting-God-Prayer.aspx">Reflect</a></h1> <p>Tie a ribbon of remembrance around my heart, so I remember
the sacred places where you have made yourself known.</p>
            </div>
            <div id="slide4" class="nivo-html-caption">
                <h1><a href="http://soulstops.us5.list-manage1.com/subscribe?u=035eb92a4e5201ddbcdd5a9a3&id=8685882331">Free eBook on Soul Care</a></h1> <p><q>Your gift of art is so beautiful. Thank you for allowing His light of truth to shine through you!</q> ~ Barbie Swihart</p>
            </div>            
            <div id="slide5" class="nivo-html-caption">
                <h1><a href="/post/Receiving-Gods-love-changes-you-from-the-inside-out.aspx">Renew</a></h1> <p>Real transformation comes from the inside-out.</p>
            </div>  
   </asp:View>
        <asp:View runat="server" ID="View1">
            
                        <nav id="breadcrumbs1" class="breadcrumbs lw">
                
                
                <ol>
                    <li class="bc-home"><a href="/">&nbsp;</a></li>
                    <li><span class="bc-current"><asp:Literal runat="server" ID="litCategory"></asp:Literal></span></li>
                </ol>
            </nav>
            

        </asp:View>
        <asp:View runat="server" ID="View2">
                                   <nav id="Nav1" class="breadcrumbs lw">
                
                
                <ol>
                    <li class="bc-home"><a href="/">&nbsp;</a></li>
                    <li><span class="bc-current"><asp:Literal runat="server" ID="Literal1"></asp:Literal></span></li>
                </ol>
            </nav> 

        </asp:View>
    </asp:MultiView>

</asp:content>


<asp:content id="Content1" contentplaceholderid="cphBody" runat="Server">
    
  <div id="divError" runat="Server" />
    

    

  <uc1:PostList ID="PostList1" runat="server"  />
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
        $('#slider').nivoSlider({
            effect: 'fade',
            pauseTime: 7000
        });
    </script>

</asp:content>


