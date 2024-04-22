<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/library">
  <html>
    <head>
      <title>Library Catalog</title>
    </head>
    <body>
      <table border = "1">
        <tr>
          <th>Title</th>
          <th>Author</th>
          <th>Genre</th>
          <th>Price</th>
          <th>Avaliability</th>
          <th>Reviews</th>
        </tr>
        <xsl:for-each select="book">
          <tr>
            <td><xsl:value-of select="title"/></td>
            <td><xsl:value-of select="author"/></td>
            <td><xsl:value-of select="genre"/></td>
            <td>$<xsl:value-of select="price"/></td>
            <td><xsl:choose>
              <xsl:when test="available = 'true'">
                <span style="color: green;">Available</span>
              </xsl:when>
              <xsl:otherwise>
                <span style="color: red;">Out of Stock</span>
              </xsl:otherwise>
            </xsl:choose></td>
            <td>
              <ul>
                <xsl:for-each select="reviews/review">
              
                    <li>
                  <xsl:value-of select="user"/>
                  <xsl:text>: </xsl:text>
                  <xsl:value-of select="comment"/>
                </li>
                </xsl:for-each>
              </ul>
            </td>
          </tr>
        </xsl:for-each>
      </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
