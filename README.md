# PRÁCTICA DE PLANIFICACIÓN

*Inteligencia Artificial*

Fèlix Arribas Pardo

David Williams Corral

Raul Garía Fuentes

## Dominio

El problema nos situa en un hotel con varias habitaciones, cada habitacion una capacidad de 1 a 4, y varias reservas, también con capacidades diferentes. Nos piden que mediante `PDDL` encontremos la mejor solución, la mejor asignación de las reservas en el hotel en 30 dias. Con extensión el problema se complica.

### Nivel Básico

Para representar nuestro sistema de reservas del hotel, hemos decidido representar tres tipos necesarios, estos son **habitación** (*room*), **reserva** (*booking*) y **día** (*day*). Todas las soluciones trabajan con solo estos objetos. Las relaciones entre estos tipos son bastante sencillas y triviales:

- Una habitación esta libre (o no) un día en concreto.
- Una reserva és para unos dias.

A partir de estas dos sentencias sacamos dos predicados básicos, pero necesitamos uno mas para saber si una reserva se ha satisfecho, es decir, ya está procesada:

```pddl
(free ?room - room ?day - day)          ; true iff the room is empty that day
(booked ?booking - booking ?day - day)  ; true iff booking is for that day
(scheduled ?booking - booking)          ; true iff booking is satisfied
```

El predicado ***free*** es cierto si la habitación esta libre ese dia. El predicado ***booked*** es cierto si la reserva se ha cumplido para ese dia. El predicado ***scheduled*** es cierto si la reserva se ha satisfecho.

Para poder asignar una reserva a una habitación y que no haya problemas con la capacidad y el número de huéspedes, usamos dos funciones para obtener el *tamaño* de la habitación y la reserva:

```pddl
(room_size ?room - room)                ; size of the room
(book_size ?booking - booking)          ; amount of people of the booking
```

Con todo esto, solo necesitamos una sola acción: reservar o *book*. Usa `(>= (room_size ?room) (book_size ?booking)` y comprueba como precondición que, para toda la duración de la reserva, la habitación esta libre. También tine en cuenta que la reserva no esté satisfecha ya. Esta acción solo necesita dos parámetros: `(?room - room ?booking - booking)`. Finalmente el efecto que tiene sobre el hotel es:

- Reserva satisfecha: `(scheduled ?booking)`.
- Para todos los dias de la reserva, la habitación no esta libre: `(forall (?day - day) (when (booked ?booking ?day) (not (free ?room ?day))))`.

### Extensión 1

En esta extensión se pide una optimización que, o bien ya hemos hecho con el nivel bàsico, o no sabemos encontrar.

### Extensión 2

En esta extensión se pide una optimización que, o bien ya hemos hecho con el nivel bàsico, o no sabemos encontrar.

Como requerimos añadir nueva información, añadimos funciones. Las funciones nuevas son, la orientación de la habitación, la orientación preferente de la reserva y por último el número total de reservas que se han quedado con un habitación sin su orientación preferente. Se usa un numero para representar la orientación (podria ser: 1 - Norte, 2 - Este, 3 - Sur, 4 - Oeste):

```pddl
(room_orientation ?room - room)         ; orientation of the room
(book_orientation ?booking - booking)   ; prefered orientation of the booking
(non_oriented_bookings)                 ; total of non oriented bookings
```

Obviamente también ha hecho falta modificar la acción de book, pero no ha hecho falta crear una nueva. Como precondición mira si hay alguna **habitación disponible con la orientación preferente**, libre durante todos los días de la reserva y del tamaño adecuado. También mira si hay alguna habitación disponible que cumpla todos los requerimientos pese a que **no sea de la orientación deseada**. Si la reserva se hace de una habitación que no tiene la orientación deseada se suma uno al número de reservas que no tienen la orientación deseada.

```pddl
(when (not (= (book_orientation ?booking) (room_orientation ?room))) (increase (non_oriented_bookings) 1))
```

En el problema se usa `Metric-FF` para minimizar el numero de reservas con una orientación incorrecta (no preferida por el huésped): `(:metric minimize (non_oriented_bookings))`.



