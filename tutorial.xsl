<metadata>
 <datum name=author value="0">
 <datum name=description value="">
 <datum name=external_use value="">
 <datum name=http-content-type value="sitebuilder/xsl-template">
 <datum name=keywords value="">
 <datum name=language valuen=0>
 <datum name=multilang_status value="">
 <datum name=selectable value="yes">
 <datum name=stationery value="">
 <datum name=stationery_md_flags value="">
 <datum name=title value="Tutorial template">
 <datum name=xsl-params value64="tmtlMCE=">
</metadata>
<?xml version='1.0' encoding='ISO-8859-1'?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  rxml:copy-unknown-elements="yes">

  <!-- Site layout -->
  <xsl:import href="/templates/content.xsl"/>

  <!-- tutorial tags -->
  <xsl:import href="main.xsl"/>

  <xsl:output method="html" media-type="text/html" encoding="iso-8859-1"/>

<!-- default.xsl -->
<xsl:template match="/">
<xsl:text disable-output-escaping="yes"><![CDATA[
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">]]></xsl:text>
<html><head>
  <if variable="page.keywords">
    <meta name="keywords" content="&page.keywords;"/>
  </if>
  <if variable="page.description">
    <meta name="description" content="&page.description;"/>
  </if>
  <title>pike.ida.liu.se: &page.title;</title>
<style type="text/css">

body { font-family: arial, helvetica, sans-serif; font-size: 13px; }
blockquote { margin-bottom: 14px; }
h2         { margin-bottom: 4px; }
.diff      { padding: 6px }
.title     { font: 14px Arial, Helvetica; font-weight: bold; text-decoration: none }
td         { font-family: arial, helvetica, sans-serif; font-size: 13px; }
</style>

</head>

<body leftmargin="0" topmargin="0" bottommargin="0" rightmargin="0"
      marginheight="0" marginwidth="0" bgcolor="white" text="{$pike_gray_dark}" 
      link="{$pike_blue}" vlink="{$pike_blue}" alink="#002040" ::="&var.body;">
<a name="top"/>
<br/>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="0%">
      <img src="/R" alt="" width="10" height="1"/>
    </td>
    <td width="1%">
      <a href="/">
        <img src="/templates/img/pike_logo.gif" alt="pike.ida.liu.se"
             width="181" height="41" border="0" hspace="5"/>
      </a>
    </td>
    <td width="0%">
      <img src="/R" alt="" width="10" height="1"/>
    </td>
    <td width="99%">
      <table width="100%" align="center"
             border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="right" colspan="3">
           <gtext font="franklin gothic heavyoblique" bgcolor="white" black="t"
                  scale="0.38" fgcolor="{$pike_gray}" hspace="5" vspace="5">
             <xsl:text>Not logged in</xsl:text>
           </gtext>
          </td>
        </tr>
        <tr>
          <td width="1%" align="right">
            <img src="/templates/img/pike_line_left.gif" width="5" height="11"
                 alt="" border="0"/>
          </td>
          <td width="98%" background="/templates/img/pike_line_middle.gif">
            <img src="/R" width="11" height="11" alt=""/>
          </td>
          <td width="1%" align="left">
            <img src="/templates/img/pike_line_right.gif" width="5" height="11"
                 alt="" border="0"/>
          </td>
        </tr>
        <tr>
          <td align="right" colspan="2">
            <img src="/R" alt="" width="1" height="13" vspace="5"/>
          </td>
        </tr>
      </table>
    </td>
    <td width="0%">
      <img src="/R" alt="" width="10" height="1"/>
    </td>
  </tr>
  <tr>
    <td colspan="5">
      <img src="/R" alt="" width="1" height="5"/>
    </td>
  </tr>
</table>

<table width="1%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="white">
      <img src="/R" width="63" height="1" alt="" border="0"/>
    </td>
    <menu/>
  </tr>
</table>

<table width="1%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="white">
      <img src="/R" width="63" height="18" alt="" border="0" />
    </td>
    <submenu/>
  </tr>
</table>

<br clear="all"/>

<table width="100%" border="0" cellspacing="3" cellpadding="0">
  <tr>
    <td width="1%">
      <img src="/R" width="30" height="1" alt=""/>
    </td>

    <td width="1%">
      <img src="/R" width="15" height="1" alt="" border="0"/>
    </td>
      <td width="1%" align="left" valign="top">
      <table width="100%" border="0" cellspacing="3" cellpadding="0">
        <tr><td><xsl:apply-templates select="manual" mode="online"/></td></tr>
        <tr><td width="99%"><tent span="60"/></td></tr>
      </table>
    </td>

    <td width="99%">
      <img src="/R" width="1" height="1" alt=""/>
    </td>
  </tr>
</table>
</body>

</html>
</xsl:template>

</xsl:stylesheet>
