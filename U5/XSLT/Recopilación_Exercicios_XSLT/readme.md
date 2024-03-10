# Preguntas
>
### Viños
>
1. Muestra el nombre y el precio del primer vino.
>
```
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="/">
    <html>
      <body>
        <table border="1">
          <tr bgcolor= "#868CD9">
            <th>Nombre:</th>
            <th>Precio:</th>
          </tr>
          <xsl:for-each select="viños/viño[1]">
            <tr>
              <td><xsl:value-of select="nome"/></td>
              <td><xsl:value-of select="prezo"/>€</td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
  
</xsl:stylesheet>
```
>
2. Muestra para todos los vinos el nombre y el precio.
>
```
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="/">
    <html>
      <body>
        <table border="1">
          <tr bgcolor= "#868CD9">
            <th>Nombre:</th>
            <th>Precio:</th>
          </tr>
          <xsl:for-each select="viños/viño">
            <tr>
              <td><xsl:value-of select="nome"/></td>
              <td><xsl:value-of select="prezo"/>€</td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
  
</xsl:stylesheet>
```
>
3. Ordena los vinos de más caro a más barato.
>
```
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
<xsl:template match="/">
  <html>
  <body>
  <table border="1">
    <tr bgcolor= "#868CD9">
      <th>Nombre:</th>
      <th>Precio:</th>
    </tr>
    <xsl:for-each select="viños/viño">
      <xsl:sort select="prezo" data-type="number" order="descending"/>
      <tr>
        <td><xsl:value-of select="nome"/></td>
        <td><xsl:value-of select="prezo"/>€</td>
      </tr>
    </xsl:for-each>
  </table>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>
```
>
4. Muestra los vinos más caros de 9 €.
>
```
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="/">
    <html>
      <body>
        <table border="1">
          <tr bgcolor= "#868CD9">
            <th>Nombre:</th>
            <th>Precio:</th>
          </tr>
          <xsl:for-each select="viños/viño[prezo > 9]">
            <tr>
              <td><xsl:value-of select="nome"/></td>
              <td><xsl:value-of select="prezo"/>€</td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
  
</xsl:stylesheet>
```
>
5. Muestra en verde los vinos más baratos de 10€; en rojo los más caros de 30€. El resto sin destacar.
>
```
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="/">
    <html>
      <body>
        <table border="1">
          <tr bgcolor= "#868CD9">
            <th>Nombre:</th>
            <th>Precio:</th>
          </tr>
          <xsl:for-each select="viños/viño">
            <xsl:if test="prezo &lt; 10">
              <tr bgcolor= "#8EFFA6">
                <td><xsl:value-of select="nome"/></td>
                <td><xsl:value-of select="prezo"/>€</td>
              </tr>
            </xsl:if>
            <xsl:if test="prezo &gt; 30">
              <tr bgcolor= "#F95E5E">
                <td><xsl:value-of select="nome"/></td>
                <td><xsl:value-of select="prezo"/>€</td>
              </tr>
            </xsl:if>
             <xsl:if test="not(prezo &lt; 10) and not(prezo &gt; 30)">
              <tr>
                <td><xsl:value-of select="nome"/></td>
                <td><xsl:value-of select="prezo"/>€</td>
              </tr>
            </xsl:if>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
  
</xsl:stylesheet>
```
>
6. Muestra los vinos siguiento la plantilla
>
```
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="/">
    <html>
      <body>
        <h1>Os meus viños</h1>
        <xsl:apply-templates/>  
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="viño">
    <p>
      <xsl:apply-templates select="nome"/>  
      <xsl:apply-templates select="prezo"/>
    </p>
  </xsl:template>
  
  <xsl:template match="nome">
    Nome:: <span style="color:#ff0000">
      <xsl:value-of select="."/></span>
    <br />
  </xsl:template>
  
  <xsl:template match="prezo">
    Prezo: <span style="color:#00ff00">
      <xsl:value-of select="."/></span>
    <br />
  </xsl:template>
  
</xsl:stylesheet>
```
>
### IES
>
1. Transforma el xml de la siguientes maneras:
>
* Sin etiquetas
>
```
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <xsl:for-each select="/ies/ciclos/ciclo">
    <xsl:value-of select="nombre" />
    <br/>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
```
>
* Con párrafos
>
```
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
    <xsl:for-each select="/ies/ciclos/ciclo">
      <p><xsl:value-of select="nombre" /></p>
    </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
```
>
* Con lista
>
```
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <ul>
    <xsl:for-each select="/ies/ciclos/ciclo">
      <li><xsl:value-of select="nombre" /></li>
    </xsl:for-each>
  </ul>
</xsl:template>

</xsl:stylesheet>
```
>
* Con tabla
>
```
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
```
>
