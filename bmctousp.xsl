<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml" indent="yes" version="1.0" encoding="UTF-8"/>

<xsl:template match="/">
	<dublin_core schema="usp">
		<dcvalue element="description" qualifier="volume" language="pt_BR"><xsl:value-of select="/art/fm/bibl/volume"/></dcvalue>
		<dcvalue element="description" qualifier="issue" language="pt_BR"><xsl:value-of select="/art/fm/bibl/issue"/></dcvalue>
		<dcvalue element="description" qualifier="initialpage" language="pt_BR"><xsl:value-of select="/art/fm/bibl/fpage"/></dcvalue>
		<dcvalue element="description" qualifier="lastpage" language="pt_BR"><xsl:value-of select="/art/fm/bibl/lpage"/></dcvalue>
		<xsl:for-each select="/art/fm/bibl/insg/ins">
			<dcvalue element="cruesp" qualifier="none" language="pt_BR"><xsl:value-of select="."/></dcvalue>
		</xsl:for-each>
		<xsl:for-each select="/art/fm/bibl/xrefbib/pubidlist/pubid">
		  <xsl:if test="@idtype = 'pmpid'">			
  		    <dcvalue element="origem" qualifier="id" language="pt_BR"><xsl:value-of select="."/></dcvalue>
		  </xsl:if>
		</xsl:for-each>
		<dcvalue element="origem" qualifier="none" language="pt_BR">BioMed Central</dcvalue>
		<dcvalue element="internacionalizacao" qualifier="none" language="pt_BR">Internacional</dcvalue>
	</dublin_core>
</xsl:template>

</xsl:stylesheet>
