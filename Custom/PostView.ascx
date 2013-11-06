<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PostView.ascx.cs" Inherits="BlogEngine.Web.Custom.PostView" %>

<div class="post cf hentry">

	<h2>
		<span class="post-format"></span>
		<a href="<%=Post.RelativeLink %>" title="<%=Post.Title%>" rel="bookmark"><%=Post.Title%></a>
		
	</h2>

	<div class="thumb-shadow"><div class="post-thumb"><a href="<%=Post.RelativeLink %>"><img src="<%=GetFirstImageSource(Post) %>" height="180" alt="<%=Post.Title%>" /></a></div></div>
	
	<div class="post-bodycopy cf">
	
		<div class="post-date">		
			<p class="post-month"><%=Post.DateCreated.ToString("MMM")%></p>
			<p class="post-day"><%=Post.DateCreated.ToString("dd")%></p>
			<p class="post-year"><%=Post.DateCreated.ToString("yyyy")%></p>				
		</div>

        
            <div class="entry"><asp:PlaceHolder ID="BodyContent" runat="server" /></div>
		
	</div>

	<div class="post-footer">
		<p class="post-categories"><%=CategoryLinks(" | ")%></p>		
	</div>
	
</div>
<div id="endShare"></div>

<%-- 
<div id="post-<?php the_ID(); ?>" <?php post_class( 'cf' ); ?>>

	<h2>
		<span class="post-format"></span>
		<a href="<?php the_permalink(); ?>" title="<?php the_title_attribute(); ?>" rel="bookmark"><?php the_title(); ?></a>
		<?php bfa_comments_popup_link( '0', '1', '%' ); ?>
	</h2>

	<?php bfa_thumb( 620, 180, true, '<div class="thumb-shadow"><div class="post-thumb">', '</div></div>' ); ?>
	
	<div class="post-bodycopy cf">
	
		<div class="post-date">		
			<p class="post-month"><?php the_time( 'M' ); ?></p>
			<p class="post-day"><?php the_time( 'j' ); ?></p>
			<p class="post-year"><?php the_time( 'Y' ); ?></p>				
		</div>

		<?php bfa_excerpt( 55, ' ...' ); ?>
		
	</div>

	<div class="post-footer">
		<a class="post-readmore" href="<?php the_permalink(); ?>" title="<?php the_title_attribute(); ?>">
		<?php _e( 'read more &rarr;', 'montezuma' ); ?></a>
		<p class="post-categories"><?php the_category( ' &middot; ' ); ?></p>

		<?php the_tags( '<p class="post-tags">', ' &middot; ', '</p>' ); ?>
	</div>
	
</div>

--%>