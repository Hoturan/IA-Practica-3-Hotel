;; TODO
;; En assign realmente se tiene que comprobar que la habitacion no está ocupada ninguno de los dias,
;; de momento solo se comprueba que no está ocupada el primero, habrá que hacer un forall o algo parecido.
;; También hace falata comprobar que el numero de gente cabe en la habitacion, un smaller or equal than.

(define (domain strips-hotel)
    (:requirements [:strips] [:equality] [:typing] [:adl])
    (:types
        ROOM
        RESERVATION
        DAY
    )
    (:predicates
        (size ?room - ROOM) ; size of the room
        (free ?room - ROOM ?day - DAY) ; true if ROOM room is free in DAY day
        (size ?reservation - RESERVATION) ; amount of people for the reservation
        (init ?reservation - RESERVATION) ; initial DAY for the reservation
        (days ?reservation - RESERVATION) ; total amount of days for the reservation
        (sat  ?reservation - RESERVATION) ; true if reservation is satisfied
    )
        
    (:action assign
        :parameters (?room - ROOM ?reservation - RESERVATION)
        :precondition
            (and
                forall (free)
                (RESERVATION ?reservation_id ?reservation_size ?init ?final) 
                (not (room-occupied ?room_id ?init))
            )
        :effect 
            (and
                (room-assign ?room_id ?reservation_id)
                (room-occupied ?room_id ?init)
            )
    )
        
    
    (:action deassing
        :parameters (?room_id ?room_size ?reservation_id ?reservation_size ?init ?final)
        :precondition 
            (and
                (ROOM ?room_id ?room_size)
                (RESERVATION ?reservation_id ?reservation_size ?init ?final) 
                (room-occupied ?room_id ?init)
                (room-assign ?room_id ?reservation_id)
            )
        :effect 
            (and
                (not (room-assign ?room_id ?reservation_id))
                (not (room-occupied ?room_id ?init))
            )
    )
)