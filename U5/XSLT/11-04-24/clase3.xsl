<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:template match="/employees">
    <html>
      <body>
        <h2>EMPLEADOS DE LA EMPRESA</h2>
        <ul>
          <xsl:choose>
            <xsl:when test="employee[salary &gt; 55000]">
              <xsl:for-each select="employee[salary &gt; 55000]">
                <xsl:sort select="id" order="ascending"/>
                <p>Empleado <xsl:value-of select="id"/>
                  <ul>
                    <li>Nombre: <xsl:value-of select="name"/></li>
                    <li>Departamento: <xsl:value-of select="department"/></li>
                    <li>Salario: <xsl:value-of select="salary"/></li>
                    <li>Antiguedad: <xsl:value-of select="years_of_experience"/></li>
                  </ul>
                </p>
              </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
              
            </xsl:otherwise>
          </xsl:choose>
          
        </ul>
        
        <h3>Todos los empleados:</h3>
        <table border="1">
          <tr style="background-color: #000000; color: white;">
            <th>Empleado</th>
            <th>Nombre</th>
            <th>Departamento</th>
            <th>Salario</th>
            <th>Antigüedad</th>
          </tr>
          <xsl:for-each select="employee">
            <xsl:sort select="id" order="ascending"/>
            <xsl:variable name="years" select="years_of_experience"/>
            <tr>
              <xsl:choose>
                <xsl:when test="$years = 3 or $years = 4">
                  <xsl:attribute name="bgcolor">#98FB98</xsl:attribute> <!-- Pale Green -->
                </xsl:when>
                <xsl:when test="$years = 7 or $years = 8">
                  <xsl:attribute name="bgcolor">#FF6347</xsl:attribute> <!-- Tomato -->
                </xsl:when>
                <xsl:when test="$years = 5 or $years = 6">
                  <xsl:attribute name="bgcolor">#FFFF00</xsl:attribute> <!-- Yellow -->
                </xsl:when>
                <xsl:otherwise>
                  <xsl:attribute name="bgcolor">#FFFFFF</xsl:attribute> <!-- Default white -->
                </xsl:otherwise>
              </xsl:choose>
              <td><xsl:value-of select="id"/></td>
              <td><xsl:value-of select="name"/></td>
              <td><xsl:value-of select="department"/></td>
              <td><xsl:value-of select="salary"/></td>
              <td><xsl:value-of select="years_of_experience"/></td>
            </tr>
          </xsl:for-each>
        </table>
        
        
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
