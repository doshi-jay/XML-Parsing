<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />
	<xsl:template match="/">
		<style>
			table {
			border-collapse:
			collapse;
			width: 100%;
			}

			td, th {
			border:
			1px solid #dddddd;
			text-align:
			left;
			padding: 8px;
			}

		</style>
		<h1> Website </h1>
		<h2> Pages </h2>
		<ol>
			<xsl:for-each select="website/page">
				<li>
					<xsl:value-of select="@name" />
					,
					<xsl:value-of select="description" />
				</li>
			</xsl:for-each>
		</ol>
		<h2> Widgets </h2>
		<table>
			<thead>
				<tr>
					<th>id</th>
					<th>type</th>
					<th>text</th>
					<th>src</th>
					<th>url</th>
					<th>label</th>
				</tr>
			</thead>
			<tbody>
				<xsl:apply-templates select="website/page">
				</xsl:apply-templates>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="page">
		<xsl:for-each select="widget">
			<tr>
				<td>
					<xsl:value-of select="@id" />
				</td>
				<td>
					<xsl:value-of select="@type" />
				</td>
				<td>
					<xsl:value-of select="text" />
				</td>
				<td>
					<xsl:value-of select="@src" />
				</td>
				<td>
					<xsl:value-of select="@url" />
				</td>
				<td>
					<xsl:value-of select="@label" />
				</td>
			</tr>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>