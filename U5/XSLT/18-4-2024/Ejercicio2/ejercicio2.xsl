<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/productos">
    <html>
      <head> </head>
      <body>
        <h1>Lista de Productos Disponibles</h1>
        <xsl:for-each select="producto">
          <xsl:sort select="precio" data-type="number" order="ascending"/>
          <h1>
            <xsl:value-of select="nombre"/>
          </h1>
          <p>
            <xsl:value-of select="descripcion"/>
          </p>
          <p>
            <xsl:text>Precio: </xsl:text>
            <xsl:value-of select="precio"></xsl:value-of>
            <xsl:text>€</xsl:text>
          </p>
          <p>
            <xsl:attribute name="style">
              <xsl:choose>
                <xsl:when test="disponible = 'true'">
                  color: green;
                </xsl:when>
                <xsl:otherwise>
                  color: red;
                </xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <xsl:choose>
              <xsl:when test="disponible = 'true'">
                Disponible
              </xsl:when>
              <xsl:otherwise>
                No disponible
              </xsl:otherwise>
            </xsl:choose>
          </p>
          
          <h3>Características: </h3>
          <ul>
            <xsl:for-each select="caracteristicas/*"> 
              <li>
                <xsl:value-of select="."/>
              </li>
            </xsl:for-each>
          </ul>
          <h2>Comentarios: </h2>
          <ol>
            <xsl:for-each select="comentarios/comentario">
              <li>
                <xsl:value-of select="usuario"/>
                <xsl:text>: </xsl:text>
                <xsl:value-of select="texto"/>
              </li>
            </xsl:for-each>
          </ol>
        </xsl:for-each>
      </body>
    </html>
    
  </xsl:template>
</xsl:stylesheet>
