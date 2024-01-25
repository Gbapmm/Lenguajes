# Enunciado y Resultados Jose
>
1. Encuentra el nombre de todas las personas. Devuelve los nombres sin los elementos XML.
>
//nome/text()
>
3. Obtén los títulos de todas las películas del cine. Usa ruta exacta (sin //).
>
/cine/peliculas/pelicula/titulo
>
4. Localiza las personas que son de sexo masculino (sexo="home").
>
//persoa[@sexo="home"]
>
5. Encuentra el año de nacimiento de la persona llamada "Janet Leigh".
>
//persoa[nome='Janet Leigh']/datas/@nacemento
>
6. Extrae los nombres de los directores de las películas.
>
//director
>
7. Encuentra el nombre de las personas que no han fallecido 
>
//persoa[not(datas/@fallecemento)]
>
8. Encuentra los títulos de las películas que contienen la preposición en
>
//pelicula[contains(titulo, 'en')]/titulo
>
9. Obtén el nombre de las personas que están tanto como directores y actores.
>
//pelicula/director[.=../actor]
>
10. Localiza las películas que fueron lanzadas entre 1955 y 1965.
>
//pelicula[data>1955 and data<1965]/titulo
>
11. Extrae los títulos de las películas en las que Janet Leigh participó como actor.
>
//pelicula[actor='Janet Leigh']/titulo
>
12. Encuentra las películas que tienen más de un actor
>
//pelicula[count(actor) > 1]/titulo

13. Encuentra los nombres de los actores que empiezan por la letra “J”
//actor[starts-with(., 'J')]/text()
