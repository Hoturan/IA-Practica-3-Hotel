(define (domain hotel)
    (:requirements :strips :equality :typing :adl)
    (:types
        room - item
        booking - item
        day - item
    )
    (:functions
        (room_size ?room - room)                ; size of the room
        (book_size ?booking - booking)          ; amount of people of the booking
        (waste)                                 ; total wasted space in rooms
        (different_rooms_booked)                 ; number of rooms booked at least once
    )
    (:predicates
        (free ?room - room ?day - day)          ; true iff the room is empty that day
        (scheduled ?booking - booking)          ; true iff booking is satisfied
        (booked ?booking - booking ?day - day)  ; true iff booking is for that day
        (used ?room - room)                     ; true iff room is booked at least once
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
                    (when (booked ?booking ?day)
                        (and 
                            (not (free ?room ?day))
                            (increase (waste) (- (room_size ?room) (book_size ?booking)))
                        )
                    )
                )
                (scheduled ?booking)
                (when (not (used ?room))
                    (and
                        (increase (different_rooms_booked) 1)
                        (used ?room)
                    )
                )
            )
    )
)
