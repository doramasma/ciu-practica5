# Ciu práctica 5
Camera & texture & lights

## Autor 
**Doramas Báez Bernal** <br/>
Correo: doramas.baez101@alu.ulpgc.es

## Gif
<div align="center">
  <img src="/gifLights.gif" alt="gif de la practica 5">
  <p align="center">
    Figura 1: Ejemplo de ejecucion
  </p>
</div>

## Índice
* [Introducción](#introducción)
* [Dependencias](#dependencias) 
* [Desarrollo](#desarrollo)
    * [Información general](#informaciónGeneral)
    * [Generación del cubo y luminosidad](#vistas)
    * [Texturas](#texturas)
* [Referencias](#referencias)

## Introducción
El objetivo de esta práctica es realizar una escena de eleccion personal, en la cual, haya objetos tridimensionales que incluyan texturas, luces y movimiento de cámara. En este caso, se ha optado por generar un entorno donde hay un cubo (con una puerta), el cual tiene una textura y además contamos con un puntero (representa a la persona) que produce un haz de luz. La idea, es poder ver como influye la luz en el entorno y que pasa si cambiamos de color o de intensidad de la misma.


## Dependencias
No se ha utilizado ninguna librería externa y no existe ningun requisito que conlleve a tener que hacer ninguna tarea especial.
 

## Desarrollo

### Información general <a id="informaciónGeneral"></a>

Cuando iniciamos la aplicación, aparecerá la vista principal, en la que se nos explicarán los controles. En este caso, disponemos de los siguientes controles:
 - W: Move forward
 - S: Move backward
 - Up key: Increase light intensity
 - Down key: Decrease light intensity
 - Left key: change color of light
 - Right key: change color of light
 - Enter: Cambiar entre modo pausa y modo resume 
 - Mouse: Rotar el ángulo de la camara 
 

### Generación del cubo y luminosidad<a id="cubo"></a>
Es interesante comentar como se ha generado el macrocubo, la mayor influencia de para realizarlo del modo que explicaremos a continuacion es por el funcionamiento de la luz en processing.
En processing, si tenemos una luz, esta se aplica sobre la cara del objeto. Por lo tanto, si realizaramos un cubo muy grande, este tendría toda su cara igual de iluminada y no se podría apreciar que cuanto más lejos de nuestro haz de luz más oscuro el cubo.
Para solucionar este problema, lo que se ha hecho es generar dicho macrocubo a partir de muchos minicubos. Lo que se hizo es lo siguiente:
 - Lo primero fue generar la pared inicial, para ello, utilizaremos 2 bucle for donde generamos los cubos en vertical x, vertical y.
 - Después a partir de ciertas translaciones de la propia pared que generamos anteriormente, podremos ir construyendo las distintas paredes que componen al cubo
 - Se ha dejado una entrada premeditadamente al cubo.
 Por lo tanto, podrá comprobar en la práctica que si nos acercamos, la zona que está pegada a nuestro puntero, estará más iluminada que las esquinas del cubo.

### Textura <a id="texturas"></a>
Como requisito de la práctica se pedía hacer uso de texturas. En este caso, se ha aplicado una textura muy similar a unos ladrillos, ya que, se buscaba dar la sensación de hacer una especie de habitación o cubo de piedra. Podremos encontrar el enlace en las referencias.

## Referencias

* [Guion de prácticas](https://cv-aep.ulpgc.es/cv/ulpgctp20/pluginfile.php/126724/mod_resource/content/22/CIU_Pr_cticas.pdf)
* [Programa para la grabación del gif](https://obsproject.com/es)
* [Texturas](https://gametextures.com/)
* [Adobe xd](https://www.adobe.com/es/products/xd.html)
