<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <xsl:for-each select="/ies/ciclos/ciclo">
    <xsl:value-of select="nombre" />
    <br/>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>