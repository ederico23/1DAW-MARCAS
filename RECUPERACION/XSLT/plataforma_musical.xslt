<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <!-- =====================================================
       PLANTILLA RAÍZ — Punto de entrada del XSLT
       match="/" significa "empieza desde la raíz del XML"
       Todo el HTML que genera la página va aquí dentro
       ===================================================== -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Plataforma Musical - Catálogo Completo</title>
        <style>
          body { font-family: Arial, sans-serif; margin: 20px; }
          h1, h2, h3 { color: #333; }
          table { border-collapse: collapse; width: 100%; margin-bottom: 20px; }
          th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
          th { background-color: #f2f2f2; }
          .synthwave { background-color: #E6E6FA; }
          .ambient { font-style: italic; }
          .clasico { color: #ff6600; }
          .larga { color: #ff0000; font-weight: bold; }
          .premium { font-weight: bold; color: #0066cc; }
          .yuki { font-weight: bold; }
          .section { margin-bottom: 30px; }
        </style>
      </head>
      <body>
        <h1>Plataforma Musical - Catálogo Completo</h1>
        
        <!-- =====================================================
             PREGUNTA 1 — Conteo de artistas con count()
             count() cuenta cuántos nodos hay en la ruta indicada
             ===================================================== -->
        <p>
          Total de artistas registrados:
          <xsl:value-of select="count(streaming/artistas/artista)"/>
        </p>
        
        <!-- =====================================================
             PREGUNTA 1 — Tabla de artistas
             Ordenada alfabéticamente por nombre (atributo @nombre)
             xsl:apply-templates delega el procesamiento a la
             plantilla específica de "artista" (definida más abajo)
             ===================================================== -->
        <div class="section">
          <h2>Artistas</h2>
          <table>
            <tr>
              <th>ID</th>
              <th>Nombre del Artista</th>
              <th>País de Origen</th>
            </tr>
            <!-- apply-templates llama a la plantilla match="artista" -->
            <!-- xsl:sort ordena los nodos ANTES de procesarlos -->
            <xsl:apply-templates select="streaming/artistas/artista">
              <xsl:sort select="@nombre" order="ascending"/>
            </xsl:apply-templates>
          </table>
        </div>
        
        <!-- =====================================================
             PREGUNTA 2 — Tabla de álbumes con estilos condicionales
             Ordenada por año de lanzamiento descendente (más nuevo primero)
             Usamos for-each porque no necesitamos plantilla separada
             ===================================================== -->
        <div class="section">
          <h2>Álbumes</h2>
          <table>
            <tr>
              <th>Título del Álbum</th>
              <th>Año de Lanzamiento</th>
              <th>Género</th>
            </tr>
            <xsl:for-each select="streaming/albumes/album">
              <!-- Orden numérico descendente: 2022, 2020, 2019... -->
              <xsl:sort select="anio_lanzamiento" data-type="number" order="descending"/>
              
              <!-- xsl:choose es el if/else if/else de XSLT -->
              <!-- Comprueba el género para aplicar la clase CSS correcta -->
              <xsl:choose>
                
                <!-- Si el género es Synthwave → clase "synthwave" (fondo morado) -->
                <xsl:when test="genero = 'Synthwave'">
                  <tr class="synthwave">
                    <td>
                      <!-- Si el año es menor a 2018 añade "(Clásico)" al título -->
                      <xsl:if test="anio_lanzamiento &lt; 2018">
                        <span class="clasico">(Clásico) </span>
                      </xsl:if>
                      <xsl:value-of select="@titulo"/>
                    </td>
                    <td><xsl:value-of select="anio_lanzamiento"/></td>
                    <td><xsl:value-of select="genero"/></td>
                  </tr>
                </xsl:when>
                
                <!-- Si el género es Ambient → clase "ambient" (cursiva) -->
                <xsl:when test="genero = 'Ambient'">
                  <tr>
                    <td class="ambient">
                      <xsl:if test="anio_lanzamiento &lt; 2018">
                        <span class="clasico">(Clásico) </span>
                      </xsl:if>
                      <xsl:value-of select="@titulo"/>
                    </td>
                    <td><xsl:value-of select="anio_lanzamiento"/></td>
                    <td><xsl:value-of select="genero"/></td>
                  </tr>
                </xsl:when>
                
                <!-- Cualquier otro género → fila normal -->
                <xsl:otherwise>
                  <tr>
                    <td>
                      <xsl:if test="anio_lanzamiento &lt; 2018">
                        <span class="clasico">(Clásico) </span>
                      </xsl:if>
                      <xsl:value-of select="@titulo"/>
                    </td>
                    <td><xsl:value-of select="anio_lanzamiento"/></td>
                    <td><xsl:value-of select="genero"/></td>
                  </tr>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:for-each>
          </table>
        </div>
        
        <!-- =====================================================
             PREGUNTA 3 — Tabla de canciones
             Primero muestra el total con count()
             Luego recorre cada canción con for-each
             ===================================================== -->
        <div class="section">
          <h2>Canciones</h2>
          
          <!-- count() cuenta todos los nodos cancion del XML -->
          <p>
            Total de canciones en la plataforma:
            <xsl:value-of select="count(streaming/canciones/cancion)"/>
          </p>
          
          <table>
            <tr>
              <th>Título de la Canción</th>
              <th>Duración</th>
              <th>Compositor</th>
            </tr>
            <xsl:for-each select="streaming/canciones/cancion">
              <tr>
                <td><xsl:value-of select="@titulo"/></td>
                
                <!-- Columna duración: si empieza por 6 o 7 es mayor de 5 minutos -->
                <!-- starts-with() comprueba si un texto empieza por algo -->
                <td>
                  <xsl:value-of select="duracion"/>
                  <xsl:if test="starts-with(duracion,'6') or starts-with(duracion,'7')">
                    <span class="larga"> ★ Larga</span>
                  </xsl:if>
                </td>
                
                <!-- Columna compositor: si es Yuki Tanaka → clase "yuki" (negrita) -->
                <td>
                  <xsl:choose>
                    <xsl:when test="compositor = 'Yuki Tanaka'">
                      <span class="yuki">
                        <xsl:value-of select="compositor"/>
                      </span>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="compositor"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </td>
              </tr>
            </xsl:for-each>
          </table>
        </div>
        
        <!-- =====================================================
             PREGUNTA 5 — Tabla de usuarios
             Ordenada alfabéticamente por @nombre
             Usa count() para géneros favoritos y lista reproducción
             ===================================================== -->
        <div class="section">
          <h2>Usuarios</h2>
          <table>
            <tr>
              <th>Nombre Usuario</th>
              <th>Plan</th>
              <th>Número de Géneros Favoritos</th>
              <th>Canciones en Lista</th>
            </tr>
            <xsl:for-each select="streaming/usuarios/usuario">
              <xsl:sort select="@nombre" order="ascending"/>
              <tr>
                <!-- Si el plan es Premium → clase "premium" + icono ★ -->
                <td>
                  <xsl:if test="plan = 'Premium'">
                    <span class="premium">★ </span>
                  </xsl:if>
                  <xsl:choose>
                    <xsl:when test="plan = 'Premium'">
                      <span class="premium">
                        <xsl:value-of select="@nombre"/>
                      </span>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="@nombre"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </td>
                <td><xsl:value-of select="plan"/></td>
                
                <!-- count() cuenta los hijos <genero> dentro de <generos_favoritos> -->
                <td>
                  <xsl:value-of select="count(generos_favoritos/genero)"/>
                </td>
                
                <!-- count() cuenta los hijos <cancion_id> dentro de <lista_reproduccion> -->
                <td>
                  <xsl:value-of select="count(lista_reproduccion/cancion_id)"/>
                </td>
              </tr>
            </xsl:for-each>
          </table>
        </div>
        
      </body>
    </html>
  </xsl:template>
  
  <!-- =====================================================
       PREGUNTA 4 — Plantilla específica para artista
       Esta plantilla se activa cuando apply-templates
       llega a un nodo <artista>
       Genera una fila <tr> con los datos del artista
       ===================================================== -->
  <xsl:template match="artista">
    <tr>
      <!-- @id y @nombre son atributos → se acceden con @ -->
      <td><xsl:value-of select="@id"/></td>
      <td><xsl:value-of select="@nombre"/></td>
      <!-- pais_origen es elemento hijo → sin @ -->
      <td><xsl:value-of select="@pais_origen"/></td>
    </tr>
  </xsl:template>
  
</xsl:stylesheet>
