# Preguntas

1. Listar el título de todos los libros.
>
```
doc("bib.xml")librotitulo
```
>
2. Listar año y título de todos los libros, ordenados por el año.
>
```
for $a in doc("bib.xml")libro
order by $a@ano (:descending o ascending:)
return
libro
{$a@ano}
{$atitulo}
libro
```
>
3. Listar los libros cuyo precio sea 65.95
>
```
for $a in doc("bib.xml")//libro
where $a/prezo = "65.95"
return $a
```
>
4. Listar los libros publicados antes del año 2000
>
```
for $a in doc("bib.xml")//libro
where $a/@ano < "2000" (:Se filtra por año:)
return $a
```
>
5. Listar año y título de los libros publicados por Addison-Wesley después del año 1992.
>
```
for $a in doc("bib.xml")//libro
where $a/editorial ="Addison-Wesley" and $a/@ano > "1992"
return 
<libro ano = "{$a/@ano}">
{$a/titulo}
</libro>
```
>
6. Listar año y título de los libros que tienen más de un autor.
>
```
for $a in doc("bib.xml")/bib/libro
return
if (count($a/autor) > 1) 
 then <libro ano="{ $a/@ano }">
      { $a/titulo }
 else () 
</libro>
```
>
7. Listar año y título de los libros que tienen no tienen autor.
>
```
for $a in doc("bib.xml")/bib/libro
return
if (count($a/autor) = 0) 
 then <libro ano="{ $a/@ano }">
      { $a/titulo }
 else () 
</libro>
```
>
8. Mostrar los apellidos de los autores que aparecen en el documento, sin repeticiones, ordenados alfabéticamente.
>
```
for $a in distinct-values(doc("bib.xml")
//autor/apelido) 
order by $a 
return <apelidos>{ $a }</apelidos>
```
>
9. Por cada libro, listar agrupado en un elemento **result** su titulo y autores
>
```
for $b in doc("bib.xml")//libro 
return 
 <result> 
{ $b/titulo }
<autores>
{ 
 for $a at $i in $b/autor 
 return <autor>{string($a)}</autor> 
}
</autores>
</result>
```
>
10. Por cada libro, obtener su título y el número de autores, agrupados en un elemento libro
>
```
for $b in doc("bib.xml")//libro 
return 
 <libro> 
{ $b/titulo }
<numeroAutores> 
{count($b/autor)}
</numeroAutores>
 </libro>
```
>
11. Generar un documento html con un encabezado que diga “Listado de libros” seguido de una tabla de 3 columnas, en la que se muestre el titulo, editorial y precio de cada libro. La tabla deberá tener bordes y la primera fila tendrá un formato especial con los nombres de las columnas. Las columnas de título y editorial irán alineadas a la izquierda, y el precio a la derecha.
>
```
<html> 
 <head> 
  <title> Listado de libros </title> 
  </head>
 <body> 
  <table border="1">
   <caption>Listado de libros</caption>
   <th> Titulo </th>  
   <th> Editorial </th>  
   <th> Precio </th>  

{ 
for $a in doc("bib.xml")/bib/libro 
return 
   <tr> 
    <td align ="left"> <i> { string( $a/titulo ) } </i> </td> 
	<td align ="left"> { string( $a/editorial ) } </td>
	<td align ="right"> { string( $a/prezo) } </td>
   </tr> 
}

  </table> 
  </body> 
</html>
```
>
12. Generar el siguiente documento html con la información de los libros del autor Stevens. El valor precio total es un campo calculado utilizando una consulta con una cláusula let.
>
```
<html> 
 <head> 
  <title> Libros de Stevens </title> 
  </head>
 <body> 
  <table border="1">
   <caption>Listado de libros</caption>
   <th> Titulo </th>  
   <th> Precio </th>  
{ 
for $a in doc("bib.xml")//libro 
where $a/autor/apelido="Stevens"
return 
<tr> 
<td>{$a/titulo}</td>
<td>{$a/prezo}</td>
</tr>
} 

{
let $a := doc("bib.xml")/bib/libro 
where $a/autor/apelido="Stevens"
return 
   <tr> 
    <td> {sum( $a/prezo ) } </td> 
   </tr> 
} 
  </table> 
  </body> 
</html>
```

