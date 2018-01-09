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
    (:action unbook
        :parameters (?room - room ?booking - booking)
        :precondition (forall (?day - day) (not (booked ?booking ?day)))
        :effect
            (and
                (forall (?day - day) 
                    (when (booked ?booking ?day) (free ?room ?day))
                )
                (not (scheduled ?booking - booking))
            )
    )
)