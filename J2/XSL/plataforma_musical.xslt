<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="/">
    <html lang="es">
      <head>
        <meta charset="UTF-8" />
        <title>Catálogo Musical</title>
        <style>
          body {
          font-family: Arial, sans-serif;
          margin: 20px;
          background-color: #f9f9f9;
          }
          
          table {
          border-collapse: collapse;
          width: 80%;
          margin-bottom: 30px;
          background-color: white;
          }
          
          th,
          td {
          border: 1px solid #ccc;
          padding: 10px;
          text-align: left;
          }
          
          th {
          background-color: #333;
          color: white;
          }
        </style>
      </head>
      
      <body>
        
        <h1>Plataforma Musical - Catálogo Completo</h1>
        <!-- Ejercicio 1.1: Mostrar el total de artistas registrados -->
        <p>
          <strong>Total de artistas registrados: </strong>
          <xsl:value-of select="count(straming/artistas/artista)" />
        </p>
        
        <!-- Ejercicio 1.2: Mostrar tabla con artistas -->
        <h2>Artistas</h2>
        <table>
          <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Pais origen</th>
          </tr>
          
          
          <xsl:for-each select="/streaming/artistas/artista">
            <xsl:sort select="@nombre" order="ascending"/>
            <tr>
              <td>  <xsl:value-of select="@id"/>  </td>
              <td>  <xsl:value-of select="@nombre"/>  </td>
              <td>  <xsl:value-of select="@pais_origen"/>  </td>  
            </tr>
          </xsl:for-each>
        </table>
        
        <!-- Ejercicio 2: Mostrar tabla con álbumes -->
        <h2>Álbumes</h2>
        <table>
          <tr>
            <th>Titulo</th>
            <th>Año lanzamiento</th>
            <th>Genero</th>
          </tr>
          
          
          <xsl:for-each select="/streaming/albumes/album">
            <xsl:sort select="anio_lanzamiento" order="descending" data-type="number"/>
            
            <xsl:choose>
              <xsl:when test="genero = 'Synthwave'">
                <tr style = "background-color: #E6E6FA">
                  <td>
                    <xsl:value-of select="@titulo"/> 
                    <xsl:if test= "anio_lanzamiento &lt; 2018">(clasico) </xsl:if>
                  </td>  
                  
                  <td><xsl:value-of select="anio_lanzamiento"/></td>
                  <td><xsl:value-of select="genero"/></td>
                </tr>
              </xsl:when>
              
              <xsl:otherwise>
                <tr>
                  <td>
                    <xsl:value-of select="@titulo"/>
                    <xsl:if test="anio_lanzamiento &lt; 2018"> (Clásico)</xsl:if>
                  </td>
                  <td><xsl:value-of select="anio_lanzamiento"/></td>
                  <td><xsl:value-of select="genero"/></td>
                </tr>
              </xsl:otherwise>
              
            </xsl:choose>
            
          </xsl:for-each>
        </table>
        
        <!-- Ejercicio 3: Mostrar tabla con usuarios -->
        <h2>Usuarios</h2>
        <table>
          <tr>
            <th>Nombre</th>
            <th>Plan</th>
            <th>Numero de generos</th>
          </tr>
          
          <xsl:for-each select="streaming/usuarios/usuario">
            <xsl:sort select="@nombre" order="ascending"/>
            <tr>
              <xsl:choose>
                <xsl:when test="plan = 'Premium'">
                  <td>  <xsl:value-of select="@nombre"/>★  </td>
                </xsl:when>
                <xsl:otherwise>
                  <td>  <xsl:value-of select="@nombre"/>  </td>
                </xsl:otherwise>
              </xsl:choose>
              <td>  <xsl:value-of select="plan"/>  </td>              
              <td> <xsl:value-of select="count(generos_favoritos/genero)"/></td>
              
            </tr>
          </xsl:for-each>
          
        </table>
      </body>
      
    </html>
  </xsl:template>
  
  
  
</xsl:stylesheet>