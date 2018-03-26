<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output omit-xml-declaration="yes" indent="yes" />
	<xsl:template match="/">
		<xsl:apply-templates />
	</xsl:template>
	<xsl:template match="site">
		<website id="{@id}" name="{@name}">
			<xsl:apply-templates select="views/view" />
		</website>
	</xsl:template>
	<xsl:template match="views/view">
		<page id="{@id}" name="{@name}">
			<description>
				<xsl:value-of select="description" />
			</description>
			<xsl:for-each select="component">
				<widget>
					<xsl:attribute name="id"><xsl:value-of
						select="@ref" /></xsl:attribute>
					<xsl:variable name="ID" select="@ref" />
					<xsl:variable name="TYPE" select=". | //component[@id = $ID]/@type" />
					<xsl:attribute name="type"><xsl:apply-templates
						select=". | //component[@id = $ID]/@type" /></xsl:attribute>
					<xsl:if test="$TYPE = 'TEXT'">
						<text>
							<xsl:value-of select="../../../components/component/text" />
						</text>
					</xsl:if>
					<xsl:if test="$TYPE = 'IMG'">
						<xsl:attribute name="src"><xsl:value-of
							select="../../../components/component/@src" /></xsl:attribute>
					</xsl:if>
					<xsl:if test="$TYPE = 'YOUTUBE'">
						<xsl:attribute name="url"><xsl:value-of
							select="../../../components/component/@url" /></xsl:attribute>
					</xsl:if>
					<xsl:if test="$TYPE = 'BUTTON'">
						<xsl:attribute name="label"><xsl:value-of
							select="../../../components/component/@label" /></xsl:attribute>
					</xsl:if>
				</widget>
			</xsl:for-each>
		</page>
	</xsl:template>
</xsl:stylesheet>


