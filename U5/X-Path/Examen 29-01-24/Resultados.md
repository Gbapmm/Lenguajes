# Enunciado Examen
>
### Responde a cada pregunta utilizando expresiones XPath. Indica las consultas en este documento.
>
### Consultas sencillas (3 puntos)
>
1.1. Encuentra el nombre de todos los continentes registrados (usa ruta absoluta).
>
/geografia/continentes/continente/@nombre
>
1.2. Obtén el sistema político del país "España" (solo texto sin XML).
>
//pais[@nombre='España']/sistema/text()
>
1.3. Localiza los nombres de los países que no utilizan el euro como moneda.
>
//pais[not(moneda = 'euro')]/@nombre
>
1.4. Encuentra la superficie del país "Francia".
>
//pais[@nombre='Francia']/superficie/text()
>
1.5. Obtén los nombres de los países con monarquía que no utilizan el idioma español.
>
//pais[sistema='monarquía' and not(idioma='español')]/@nombre
>
### Consultas de dificultad media (4 puntos)
>
2.1. Indica cuántos países con una superficie menor a 200.000 tienen una república
>
count(//pais[sistema='república' and superficie < 200000])
>
2.2. Encuentra el nombre del continente que contiene al país "Jamaica".
>
//continente[pais='Jamaica']/@nombre
>
2.3. Localiza los nombres de los países que tienen como moneda francos.
>
//pais[moeda[contains(., 'franco')]]/@nombre
>
2.4. Encuentra los nombres de los países que tienen una moneda antigua.
>
//pais[moeda/@antigua]/@nombre
>
2.5. Continentes que no tienen países
>
//continentes/continente[not(pais)]/@nombre
>
### Consultas más complejas (3 puntos)
>
3.1. Devuelve la información del penúltimo país (busca el último y retrocede una posición).
>
//paises/pais[last()-1]	
>
3.2. Los elementos vacíos (que no contienen texto)
>
//*[not(node())]
>
3.3. Países cuyo nombre tiene más de 5 letras
>
//pais[string-length(@nome) > 5]/@nome
