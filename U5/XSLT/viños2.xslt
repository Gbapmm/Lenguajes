<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="/">
    <html>
      <body>
        <table border="1">
          <xsl:apply-templates select="viños"/>
        </table>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="viño">
    <tr>
      <td>Nombre:</td>
      <td><xsl:value-of select="nome"/></td>
    </tr>
     <tr>
      <td>Precio:</td>
      <td><xsl:value-of select="prezo"/>€</td>
    </tr>
  </xsl:template>
  
</xsl:stylesheet>