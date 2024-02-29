# Preguntas

1. Los usuarios (elementos <usuario>) con identificador igual o inferior a 20.
>
```
for $a in doc("Usuarios.xml")/usuarios/usuario
where $a/id <= 20
return
<usuario>{$a}</usuario>
```
>
2. Los usuarios (elementos <usuario>) que tienen una edad entre 20 y 30 (incluidos).
>
```
for $a in doc("Usuarios.xml")/usuarios/usuario
where $a/edad >= 20 and $a/edad <= 30
return
<usuario>{$a}</usuario>
```
>
3. Los usuarios (elementos <usuario>) de España (ES) e Italia (IT).
>
```
for $a in doc("Usuarios.xml")/usuarios/usuario
where $a/pais = "ES" and "IT"
return
<usuario>{$a}</usuario>
```
>
4. Los usuarios (elementos <usuario>) que tiene un email con extensión .com.
>
```
for $a in doc("Usuarios.xml")/usuarios/usuario
where $a/email/contains($a, ".com")
return
<usuario>{$a}</usuario>
```
>
5. Los usuarios (elementos <usuario>) que tienen un nombre de 5 caracteres o menos.
>
```
for $a in doc("Usuarios.xml")/usuarios/usuario
where string-length($a/nombre) >= 5
return
<usuario>{$a}</usuario>
```
>
6. El nombre y apellidos (separados por un espacio en blanco) de los usuarios de francia (FR).
>
```
for $a in doc("Usuarios.xml")/usuarios/usuario
where $a/pais = "FR"
return
 concat($a/nombre," ",$a/apellido)
```
>
7. La lista completa de los países (códigos de 2 letras mayúsculas) de los usuarios almacenados en el documento XML. Los países no deben aparecer repetidos.
>
```
for $a in distinct-values(doc("Usuarios.xml")/usuarios/usuario/pais)
return
$a
```
>
8. Los usuarios (elementos <usuario>) con identificador superior a 50 y con edad igual o inferior a 80 años.
>
```
for $a in doc("Usuarios.xml")/usuarios/usuario
where $a/id > 50 and $a/edad <= 50
return
<usuario>{$a}</usuario>
```
9. La media de edad de los usuarios.
>
```
let $numUsuarios := count(doc('Usuarios.xml')/usuarios/usuario)
let $totalEdad := sum(doc('Usuarios.xml')/usuarios/usuario/edad)
let $media := if ($numUsuarios > 0) then $totalEdad div $numUsuarios else ()
return 
  <edad>{ $media }</edad>
```
>
10. De XML a HTML. Genera una tabla HTML: Con dos columnas, en una se muestra el usuario y en otra se muestra la ip
>
```
<html>
<head>
  <title>tabla Usuarios</title>
</head>
<body>
  <table border="1">
    <thead>
      <tr>
        <th>Usuario</th>
        <th>IP</th>
      </tr>
    </thead>
    <tbody>
    {
      for $Usuarios in doc("Usuarios.xml")/usuarios/usuario
      return 
        <tr>
          <td>{$Usuarios/nombre/text()}</td>
          <td>{$Usuarios/ip/text()}</td>
        </tr>
    }
    </tbody>
  </table>
</body>
</html>
```
