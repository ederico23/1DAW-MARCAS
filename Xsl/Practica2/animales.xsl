<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <body>
        <h1>Listado del Zoo</h1>
        <p>Total de animales: <xsl:value-of select="count(//animal)"/></p>
        
        <table border="1">
          <tr bgcolor="#cccccc">
            <th>Nombre</th>
            <th>Especie</th>
            <th>Hábitat</th>
            <th>Edad</th>
            <th>Extras</th>
          </tr>
          <xsl:apply-templates select="//animal"/>
        </table>

        <h2>Cuidadores</h2>
        <ul><xsl:apply-templates select="//cuidador"/></ul>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="animal">
    <tr>
      <xsl:if test="tipo='marino'">
        <xsl:attribute name="style">background-color: #add8e6;</xsl:attribute>
      </xsl:if>

      <td>
        <xsl:choose>
          <xsl:when test="tipo='ave'"><i><xsl:value-of select="@nombre"/></i></xsl:when>
          <xsl:otherwise><xsl:value-of select="@nombre"/></xsl:otherwise>
        </xsl:choose>
      </td>
      <td><xsl:value-of select="especie"/></td>
      <td><xsl:value-of select="tipo"/></td>
      <td><xsl:value-of select="2024 - fecha_nac/anno"/></td>
      <td>
        <xsl:if test="count(crias/id_cria) > 2">Familia Numerosa</xsl:if>
      </td>
    </tr>
  </xsl:template>

  <xsl:template match="cuidador">
    <li><xsl:value-of select="nombre"/> - <xsl:value-of select="especialidad"/></li>
  </xsl:template>
</xsl:stylesheet>