<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	
	<xsl:template match="/employees">
		
		
		<html>
			<body>
				<h2>	EMPLEADOS DE LA EMPRESA	</h2>
				
				<xsl:for-each select="employee">
					<xsl:sort select="id" order="ascending"/>
					<p>Empleado <xsl:value-of select="id"/>
						<ul>
							<li>	Nombre: <xsl:value-of select="name"/>		</li>
							<li>	Departamento: <xsl:value-of select="department"/>		</li>
							<li>	Salario: <xsl:value-of select="salary"/>		</li>
							<li>	Antiguedad: <xsl:value-of select="years_of_experience"/>		</li>
						</ul>
					</p>
					
				</xsl:for-each>
				<table border="1">
					<tr bgcolor= "#868CD9">
						<th>Empleado</th>
						<th>Nombre</th>
						<th>Departamento</th>
						<th>Salario</th>
						<th>Antiguedad</th>
					</tr>
					<xsl:for-each select="employee">
					<xsl:sort select="id" order="ascending"/>
					<tr>
						<td><xsl:value-of select="id"/></td>
						<td><xsl:value-of select="name"/></td>
						<td><xsl:value-of select="department"/></td>
						<td><xsl:value-of select="salary"/></td>
						<td><xsl:value-of select="years_of_experience"/></td>
					</tr>
				</table>
				
				
			</body>
		</html>
		
	</xsl:template>
</xsl:stylesheet>
