<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
    
    <xsl:template match="/">
        <html>
            <body>
                <h1>Lista de Libros</h1>
                <table>
                    <tr>
                        <th>Título</th>
                        <th>Autor</th>
                        <th>Precio</th>
                    </tr>
                    <xsl:for-each select="tienda/libro">
                        <xsl:sort select="precio" data-type="number" order= "ascending"/>
                        <xsl:choose>
                            <xsl:when test="precio > 100">
                                <tr style="color:red">
                                    <td><xsl:value-of select="titulo"/></td>
                                    <td><xsl:value-of select="autor"/></td>
                                    <td><xsl:value-of select="precio"/></td>
                                </tr>
                            </xsl:when>
                            <xsl:otherwise>
                                <tr>
                                    <td><xsl:value-of select="titulo"/></td>
                                    <td><xsl:value-of select="autor"/></td>
                                    <td><xsl:value-of select="precio"/></td>
                                </tr>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>
