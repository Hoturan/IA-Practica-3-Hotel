(define (domain hotel)
    (:requirements :strips :equality :typing :adl :action-costs)
    (:types
        room - item
        booking - item
        day - item
    )
    (:functions
        (sizeR ?room - room)
        (sizeB ?booking - booking)
        (orientationR ?room - room)
        (orientationB ?booking - booking)
        (nonOrientedBookings)
    )
    (:predicates
        (free ?room - room ?day - day)
        (scheduled ?booking - booking)
        (booked ?booking - booking ?day - day)
    )

    (:action bookequal
        :parameters (?room - room ?booking - booking)
        :precondition
            (and
                (= (orientationB ?booking) (orientationR ?room))
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
            )
    )
    
    (:action book
        :parameters (?room - room ?booking - booking)
        :precondition
            (and
                (not (= (orientationB ?booking) (orientationR ?room)))
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
                (increase (nonOrientedBookings) 1)
            )
    )
)
