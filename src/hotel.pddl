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
        (assigned ?booking - booking ?room - room)
    )
        
    (:action book
        :parameters (?room - room ?booking - booking)
        :precondition
            (and
                (not (scheduled ?booking))
                (>= (sizeR ?room) (sizeB ?booking))
                (forall (?day - day)
                    (or
                        (free ?room ?day)
                        (not (booked ?booking ?day))
                    )
                )
            )
        :effect
            (and
                (forall (?day - day)
                    (when (booked ?booking ?day) (not (free ?room ?day)))
                )
                (scheduled ?booking)
                (assigned ?booking ?room)
            )
    )

    (:action unbook
        :parameters (?room - room ?booking - booking)
        :precondition
            (and
                (not (scheduled ?booking))
                (>= (sizeR ?room) (sizeB ?booking))
                (forall (?day - day)
                    (or
                        (free ?room ?day)
                        (not (booked ?booking ?day))
                    )
                )
            )
        :effect
            (and
                (forall (?day - day)
                    (when (booked ?booking ?day) (free ?room ?day))
                )
                (not (scheduled ?booking))
                (not (assigned ?booking ?room))
            )
    )
)
