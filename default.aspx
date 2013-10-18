<%@ Page Language="C#" AutoEventWireup="true" Inherits="_default" CodeBehind="default.aspx.cs" %>

<%@ Register Src="Custom/PostList.ascx" TagName="PostList" TagPrefix="uc1" %>


<asp:content id="Content3" contentplaceholderid="cphBreadcrumbs" runat="Server">
    
    
    
    
    <asp:MultiView runat="server" ID="mvBreadcrumbs">
        <asp:View runat="server" ID="View0">
        <ul class="bxslider">
            <li><a href="/post/2013/03/14/Five-Minute-Fridays-Rest.aspx"><img style="position: relative; " src="/pics/slides/bench920x320.JPG" />
                <div style="position: absolute;  top: 20px; left: 20px; background-color: white; width: 20%;">
                    <h1 style="color: #9EC630">Rest</h1><p style="font-size: 18px; padding: 8px">Cease striving and know that I am God.<br/> -Psalm 46:10</p>
                </div></a>
            </li>
          <li><a href=""><img style="position: relative; " src="/pics/slides/fallenLeafLake920x320.JPG" /><div style="position: absolute; 
 background-color: white; top: 20px; left: 20px; width: 25%"><h1 style="color: #9EC630">Reflect</h1><p style="font-size: 18px; padding: 8px">Tie a ribbon of remembrance around my heart, so that I often recall

those sacred places where you have made yourself known...</p></div></a></li>
          <li><a href="/post/Receiving-Gods-love-changes-you-from-the-inside-out.aspx"><img style="position: relative; " src="/pics/slides/cloads920x320.JPG" /><div style="position: absolute; 
           top: 20px; background-color: white;
           left: 20px; 
           width: 20%;"><h1 style="color: #9EC630">Renew</h1><p style="font-size: 18px; padding: 8px">Real change can only come from the inside-out...</p></div></a></li>
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
        <asp:View runat="server" ID="View2">
                                   <nav id="Nav1" class="breadcrumbs lw">
                
                
                <ol>
                    <li class="bc-home"><a href="~">&nbsp;</a></li>
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


