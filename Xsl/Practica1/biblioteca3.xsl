<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" version="4.0" encoding="UTF-8" indent="yes" />
  
   <!-- Plantilla raíz -->
  <xsl:template match="/">
    <html>
      <body>
          <xsl:apply-templates select="bib" />
      </body>
    </html>
  </xsl:template>

  <!-- Plantilla bib -->
  <xsl:template match="/bib">
    <table border="1">
	 <tr>
		<th>Precio</th>
		<th>Título</th>
		<th>Año</th>
     </tr>		
      <xsl:apply-templates select="libro" >
        <xsl:sort select="precio" order="ascending" data-type="number" />
      </xsl:apply-templates>
    </table>
  </xsl:template>

  <!-- Plantilla libro -->
  <xsl:template match="/bib/libro">
    <tr>
      <td><xsl:apply-templates select="precio" /></td>
      <xsl:choose>
        <xsl:when test="precio &gt; 100">
          <td style="background-color: red;"><xsl:apply-templates select="titulo" /></td>
        </xsl:when>
        <xsl:otherwise>
          <td><xsl:apply-templates select="titulo" /></td>
        </xsl:otherwise>
      </xsl:choose>
      <td><em><xsl:value-of select="@año" /></em></td>
    </tr>
  </xsl:template>

  <!-- Plantilla precio -->
  <xsl:template match="/bib/libro/precio">
    <xsl:value-of select="." /> €
  </xsl:template>

  <!-- Plantilla titulo -->
  <xsl:template match="/bib/libro/titulo">
    <xsl:value-of select="." />
  </xsl:template>

</xsl:stylesheet>