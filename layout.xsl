<metadata>
 <datum name=description value="">
 <datum name=external_use value="">
 <datum name=http-content-type value="sitebuilder/xsl-template">
 <datum name=keywords value="">
 <datum name=language valuen=0>
 <datum name=multilang_status value="">
 <datum name=stationery value="">
 <datum name=stationery_md_flags value="">
 <datum name=title value="Site layout (HTML encapsulation)">
 <datum name=xsl-params value64="tmtlMCE=">
</metadata>
<?xml version="1.0"?>
<xsl:stylesheet>

<!-- shorthand attributes for all spacer images -->
<xsl:attribute-set name="spacer">
  <xsl:attribute name="alt"></xsl:attribute>
  <xsl:attribute name="src">/internal-roxen-unit</xsl:attribute>
  <xsl:attribute name="width">1</xsl:attribute>
  <xsl:attribute name="height">1</xsl:attribute>
</xsl:attribute-set>

<!-- MAIN LAYOUT (encapsulates entire page content) -->
<xsl:template name="layout">
  <xsl:param name="content"/>

  <br clear="all"/>

<define tag="navi" preparse="please">
<!-- ===== LEFT ===== -->
<false/>
<sb-output menu="sub.menu" above="above" range="-1..-1">
  <a href="#url#"><img src="/img/arrow-left.gif"
     width="14" height="35" border="0"/></a>
  <true/>&nbsp;
</sb-output>
<else>
  <false/>
  <sb-output quote='%' menu="sub.menu" selected="selected">
    <sb-output selected="selected" menu="../top.menu">
      <a href="#url#"><img src="/img/arrow-left.gif"
	 width="14" height="35" border="0"/></a>&nbsp;
      <true/>
    </sb-output>
  </sb-output>
  <else>
    <false/>
    <sb-output above="above" menu="../top.menu" range="-1..-1" >
      <false/>
      <sb-output quote='£' menu="#url#/sub.menu" range="-1..-1">
	<a href="£url£"><img src="/img/arrow-left.gif"
	   width="14" height="35" border="0"/></a>&nbsp;
	<true/>
      </sb-output>
      <else>
	<a href="#url#"><img src="/img/arrow-left.gif"
	   width="14" height="35" border="0"/></a> <true/>&nbsp;
	 </else>
      <true/>
    </sb-output>
    <else>
      <img src="/img/arrow-left-dim.gif"
	   width="14" height="35" border="0"/>&nbsp;
    </else>
  </else>
</else>

<!-- ===== UP ===== -->
<catch>
  <sb-output menu="sub.menu" selected="selected">
    <throw>
      <a href="">
	<img src="/img/arrow-up.gif" width="24" height="35" border="0"/>
      </a>&nbsp;
    </throw>
  </sb-output>

  <throw>
    <a href="../">
      <img src="/img/arrow-up.gif" width="24" height="35" border="0"/>
    </a>&nbsp;
  </throw>
</catch>

<!-- ===== RIGHT ===== -->
<catch>
  <sb-output menu="sub.menu" below="below">
    <throw>
      <a href="#url#"><img src="/img/arrow-right.gif"
	 width="14" height="35" border="0"/></a>
    </throw>
  </sb-output>

  <sb-output below="below" menu="../top.menu">
    <throw>
      <a href="#url#"><img src="/img/arrow-right.gif"
	 width="14" height="35" border="0"/></a>
    </throw>
  </sb-output>

  <throw>
    <img src="/img/arrow-right-dim.gif"
	 width="14" height="35" border="0"/>&nbsp;
  </throw>
</catch></define>

      <navi/><img width="50" xsl:use-attribute-sets="spacer"/><br/><br/>

      <font size="-1">
	<emit source="dir" menu="sub.menu">
	  <if match="&_.selected; is selected">
	    <li><b>&_.title;</b></li>
	  </if>
	  <else>
	    <li><a href="&_.path;">&_.title;</a></li>
	  </else>
	</emit>
      </font>
      <br/>

      <!-- contents -->
      <td><img width="7" xsl:use-attribute-sets="spacer"/></td>
      <td valign="top" rowspan="2">

	<!-- add a page header (for most pages) -->
	<if variable="page.path is /index.xml"><h1>&page.title;</h1></if>

	<!-- insert the page contents (the div is for stylesheet fonts) -->
	<xsl:copy-of select="$content"/>
      </td>

    <!--</tr>-->
    <tr>
      <cond><!-- let the navi arrow pad show up at the bottom too mostly -->
	<case variable="page.path is /index.xml"><true/></case>
	<case variable="page.path is /roxen/index.xml"><true/></case>
	<default>
	  <td align="left" valign="bottom" nowrap="nowrap">
	    <navi/>
	  </td>
	</default>
      </cond>
    </tr>
</xsl:template>

</xsl:stylesheet>
