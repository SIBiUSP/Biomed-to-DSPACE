<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml" indent="yes" version="1.0" encoding="UTF-8"/>

<xsl:template match="/">
	<dublin_core schema="dc">
		<dcvalue element="contributor" qualifier="none" language="pt_BR">UNIVERSIDADE DE SÃO PAULO</dcvalue>
		<dcvalue element="type" qualifier="none" language="pt_BR">article</dcvalue>
		<dcvalue element="language" qualifier="iso" language="pt_BR">eng</dcvalue>
		<dcvalue element="title" qualifier="none" language="pt_BR"><xsl:value-of select="/art/fm/bibl/title"/></dcvalue>
		<xsl:for-each select="/art/fm/bibl/aug/au">
			<dcvalue element="contributor" qualifier="author" language="pt_BR"><xsl:value-of select="snm" />,&#160;<xsl:value-of select="fnm" />&#160;<xsl:value-of select="mi" /></dcvalue>
		</xsl:for-each>
		<dcvalue element="relation" qualifier="ispartof" language="pt_BR"><xsl:value-of select="/art/fm/bibl/source"/></dcvalue>
		<dcvalue element="identifier" qualifier="issn" language="pt_BR"><xsl:value-of select="/art/fm/bibl/issn"/></dcvalue>
		<dcvalue element="date" qualifier="issued" language="pt_BR"><xsl:value-of select="/art/fm/bibl/pubdate"/></dcvalue>
		<dcvalue element="identifier" qualifier="other" language="pt_BR"><xsl:value-of select="/art/ui"/></dcvalue>
		<dcvalue element="identifier" qualifier="url" language="pt_BR"><xsl:value-of select="/art/fm/bibl/url"/></dcvalue>
		<xsl:for-each select="/art/fm/bibl/xrefbib/pubidlist/pubid">
		  <xsl:if test="@idtype = 'doi'">			
  		    <dcvalue element="identifier" qualifier="doi" language="pt_BR"><xsl:value-of select="."/></dcvalue>
		  </xsl:if>
		</xsl:for-each>
		<dcvalue element="description" qualifier="abstract" language="pt_BR">
		  <xsl:choose>
		    <xsl:when test="/art/fm/abs/sec/sec">
		          <xsl:value-of select="/art/fm/abs/descendant::sec"/>
                    </xsl:when>
		    <xsl:otherwise>
		      <xsl:value-of select="/art/fm/abs/sec/p"/>
		    </xsl:otherwise>
                  </xsl:choose>
		</dcvalue>
		<xsl:for-each select="/art/bm/ack/sec/p">
			<dcvalue element="description" qualifier="sponsorship" language="pt_BR"><xsl:value-of select="." /></dcvalue>
		</xsl:for-each>
		<dcvalue element="rights" qualifier="none" language="pt_BR">openAccess</dcvalue>
		<xsl:for-each select="/art/fm/cpyrt">
			<dcvalue element="rights" qualifier="holder" language="pt_BR"><xsl:value-of select="concat(collab,' - ',note)"/></dcvalue>
		</xsl:for-each>
		
		</dublin_core>
</xsl:template>

</xsl:stylesheet>
