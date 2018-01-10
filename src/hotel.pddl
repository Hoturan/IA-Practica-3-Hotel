(define (domain hotel)
    (:requirements :strips :equality :typing :adl)
    (:types
        room - item
        booking - item
        day - item
    )
    (:functions
        (sizeR ?room - room)
        (sizeB ?booking - booking)
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
                    (and (free ?room ?day) (>= (sizeR ?room) (sizeB ?booking)))
                    (not (booked ?booking ?day))
                )
            )
        :effect
            (and
                (forall (?day - day) 
                    (when (booked ?booking ?day) (not (free ?room ?day)))
                )
                (scheduled ?booking)
            )
    )
)