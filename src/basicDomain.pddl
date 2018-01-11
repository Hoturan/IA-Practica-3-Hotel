(define (domain hotel)
    (:requirements :strips :equality :typing :adl)
    (:types
        room - item
        booking - item
        day - item
    )
    (:functions
        (room_size ?room - room)
        (book_size ?booking - booking)
    )
    (:predicates
        (free ?room - room ?day - day)
        (scheduled ?booking - booking)
        (booked ?booking - booking ?day - day)
    )

    (:action book
        :parameters (?room - room ?booking - booking)
        :precondition
            (and
                (not (scheduled ?booking))
                (>= (room_size ?room) (book_size ?booking))
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
)
