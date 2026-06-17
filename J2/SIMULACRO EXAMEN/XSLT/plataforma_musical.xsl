<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
        <html lang="es">
            <head>
                <meta charset="UTF-8"/>
                <title>Catalogo Musical</title>
                <style>
                    body { font-family: Arial, sans-serif; margin: 20px; background-color: #f9f9f9; }
                    table { border-collapse: collapse; width: 80%; margin-bottom: 30px; background-color: white; }
                    th, td { border: 1px solid #ccc; padding: 10px; text-align: left; }
                    th { background-color: #333; color: white; }
                </style>
            </head>
            <body>
                <h1>Plataforma Musical - Catalogo Completo</h1>
                <p><strong>Total de artistas registrados: </strong><xsl:value-of select="count(streaming/artistas/artista)"/></p>
                <h2>Artistas</h2>
                <table>
                    <tr><th>ID</th><th>Nombre Artista</th><th>Pais origen</th></tr>
                    <xsl:for-each select="streaming/artistas/artista">
                        <xsl:sort select="@nombre" order="ascending"/>
                        <tr>
                            <td><xsl:value-of select="@id"/></td>
                            <td><xsl:value-of select="@nombre"/></td>
                            <td><xsl:value-of select="@pais_origen"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
                <h2>Albumes</h2>
                <table>
                    <tr><th>Titulo del Album</th><th>Anio lanzamiento</th><th>Genero</th></tr>
                    <xsl:for-each select="streaming/albumes/album">
                        <xsl:sort select="anio_lanzamiento" order="descending" data-type="number"/>
                        <xsl:choose>
                            <xsl:when test="genero = 'Synthwave'">
                                <tr style="background-color: #E6E6FA">
                                    <td><xsl:value-of select="@titulo"/><xsl:if test="anio_lanzamiento &lt; 2018"> (Clasico)</xsl:if></td>
                                    <td><xsl:value-of select="anio_lanzamiento"/></td>
                                    <td><xsl:value-of select="genero"/></td>
                                </tr>
                            </xsl:when>
                            <xsl:otherwise>
                                <tr>
                                    <td><xsl:value-of select="@titulo"/><xsl:if test="anio_lanzamiento &lt; 2018"> (Clasico)</xsl:if></td>
                                    <td><xsl:value-of select="anio_lanzamiento"/></td>
                                    <td><xsl:value-of select="genero"/></td>
                                </tr>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </table>
                <h2>Usuarios</h2>
                <table>
                    <tr><th>Nombre Usuario</th><th>Plan</th><th>Numero de generos favoritos</th></tr>
                    <xsl:for-each select="streaming/usuarios/usuario">
                        <xsl:sort select="@nombre" order="ascending"/>
                        <tr>
                            <td><xsl:value-of select="@nombre"/><xsl:if test="plan = 'Premium'"> (*)</xsl:if></td>
                            <td><xsl:value-of select="plan"/></td>
                            <td><xsl:value-of select="count(generos_favoritos/genero)"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
