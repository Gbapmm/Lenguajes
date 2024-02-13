### Escribe las consultas XQuery que permitan obtener la siguiente información:
1. Una lista que contiene, para cada receta, el elemento <titulo> de la receta y un elemento <calorias> que contenga el número de calorías.
>
```
for $receta in doc('recetas.xml')//receta
return
  <receta>
    <titulo>{data($receta/titulo)}</titulo>
    <calorias>{data($receta/nutricion/@caloria)}</calorias>
  </receta>

```
>
2. Una lista similar a la primera, ordenada según las calorías.
>
```
for $receta in doc('recetas.xml')//receta
let $calorias := data($receta/nutricion/@caloria)
order by $calorias
return
  <receta>
    <titulo>{data($receta/titulo)}</titulo>
    <calorias>{$calorias}</calorias>
  </receta>

```
>
3. Una lista similar a la primera, ordenada alfabéticamente según el título.
>
```
for $receta in doc('recetas.xml')//receta
let $titulo := data($receta/titulo)
order by $titulo
return
  <receta>
    <titulo>{$titulo}</titulo>
    <calorias>{data($receta/nutricion/@caloria)}</calorias>
  </receta>
```
>
4. Una lista similar a la primera, ordenada según el contenido de grasa.
>
```
for $receta in doc('recetas.xml')//receta
let $grasa := data($receta/nutricion/@grasa)
order by xs:double($grasa)
return
  <receta>
    <titulo>{data($receta/titulo)}</titulo>
    <calorias>{$calorias}</calorias>
    <grasa>{$grasa}</grasa>
  </receta>

```
>
5. Una lista similar a la primera, con el título como atributo y las calorías como contenido.
>
```
for $receta in doc('recetas.xml')//receta
let $grasa := data($receta/nutricion/@grasa)
order by xs:double($grasa)
return
  <receta>
    <titulo>{data($receta/titulo)}</titulo>
    <grasa>{$grasa}</grasa>
  </receta>

```
>
6. Una lista que contenga para cada receta, el título como atributo y cada uno de los ingredientes de nivel superior (sin añadir los ingredientes que están dentro de otros ingredientes).
>
```
for $receta in doc('recetas.xml')//receta
return
  <receta titulo="{data($receta/titulo)}">
    {
      for $ingrediente in $receta/ingrediente[not(ancestor::ingrediente)]
      return
        <ingrediente nombre="{data($ingrediente/@nombre)}" cantidad="{data($ingrediente/@cantidad)}" unidad="{data($ingrediente/@unidad)}"/>
    }
  </receta>

```
>
7. Una lista con cada una de las recetas que contengan el ingrediente harina. Poner el título de la receta como atributo del elemento receta.
>
```
for $receta in doc('recetas.xml')//receta[ingrediente/@nombre = 'harina']
return
  <receta titulo="{data($receta/titulo)}">
    { $receta/ingrediente }
  </receta>

```
>
8. Una lista de todas aquellas recetas que tengan un ingrediente llamado relleno y este contenga en su interior más de 5 elementos ingrediente. 
* La lista resultante estará formada por elementos receta que contienen un atributo titulo con el valor del elemento titulo de la receta. 
* Además, dentro de cada elemento receta habrá elementos ingrediente con el nombre de cada uno de los ingredientes.
>
```
```
>
