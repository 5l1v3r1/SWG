# -*- coding: utf-8 -*-
<div id="sidebar">
  <ul id="sidelist">
    <li id="pages-3" class="widget widget_pages"><h2 class="widgettitle">Pages</h2>
      <ul>
        <li class="cat-item"><a href='${config.siteurl}/index.${config.page_ext}'>Home</a></li>
        %for static in swg.getStaticPages():
          <li class="cat-item"><a href="${config.siteurl}${static.url}" title="${static.title | h}">${static.title | h}</a></li>
        %endfor
        <li class="cat-item"><a href='${config.siteurl}/members/your-name-here.${config.page_ext}'>About Me</a></li>
      </ul>
    </li>

    <li id="categories-2" class="widget widget_categories"><h2 class="widgettitle">Categories</h2>
	<ul>
        %for cat in categories:
          <li class="cat-item"><a href="${config.siteurl}${cat.url}" title="View category ${cat.title | h} archive">${cat.title | h}</a></li> 
        %endfor	      
	</ul>
    </li>

    <li id="linkcat-2" class="widget widget_links"><h2 class="widgettitle">Blogroll</h2>
      <ul class='blogroll'>
        <li><a href="#">Example Link</a></li>
        <li><a href="#">Example Link</a></li>
        <li><a href="#">Example Link</a></li>
        <li><a href="#">Example Link</a></li>
      </ul>
    </li>

    <div id="tag_cloud" class="widget">
      <h2>Tag Cloud</h2>
      <%
        import math
        import random

        total       = min( 50, len(tags) - 1 )
        minOccurs   = len( tags[total].items ) + 1
        maxOccurs   = len( tags[0].items )
        minFontSize = 12;
        maxFontSize = 30;
        randomized  = tags[0:total]
        random.shuffle(randomized)
      %>
      % for tag in randomized:
        <%
          current = len( tag.items )
          a       = math.log(current) - math.log(minOccurs)
          b       = math.log(maxOccurs) - math.log(minOccurs)
          weight  = (a / b) if b != 0 else a
          size    = minFontSize + round( ( maxFontSize - minFontSize ) * weight );
        %>
        <a href="${config.siteurl}${tag.url}" title="${len(tag.items)} argomenti" style="font-size: ${size}px">${tag.title | h}</a>         
      % endfor		
    </div>
	
  </ul>
</div>
