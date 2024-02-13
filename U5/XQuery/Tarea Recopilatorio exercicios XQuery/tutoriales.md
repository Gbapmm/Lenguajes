### Escribe las consultas XQuery que permitan obtener la siguiente información: 
1. Cada uno de los nombres de las categorias con la etiqueta "categoria".
>
```
for $categoria in distinct-values(doc('tutoriales.xml')//categoria)
return 
  <categoria>{ $categoria }</categoria>
```
>
2. Los titulos de los tutoriales con el número de visitas entre paréntesis, ambos dentro de la misma etiqueta "lostutoriales".
>
```
<lostutoriales>{
  for $tutorial in doc('tutoriales.xml')//tutorial
  where $tutorial/visitas > 30000
  return 
    <tutorial>{ data($tutorial/titulo) } ({ data($tutorial/visitas) })</tutorial>
}</lostutoriales>

```
>
3. Los nombres de los tutoriales con menos de 2000 visitas
>
```
for $tutorial in doc('tutoriales.xml')//tutorial[visitas < 2000]
return 
  <tutorial>{ $tutorial/titulo }</tutorial>

```
>
4. Los nombres de los tutoriales de XML con más de 30.000 visitas
>
```
for $tutorial in doc('tutoriales.xml')//tutorial[categoria = 'XML' and visitas > 30000]
return 
  <tutorial>{ $tutorial/titulo }</tutorial>
```
>
5. El número total de visitas
>
```
let $totalVisitas := sum(doc('tutoriales.xml')//tutorial/visitas)
return 
  <totalVisitas>{ $totalVisitas }</totalVisitas>

```
>
6. Los nombres de las categorías distintas, cada una en una etiqueta <categoriadistintas>
>
```
<categoria_distintas>{
  for $categoria in distinct-values(doc('tutoriales.xml')//categoria)
  return 
    <categoriadistintas>{ $categoria }</categoriadistintas>
}</categoria_distintas>

```
>
7. Nombres y apellidos de los autores eliminando los repetidos y acompañar cada nombre con todos sus tutoriales, ordenados alfabeticametne por nombre de autor; cada autor en una etiqueta <autor> que contendrá una etiqueta <nombreyapellidos> y una etiqueta <titulo>.
>
```
```
>
8. La media de vistas de los tutoriales, dentro de una etiqueta <media>.
>
```
let $numTutoriales := count(doc('tutoriales.xml')//tutorial)
let $totalVisitas := sum(doc('tutoriales.xml')//tutorial/visitas)
let $media := if ($numTutoriales > 0) then $totalVisitas div $numTutoriales else ()
return 
  <media>{ $media }</media>
```
>
9. Cuantos tutoriales de XML hay, dentro de una etiqueta <totaltutoriales>.
>
```
let $numTutorialesXML := count(doc('tutoriales.xml')//tutorial[categoria[contains(., 'XML')]])
return 
  <totaltutoriales>{ $numTutorialesXML }</totaltutoriales>
```
>
10.  El nombre del tutorial y su categoría, ordenado por el nombre de cada categoría
>
```
<categoria_tutoriales>{
  for $categoria in distinct-values(doc('tutoriales.xml')//categoria)
  let $tutoriales :=
    for $tutorial in doc('tutoriales.xml')//tutorial[categoria = $categoria]
    return
      <tutorial>
        <nombre>{ $tutorial/titulo }</nombre>
        <categoria>{ $tutorial/categoria }</categoria>
      </tutorial>
  order by $categoria
  return 
    <categoria>
      <nombre>{ $categoria }</nombre>
      {$tutoriales}
    </categoria>
}</categoria_tutoriales>
```
>
11.  Todos los datos de cada tutorial excepto las visitas.
>
```
<tutoriales_sin_visitas>{
  for $tutorial in doc('tutoriales.xml')//tutorial
  return
    <tutorial_sin_visitas>
      {
        $tutorial/*[not(self::visitas)] 
      }
    </tutorial_sin_visitas>
}</tutoriales_sin_visitas>

```
>
12. En una tabla de HTML de dos columnas, el título de los tutoriales y los nombres de los autores.
>
```
<table>
{
  for $tutorial in doc('tutoriales.xml')//tutorial
  return
    <tr>
      <td>{ $tutorial/titulo }</td>
      <td>{ string-join($tutorial/autor/(nombre, apellidos), ' ') }</td>
    </tr>
}
</table>
```
