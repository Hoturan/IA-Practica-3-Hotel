;; TODO
;; En assign realmente se tiene que comprobar que la habitacion no está ocupada ninguno de los dias,
;; de momento solo se comprueba que no está ocupada el primero, habrá que hacer un forall o algo parecido.
;; También hace falata comprobar que el numero de gente cabe en la habitacion, un smaller or equal than.

(define (domain strips-hotel)
    (:requirements :strips)
    (:predicates
        (room ?id ?size)
        (reservation ?id ?size ?init ?final)
        (room-occupied ?id ?day) 
        (days-in ?d ?init ?final)
        (room-assign ?room_id ?reservation_id))
        
    (:action assign
        :parameters (?room_id ?room_size ?reservation_id ?reservation_size ?init ?final)
        :precondition 
            (and
                (room ?room_id ?room_size)
                (reservation ?reservation_id ?reservation_size ?init ?final) 
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
                (room ?room_id ?room_size)
                (reservation ?reservation_id ?reservation_size ?init ?final) 
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