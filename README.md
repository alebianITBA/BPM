# Trabajo practico Integracion de Sistemas de Informacion

## Introduccion

Este trabajo final tiene como objetivo crear un proceso hecho con BonitaBPM que sea capaz de:

* Leer archivos
* Escribir archivos
* Leer de una base de datos
* Escribir en una base de datos
* Hacer un request HTTP a un servicio web externo

## Requerimientos

Para poder ejecutar este trabajo practico es necesario:

* PostgreSQL compatible con JDBC 9.2 (probado con PosrgreSQL version 9.6.1.0)
* BonitaBPM version 7.3.1
* Ruby on Rails version 5.1.0 (opcional)

## Procesos

Los procesos creados son los siguientes:

![](https://raw.githubusercontent.com/alebianitba/bpm/master/proceso1.png)

![](https://raw.githubusercontent.com/alebianitba/bpm/master/proceso2.png)

## Ejecucion

* Primero debe ejecutarse el [script SQL](./database_preparation.sql), esto creara la base de datos con todas las tablas y datos requeridos. Para hacerlo una posiblidad es ejecutar:

```
$ sudo -u postgres psql < ./database_preparation.sql
```

* En el momento de la creacion de este archivo, se deployo en Heroku una [aplicacion web hecha en Ruby on Rails](./credit_card_validator) [aqui](http://bpm-api.herokuapp.com). Si al momento de la prueba el servicio no se encuentra habilidado, se puede inicial el server de forma local ejecutando dentro de la carpeta `credit_card_validator`:

```
$ rails s
```

* Luego importar el proyecto en BonitaBPM
* Ejecutar el primer proceso llamado `Confirmar compras`
* Cuando el proceso pregunte que archivo tomar en la entrada elegir el [path del archivo `new_purchases.csv`](./new_purchases.csv). El formato de dicho archivo es: checkout_id, client_id, product_id, price (centavos), card_number, card_provider.

### Resultado esperado

En los datos del CSV se encuentran algunas filas que contienen datos erroneos. Se espera el siguiente resultado:

* Operacion 105: Falla porque la tarjeta es invalida.
* Operacion 110: Falla porque el id del producto no existe.
* Operacion 115: Falla porque el id del cliente no existe.
