<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <table border="1">
    <tr>
      <th>Ciclo</th>
      <th>Grado</th>
    </tr>
    <xsl:for-each select="/ies/ciclos/ciclo">
      <tr>
        <td><strong><xsl:value-of select="nombre" /></strong></td>
        <td><xsl:value-of select="grado" /></td>
      </tr>
    </xsl:for-each>
  </table>
</xsl:template>

</xsl:stylesheet>
