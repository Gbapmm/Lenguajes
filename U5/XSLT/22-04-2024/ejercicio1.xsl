<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/library">
  <html>
    <head>
      <title>Library Catalog</title>
    </head>
    <body>
<h1>Library Catalog</h1>
  <xsl:for-each select="book">
    <xsl:sort select="title" data-type="text" order="ascending"/>

  <h2>
    <xsl:value-of select="title"/>
  </h2>
  <p>
    <xsl:value-of select="author"/>
    <xsl:text> - </xsl:text>
    <xsl:value-of select="genre"/>
  </p>
  <p>
    <xsl:text>Price: $</xsl:text>
    <xsl:value-of select="price"/>
  </p>

  <xsl:choose>
    <xsl:when test="available = 'true'">
      <span style="color: green;">Available</span>
    </xsl:when>
    <xsl:otherwise>
      <span style="color: red;">Out of Stock</span>
    </xsl:otherwise>
  </xsl:choose>

  <h3>Reviews: </h3>
  <ul>
  <xsl:for-each select="reviews/review">

      <li>
    <xsl:value-of select="user"/>
    <xsl:text>: </xsl:text>
    <xsl:value-of select="comment"/>
  </li>
  </xsl:for-each>
</ul>
  </xsl:for-each>

</body>
</html>
</xsl:template>
</xsl:stylesheet>
