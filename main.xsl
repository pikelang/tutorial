<metadata>
 <datum name=description value="">
 <datum name=http-content-type value="sitebuilder/xsl-template">
 <datum name=keywords value="">
 <datum name=language valuen=0>
 <datum name=multilang_status value="">
 <datum name=selectable value="yes">
 <datum name=stationery value="">
 <datum name=stationery_md_flags value="">
 <datum name=title value="Contains all content markup tags except index page tags.">
 <datum name=xsl-params value64="tmtlMCE=">
</metadata>
<?xml version="1.0"?>

<rxml:helptext>
This template should contain rules for <i>all</i> tags
in both online and print mode. It is inherited from
/xslt/online.xsl and /xslt/print.xsl, who only contain
rules that for technical reasons (e g output mode) need
to be in their own templates.
				       /jhs, 2001-02-14
</rxml:helptext>

<xsl:stylesheet>

  <!-- UTILITY FUNCTIONS -->

  <!-- adds ", niva [0-2]", dependent on the current tag's list nesting level -->
  <!-- FIXME: no errors given for nesting levels greater than 2 (current max) -->
  <xsl:template name="indention-level">
    <xsl:param name="subtract" select="0"/>
    <xsl:text> niva </xsl:text>
    <xsl:value-of select="count(ancestor::list)
			+ count(parent::note)
			+ count(ancestor-or-self::rxmlentity)
			- $subtract"/>
  </xsl:template>

  <!-- writes the (context dependent) paragraph type name (of a text body) -->
  <!-- (different names dependent on surrounding tags; lists/items/tables) -->
  <xsl:template name="brödtext">
    <xsl:choose>
      <!-- a definition list item header -->
      <xsl:when test="(self::item and parent::list/@type = 'dl') or (self::rxmlentity)">
	<xsl:text>definitionslista</xsl:text>
      </xsl:when>

      <!-- a special-type list item (an enumerated item or dotted item) -->
      <!-- (paragraphs in definition lists go in the body clause below) -->
      <xsl:when test="parent::item and
		      count(preceding-sibling::*) = 0 and
		      ../parent::list/@type != 'dl'">
	<xsl:choose>
	  <xsl:when test="parent::item/parent::list/@type = 'ul'">punktat</xsl:when>
	  <xsl:when test="parent::item/parent::list/@type = 'ol'">
	    <xsl:text>numrerat element </xsl:text>
	    <xsl:choose>
	      <xsl:when test="name(../preceding-sibling::*[1]) = 'item'">n</xsl:when>
	      <xsl:otherwise>1</xsl:otherwise>
	    </xsl:choose>
	  </xsl:when>
	</xsl:choose>
      </xsl:when>

      <!-- common <p>, <note> and example tags (inside lists or table cells) -->
      <xsl:otherwise>
	<xsl:if test="parent::c">
	  <xsl:text>cell </xsl:text>
	</xsl:if>
	<xsl:choose>
	  <xsl:when test="parent::note">note</xsl:when>
	  <xsl:otherwise>
	    <xsl:if test="name() = 'example'">obrutet </xsl:if>
	    <xsl:text>brodtextelement </xsl:text>
	    <xsl:choose>
	      <xsl:when test="name() = 'example'">1</xsl:when>
	      <!-- the "or ..." line is purely experimental to try out less padding -->
	      <xsl:when test="name(preceding-sibling::*[1]) = name()
			      or parent::attribute">n</xsl:when>
	      <xsl:otherwise>1</xsl:otherwise>
	    </xsl:choose>
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:call-template name="indention-level"/>
  </xsl:template>


  <!-- TEMPLATE RULES -->

  <xsl:template mode="online" match="h1">
    <h2><xsl:value-of select="."/></h2>
  </xsl:template>

  <xsl:template mode="print" match="h1">
    <Para name="underrubrik"><xsl:apply-templates mode="print"/></Para>
    <xsl:value-of select="'&#10;&#10;'"/>
  </xsl:template>


  <xsl:template mode="online" match="p">
    <p><xsl:apply-templates mode="online"/></p>
  </xsl:template>

  <!-- p tags (possibly inside lists or tables) -->
  <xsl:template mode="print" match="p">
    <Para>
      <xsl:attribute name="name">
	<xsl:call-template name="brödtext"/>
      </xsl:attribute>
      <xsl:apply-templates mode="print"/>
    </Para>
    <xsl:value-of select="'&#10;'"/>
  </xsl:template>

  <!-- for the leader of some pages -->
  <xsl:template mode="online" match="summary">
    <table bgcolor="black" border="0" cellpadding="1" cellspacing="0"><tr><td>
      <table border="0" cellpadding="5" cellspacing="0" bgcolor="#eeeeee" width="100%">
	<tr><td><xsl:apply-templates mode="online"/></td></tr>
      </table></td></tr>
    </table>
  </xsl:template>

  <!-- TODO: ought to be boxed or similar -->
  <xsl:template mode="print" match="summary">
    <Para name="summary"><xsl:apply-templates mode="print"/></Para>
    <xsl:value-of select="'&#10;'"/>
  </xsl:template>


  <!-- LISTS -->

  <!-- FIXME! <list> illegal as first item of an <item>! -->
  <xsl:template mode="online" match="list">
    <xsl:choose>
      <xsl:when test="@type = 'ul' | @type = 'ol' | @type = 'dl'">
	<xsl:element name="{@type}">
	  <xsl:apply-templates select="item" mode="online"/>
	</xsl:element>
      </xsl:when>
      <xsl:otherwise>
	<xsl:call-template name="error">
	  <xsl:with-param name="msg" select="'illegal list type'"/>
	</xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- the list tag is handled from item through peeking upwards -->
  <xsl:template mode="print" match="list">
    <xsl:apply-templates mode="print"/>
  </xsl:template>


  <xsl:template mode="online" match="item">
    <xsl:choose>
      <xsl:when test="ancestor::list[1]/@type = 'dl'">
	<xsl:choose>
	  <xsl:when test="@name">
	    <dt><b><xsl:value-of select="@name"/></b></dt>
	    <dd><xsl:apply-templates mode="online"/></dd>
	  </xsl:when>
	  <xsl:otherwise>
	    <!-- erase the following soon as error reporting works: -->
	    <dd><xsl:apply-templates mode="online"/></dd>
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:when>
      <xsl:otherwise>
	<li>
	  <xsl:if test="@name">
	    <b><xsl:value-of select="@name"/></b><br/>
	  </xsl:if>
	  <xsl:choose><!-- Kenneth vill inte ha luft. -->
	    <xsl:when test="p and (count(node()) = 1)">
	      <xsl:apply-templates mode="online"/>
	    </xsl:when>
	    <xsl:otherwise>
	      <xsl:apply-templates mode="online"/>
	    </xsl:otherwise>
	  </xsl:choose>
	</li>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="not( ../@style = 'short')">
      <p></p>
    </xsl:if>
  </xsl:template>

  <!-- Render items of the list's type. Recursive lists unsupported! (3 levels?) -->
  <xsl:template mode="print" match="item">
    <xsl:if test="ancestor::list[1]/@type = 'dl'">
      <Para>
	<xsl:attribute name="name">
	  <xsl:call-template name="brödtext"/>
	</xsl:attribute>
	<xsl:value-of select="@name"/>
      </Para><xsl:value-of select="'&#10;'"/>
    </xsl:if>
    <xsl:apply-templates mode="print"/>
  </xsl:template>


  <xsl:template mode="online" match="br"><br/></xsl:template>
  <xsl:template mode="print" match="br"><Char name="br"/></xsl:template>


  <xsl:template mode="online" match="a">
    <a>
      <xsl:if test="@href">
	<xsl:attribute name="href">
	  <xsl:value-of select="@href"/>
	</xsl:attribute>
      </xsl:if>
      <xsl:if test="@name">
	<xsl:attribute name="name">
	  <xsl:value-of select="@name"/>
	</xsl:attribute>
      </xsl:if>
      <xsl:apply-templates mode="online"/>
    </a>
  </xsl:template>

  <xsl:template mode="print" match="a">
    <xsl:apply-templates mode="print"/>
  </xsl:template>


  <!-- fetch the caption of the current <image> -->
  <xsl:template name="image-caption">
    <xsl:choose>
      <xsl:when test="@caption">
	<xsl:value-of select="@caption"/>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="rxml:metadata(concat('./',@src))/file/title"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template mode="online" match="image">
    <p>
      <xsl:choose>
	<xsl:when test="@type = 'fullshot'">
	  <rxml:emit source="cimg" src="{@src}">
	    <a href="{@src}" target="image" onClick='miniwindow("{@src}","image",&_.xsize;,&_.ysize;);'><cimg border="0" src="{@src}" scale="0.5" alt="" /></a>
	  </rxml:emit>
	</xsl:when>
	<xsl:otherwise>
	  <img src="{@src}" alt=""/>
	</xsl:otherwise>
      </xsl:choose><br/>
      <i><xsl:call-template name="image-caption"/></i>
    </p>
  </xsl:template>

  <!-- images -->
  <xsl:template mode="print" match="image">
    <Para>
      <xsl:attribute name="name">
	<xsl:call-template name="brödtext"/>
      </xsl:attribute>
      <Frame>
  	<Image file="{@src}"/>
      </Frame>
      <Font name="caption">
        <xsl:call-template name="image-caption"/>
      </Font>
    </Para><xsl:value-of select="'&#10;'"/>
  </xsl:template>



  <!-- PURELY FORMATTING MARKUP -->

  <xsl:template mode="online" match="i">
    <i><xsl:apply-templates mode="online"/></i>
  </xsl:template>

  <xsl:template mode="print" match="i">
    <Font name="I"><xsl:apply-templates mode="print"/></Font>
  </xsl:template>


  <xsl:template mode="online" match="tt">
    <tt><xsl:apply-templates mode="online"/></tt>
  </xsl:template>

  <xsl:template mode="print" match="tt">
    <Font name="TT"><xsl:apply-templates mode="print"/></Font>
  </xsl:template>


  <xsl:template mode="online" match="b">
    <b><xsl:apply-templates mode="online"/></b>
  </xsl:template>

  <xsl:template mode="print" match="b">
    <Font name="B"><xsl:apply-templates mode="print"/></Font>
  </xsl:template>

  <xsl:template mode="online" match="pre">
    <xsl:choose>
      <xsl:when test="@type = 'cmd'">
	<table width="100%"><tr><td bgcolor="#DDDDDD">
	  <tt><autoformat><xsl:apply-templates mode="online"/></autoformat></tt>
	</td></tr></table>
      </xsl:when>
      <xsl:when test="@type = 'img'">
	<table width="100%"><tr><td bgcolor="#DDDDDD">
	  <tt><autoformat><xsl:apply-templates mode="online"/></autoformat></tt>
	</td></tr></table>
      </xsl:when>
      <xsl:otherwise>
	<tt><autoformat><xsl:apply-templates mode="online"/></autoformat></tt>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="@caption">
      <i><xsl:value-of select="@caption"/></i>
    </xsl:if>
  </xsl:template>

  <!-- TODO: <interactive> should make a box round its contents -->
  <xsl:template mode="print" match="pre | pi | interactive">
    <xsl:choose>
      <xsl:when test="name(..) = 'manual' or name(..) = 'item'">
	<Para>
	  <xsl:attribute name="name">
	    <xsl:call-template name="brödtext"/>
	  </xsl:attribute>
	  <Font name="TT"><nbsp>
	    <xsl:apply-templates mode="print"/>
	  </nbsp></Font>
	</Para>
      </xsl:when>
      <xsl:otherwise>
	<Font name="TT"><nbsp>
	  <xsl:apply-templates mode="print"/>
	</nbsp></Font>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:value-of select="'&#10;'"/>
  </xsl:template>


  <!-- pi (och för den delen övriga taggar i regeln inunder) implementeras av modulen
  manualtags.pike
  (radbrutna <pi>-taggar blir <tt><pre>...</pre></tt>, övriga bara <tt>..</tt>) -->

  <xsl:template mode="online" match="interactive|in|out|pi">
    <xsl:copy-of select="."/>
  </xsl:template>


  <!-- TODO: Use coloring/fontification instead -->
  <xsl:template mode="print" match="in">
    <xsl:apply-templates mode="print"/>
  </xsl:template>

  <xsl:template mode="print" match="out">
    <xsl:apply-templates mode="print"/>
  </xsl:template>

  <!-- TODO: Use coloring/fontification instead -->
  <xsl:template mode="print" match="manual/in | manual/out">
    <Para>
      <xsl:attribute name="name">
	<xsl:call-template name="brödtext"/>
      </xsl:attribute>
      <nbsp>
	<xsl:value-of select="concat(name(), 'put: ')"/>
	<xsl:apply-templates mode="print"/>
      </nbsp>
    </Para><xsl:value-of select="'&#10;'"/>
  </xsl:template>

  <!-- TODO: don't forget to add a pi tag too for the above! -->


  <!-- TABLE SUPPORT TAGS -->

  <xsl:template mode="online" match="xtable">
    <table border="1" cellpadding="2" cellspacing="0">
      <xsl:apply-templates select="row|product" mode="online"/>
    </table>
  </xsl:template>

  <xsl:template mode="print" match="xtable">
    <Para>
      <xsl:attribute name="name">
	<xsl:call-template name="brödtext"/>
      </xsl:attribute>
      <Table name="Format A" title="">
	<xsl:for-each select="row[position()=last()]/c">
	  <ColDef width="1%"/>
	</xsl:for-each>
	<xsl:apply-templates mode="print" select="row|product"/>
      </Table>
    </Para><xsl:value-of select="'&#10;&#10;'"/>
  </xsl:template>


  <xsl:template mode="online" match="xtable/row">
    <tr>
      <xsl:apply-templates select="c|h" mode="online"/>
    </tr>
  </xsl:template>

  <xsl:template mode="print" match="xtable/row">
    <Row>
      <xsl:if test="count(h) != 0">
	<xsl:attribute name="type">heading</xsl:attribute>
	<!-- other <Row> type options are "footing" and (impied:) "normal" -->
      </xsl:if>
      <xsl:apply-templates mode="print" select="c|h"/>
    </Row>
    <xsl:value-of select="'&#10;'"/>
  </xsl:template>


  <xsl:template mode="online" match="xtable/row/h">
    <xsl:choose>
      <xsl:when test="@src">
	<th><imgs src="{@src}"/></th>
      </xsl:when>
      <xsl:otherwise>
	<th><xsl:apply-templates mode="online"/></th>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template mode="print" match="xtable/row/h">
    <Cell>
      <Para name="cell, rubrik">
	<xsl:apply-templates mode="print"/>
      </Para>
    </Cell>
  </xsl:template>


  <xsl:template mode="online" match="xtable/row/c">
    <xsl:choose>
      <xsl:when test="@src">
	<td><imgs src="{@src}"/></td>
      </xsl:when>
      <xsl:otherwise>
	<td>
	  <xsl:choose>
	    <!-- help netscape render empty table cells -->
	    <!-- FIXME: make this an error with warning -->
	    <xsl:when test="count(*) = 0">&nbsp;</xsl:when>
	    <xsl:otherwise>
	      <xsl:apply-templates mode="online"/>
	    </xsl:otherwise>
	  </xsl:choose>
	</td>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template mode="print" match="xtable/row/c">
    <Cell><xsl:apply-templates mode="print"/></Cell>
  </xsl:template>


  <!-- EXOTIC MAGIC TAGS -->

  <xsl:template mode="online" match="lang">
    <emit source="known-langs" sort="englishname">
      &_.id; (for &_.englishname;)<br/>
    </emit>
  </xsl:template>

  <xsl:template mode="print" match="lang">
    <emit source="known-langs" sort="englishname">
      &_.id; (for &_.englishname;)<Char name="br"/>
    </emit>
  </xsl:template>


  <!-- Old /xslt/common.xsl: -->

  <xsl:template mode="online" match="comment"/>
  <xsl:template mode="print"  match="comment"/>

  <!-- throw away all processing instructions and SGML style comments -->
  <xsl:template mode="online" match="processing-instruction()"/>
  <xsl:template mode="print" match="processing-instruction()"/>
  <xsl:template mode="online" match="node()[comment()]"/>
  <xsl:template mode="print" match="node()[comment()]"/>

  <!--
    <if ppoint=... case="insensitive"> som används nedan
    är ett specialhack i manualserverns sbtags för att det
    ska gå att skriva <product name="platform"> trots att
    RXML-skyddspunkten heter Platform.	  /jhs, 2000-09-29
  -->
  <xsl:template name="product">
    <xsl:param name="contents" select="''"/>
    <xsl:if test="string-length(@name) = 0">
      <xsl:if test="rxml:cookie('dumpmode') != 'yes'">
	<font color="red">&lt;product&gt; tag lacks name attribute!</font>
      </xsl:if>
    </xsl:if>
    <xsl:variable name="access">
      <rxml:parse>
	<if ppoint="{@name}" none="none" case="insensitive">denied</if>
      </rxml:parse>
    </xsl:variable>
    <xsl:if test="not($access = 'denied')">
      <xsl:copy-of select="$contents"/>
    </xsl:if>
  </xsl:template>

  <!-- Markup tracking -->

  <xsl:template mode="track" match="text()"></xsl:template>

  <xsl:template mode="track" match="/">
    <sqlquery query="DELETE FROM markup WHERE path='&page.path:mysql;'"/>
    <xsl:apply-templates mode="track"/>
  </xsl:template>

  <xsl:template mode="track" match="* | processing-instruction() | comment()">
    <define variable="var.tagname">
      <xsl:choose>
	<xsl:when test="self::comment()">!--</xsl:when><?comment -- ?>
	<xsl:when test="self::processing-instruction()">?<xsl:value-of select="name(.)"/></xsl:when>
	<xsl:otherwise>
	  <xsl:value-of select="name(.)"/>
	</xsl:otherwise>
      </xsl:choose>
    </define>
    <define variable="var.parent">
      <xsl:value-of select="name(..)"/>
    </define>
    <emit query="SELECT id FROM markup
    WHERE tag='&var.tagname:mysql;' AND parent='&var.parent:mysql;'
      AND path='&page.path:mysql;'" source="sql">
      <sqlquery query="UPDATE markup SET n=n+1 WHERE id=&sql.id;"/>
    </emit>#<else>
      <sqlquery query="INSERT INTO markup (path,tag,parent,n)
	 VALUES ('&page.path:mysql;','&var.tagname:mysql;','&var.parent:mysql;',1)"/>
    </else>
    <xsl:apply-templates mode="track"/>
  </xsl:template>

  <!-- Terminology definitions and referencing -->
  <!-- (see also list[@type = 'dl']/item[@def = 'term']) -->
  <xsl:template name="define-term">
    <xsl:param name="term"/>
    <define variable="var.name"><xsl:call-template name="make-marker">
      <xsl:with-param name="term" select="$term"/>
    </xsl:call-template></define>
    <emit query="SELECT id FROM terms WHERE name='&var.name:mysql;'" source="sql">
      <sqlquery query="UPDATE terms SET path='&page.path:mysql;' WHERE id=&sql.id;"/>
    </emit>
    <else>
      <sqlquery query="INSERT INTO terms (name,path)
	 VALUES ('&var.name:mysql;','&page.path:mysql;')"/>
    </else>
  </xsl:template>

  <!-- Normalize (lower-case nad whitespace trim) $term -->
  <xsl:template name="make-marker">
    <xsl:param name="term"/>
    <xsl:variable name="marker">
      <rxml:parse>
	<case case="lower">
	  <xsl:value-of select="$term"/>
	</case>
      </rxml:parse>
    </xsl:variable>
    <xsl:value-of select="normalize-space($marker)"/>
  </xsl:template>

  <!-- Generate a marker <a name="$term"></a> -->
  <xsl:template name="make-a-name">
    <xsl:param name="term"/>
    <xsl:param name="contents" select="''"/>
    <a>
      <xsl:attribute name="name">
	<xsl:call-template name="make-marker">
	  <xsl:with-param name="term" select="$term"/>
	</xsl:call-template>
      </xsl:attribute>
      <xsl:value-of select="$contents"/>
    </a>
  </xsl:template>

  <!-- <def term="term name"/> or	-->
  <!-- <def>term name</def> if you like -->
  <xsl:template mode="online" match="def">
    <!-- set $term from arguments/contents -->
    <xsl:choose>
      <xsl:when test="string-length(.) &gt; 0">
	<xsl:variable name="term" select="."/>
      </xsl:when>
      <!-- FIXME: this case is an error; log it!
      <xsl:when test="string-length(@term) = 0">
	<error!>
      </xsl:when>-->
      <xsl:otherwise>
	<xsl:variable name="term" select="@term"/>
      </xsl:otherwise>
    </xsl:choose>

    <!-- save term to database -->
    <xsl:call-template name="define-term">
      <xsl:with-param name="term" select="$term"/>
    </xsl:call-template>

    <!-- make an a tag round the tag -->
    <xsl:call-template name="make-a-name">
      <xsl:with-param name="contents" select="."/>
      <xsl:with-param name="term" select="$term"/>
    </xsl:call-template>
  </xsl:template>


  <xsl:template mode="print" match="def">
    <xsl:apply-templates mode="print"/>
  </xsl:template>
  <!-- Do nothing in particular, but don't stash it either! -->
  <!-- (as was with xsl:template mode="print" match="def"/> -->

  <!-- <ref to="term">link name</ref> -->
  <!-- or <ref>term</ref> if you like -->
  <xsl:template mode="online" match="ref">
    <!-- the title of the generated link -->
    <xsl:variable name="title" select="."/>

    <!-- the normalized name of the anchor -->
    <xsl:variable name="marker">
      <xsl:call-template name="make-marker">
	<xsl:with-param name="term">
	  <xsl:choose>
	    <xsl:when test="@to">
	      <xsl:value-of select="@to"/>
	    </xsl:when>
	    <xsl:otherwise>
	      <xsl:value-of select="."/>
	    </xsl:otherwise>
	  </xsl:choose>
	</xsl:with-param>
      </xsl:call-template>
    </xsl:variable>

    <!-- the path where the term was defined -->
    <xsl:variable name="path">
      <rxml:parse><emit source="sql">
	<xsl:attribute name="query">
	  <xsl:text>SELECT path FROM terms WHERE name='</xsl:text>
	  <xsl:value-of select="$marker"/>
	  <xsl:text>' LIMIT 1</xsl:text>
	</xsl:attribute>
	<xsl:text>&sql.path;</xsl:text>
      </emit></rxml:parse>
    </xsl:variable>

    <xsl:choose>
      <xsl:when test="string-length($path) &gt; 0">
	<i><a>
	  <xsl:attribute name="href">
	    <xsl:value-of select="$path"/>
	    <xsl:text>#</xsl:text>
	    <xsl:value-of select="$marker"/>
	  </xsl:attribute>
	  <xsl:value-of select="$title"/>
	</a></i>
      </xsl:when>
      <xsl:otherwise>
	<xsl:call-template name="log-error">
	  <xsl:with-param name="msg">
	    <xsl:text>Illegal reference to "</xsl:text>
	    <xsl:value-of select="$marker"/>
	    <xsl:text>"!</xsl:text>
	  </xsl:with-param>
	</xsl:call-template>
	<xsl:value-of select="$title"/><!-- FIXME: remove when working -->
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template mode="print" match="ref">
    <Font name="TT">
      <xsl:value-of select="."/>
    </Font>
  </xsl:template>

  <!-- Error logging -->

  <!-- note that the 404 message of the server also accesses this db -->
  <xsl:template name="really-log-error">
    <xsl:param name="msg" rxml:type="string" select="''"/>
    <xsl:param name="ancestry" rxml:type="string" select="''"/>
    <rxml:define variable="var.mesg"><xsl:value-of select="$msg"/></rxml:define>
    <rxml:define variable="var.path"><xsl:value-of select="$ancestry"/></rxml:define>
    <rxml:if not="not" variable="var.error">
      <rxml:define variable="var.error"> </rxml:define>
      <sqlquery query="DELETE FROM errorlog WHERE page='&page.url:mysql;'" />
      <sqlquery query="INSERT INTO errorlog (userid,page,xpath,msg)
		VALUES(&user.userid;,'&page.url:mysql;','&var.path:mysql;','&var.mesg:mysql;')"/>
    </rxml:if>
  </xsl:template>

  <!-- Just log the error -->
  <xsl:template name="obsoleted-log-error">
    <xsl:param name="msg" rxml:type="string" select="''" />
    <xsl:if test="rxml:cookie('dumpmode') != 'yes'">
      <font color="red">
        <xsl:value-of select="$msg"/>
      </font>
      <!-- <xsl:call-template name="really-log-error">
  	<xsl:with-param name="msg" select="$msg"/>
  	<xsl:with-param name="ancestry">
  	  <xsl:call-template name="show-ancestry"/>
  	</xsl:with-param>
      </xsl:call-template> -->
    </xsl:if>
  </xsl:template>

  <xsl:template name="log-path">
    <xsl:param name="name"/>
    <xsl:param name="modid"/>
    <xsl:param name="table"/>

    <!-- only top-of-page autodoc targets exist in the tables, thus: -->
    <!-- Must be fixed to the new table looks before it'll work:
    <xsl:if test="name(..) = 'autodocpage'">
      <set variable="var.name" value="{$name}"/>
      <set variable="var.modid" value="{$modid}"/>
      <if variable="page.path != /print/*">
	<sqlquery>
	  <xsl:attribute name="query">
	    <xsl:text>UPDATE </xsl:text>
	    <xsl:value-of select="$table"/>
	    <xsl:text> SET path='&page.path:mysql;' </xsl:text>
	    <xsl:text>WHERE name='&var.name:mysql;'</xsl:text>
	    <xsl:if test="string-length($modid) != 0">
	      <xsl:text> AND module='&var.modid:mysql;'</xsl:text>
	    </xsl:if>
	  </xsl:attribute>
	</sqlquery>
      </if>
    </xsl:if>
    -->
  </xsl:template>


  <!-- some error detection / reporting that needs to be final -->

  <!-- javadoc uses A|B|b|BR|center|CODE|code|DD|DL|DT|FONT|H2|H3|li|P|p|PRE|TABLE|TD|TITLE|TR|tt|ul -->
  <xsl:template mode="online" match="code|center|dd|dl|dt|font|h2|h3|li|title|table|td|tr|ul">
    <!-- /roxen/*/programmer/java/*.html -->
    <xsl:choose>
      <xsl:when test="contains(rxml:metadata()/path, '/programmer/java/')">
        <xsl:copy>
          <xsl:copy-of select="@*"/>
          <xsl:apply-templates mode="online"/>
        </xsl:copy>
      </xsl:when>
      <xsl:otherwise>
    	<xsl:call-template name="error">
    	  <xsl:with-param name="msg" select="'illegal tag'"/>
    	</xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- detect unsupported tags
  <xsl:template mode="online" match="*">
    <xsl:call-template name="error">
      <xsl:with-param name="msg" select="'illegal tag!'"/>
    </xsl:call-template>
  </xsl:template>-->
</xsl:stylesheet>
