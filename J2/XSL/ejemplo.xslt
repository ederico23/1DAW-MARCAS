<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:template match="/">
        <html>
            <body>
                <!-- mostrar elementos -->
                <xsl:value-of select="nombre"/>    
                <xsl:value-of select = "@id"/>
                
                <!-- contar elementos -->
                <xsl:value-of select="count(artistas/artista)"/>
                
                <!-- recorrer elementos -->
                <xsl:for-each select = "streaming/artistas/artista">
                    <tr>
                        <td><xsl:value-of select="@id"/></td>
                        <td><xsl:value-of select="@nombre"/></td>
                        <td><xsl:value-of select="@pais_origen"/></td>
                    </tr>    
                </xsl:for-each>
                
                <!-- ordenar elementos -->                
                <xsl:for-each select = "streaming/artistas/artista">
                    <xsl:sort select="@nombre" order="ascending"> <!-- A-Z --></xsl:sort>    
                    <xsl:sort select="anio_lanzamiento" order="descending" data-type="number"> <!-- 10-0 --></xsl:sort>    
                </xsl:for-each>
                
                <!-!-- condicionales -->
                <xsl:if test="genero = 'Synthwave'">
                    
                </xsl:if>
                
                <xsl:if test="@plan = 'Premium'">
                    
                </xsl:if>
                
                <xsl:if test ="anion_lanzamiento &lt; 2018">
                    
                </xsl:if>
                
                <!-- condicional multiple -->
                <xsl:choose>
                    <xsl:when test="genero = 'Synthwave'">
                        <tr style="background-color: #FFF"></tr>
                    </xsl:when>
                    
                    <xsl:otherwise>
                        <tr></tr>
                    </xsl:otherwise>
                </xsl:choose>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>