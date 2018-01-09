;; TODO
;; En assign realmente se tiene que comprobar que la habitacion no está ocupada ninguno de los dias,
;; de momento solo se comprueba que no está ocupada el primero, habrá que hacer un forall o algo parecido.
;; También hace falata comprobar que el numero de gente cabe en la habitacion, un smaller or equal than.

(define (domain hotel)
    (:requirements :strips :equality :typing :adl)
    (:types
        room - item
        booking - item
        day - item
    )
    (:functions
        (size ?room - room)
        (size ?booking - booking)
    )
    (:predicates
        (free ?room - room ?day - day)
        (scheduled ?booking - booking)
        (booked ?booking - booking ?day - day)
    )
        
    (:action book
        :parameters (?room - room ?booking - booking)
        :precondition 
            (forall (?day - day) 
                (or
                    (and (free ?room ?day) (>= (size ?room) (size ?booking)))
                    (not (booked ?booking ?day))
                )
            )
        :effect
            (and
                (forall (?day - day) 
                    (when (booked ?booking ?day) (not (free ?room ?day)))
                )
                (scheduled ?booking - booking)
            )
    )
)