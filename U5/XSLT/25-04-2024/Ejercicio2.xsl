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
        <table border="1">    

          <tr>
            <th>Nombre</th>
            <th>Marca</th>
            <th>Categoria</th>
            <th>Precio</th>
            <th>Disponibilidad</th>
          </tr> 
          <xsl:for-each select="item">
            <tr>
            <td><xsl:value-of select="name"/></td>

            <td><xsl:value-of select="brand"/></td>

            <td><xsl:value-of select="category"/></td>

            <td>$<xsl:value-of select="price"/></td>

            <td>
              <xsl:choose>
              <xsl:when test="available = 'true'">
                <span style="color: green;">Disponible</span>
              </xsl:when>
              <xsl:otherwise>
                <span style="color: red;">Agotado</span>
              </xsl:otherwise>
            </xsl:choose>
            </td>
          </tr>

        </xsl:for-each>
      </table>

      </body>
    </html>
  </xsl:template>
  
</xsl:stylesheet>