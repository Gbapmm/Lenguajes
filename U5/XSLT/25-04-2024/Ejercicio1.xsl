<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="/inventario">
    <html>
      <head>
        <title>Inventario de productos</title>
      </head>
      <body>
        <h1>Inventario de productos</h1>
        <xsl:for-each select="item">
          <xsl:sort order="ascending"/>
          <h2>
            <xsl:value-of select="name"/>
          </h2>
          <p>
            <xsl:value-of select="brand"/>
            -            <xsl:value-of select="category"/>
          </p>
          <p>Precio: $<xsl:value-of select="price"/>
          </p>
          <p>
            <xsl:choose>
              <xsl:when test="available = 'true'">
                <span style="color: green;">Disponible</span>
              </xsl:when>
              <xsl:otherwise>
                <span style="color: red;">Agotado</span>
              </xsl:otherwise>
            </xsl:choose>
          </p>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
  
</xsl:stylesheet>