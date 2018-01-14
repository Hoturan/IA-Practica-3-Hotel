(define (domain hotel)
    (:requirements :strips :equality :typing :adl :action-costs)
    (:types
        room - item
        booking - item
        day - item
    )
    (:functions
        (room_size ?room - room)                ; size of the room
        (book_size ?booking - booking)          ; amount of people of the booking
        (room_orientation ?room - room)         ; orientation of the room
        (book_orientation ?booking - booking)   ; prefered orientation of the booking
        (non_oriented_bookings)                 ; total of non oriented bookings
    )
    (:predicates
        (free ?room - room ?day - day)          ; true iff the room is empty that day
        (scheduled ?booking - booking)          ; true iff booking is satisfied
        (booked ?booking - booking ?day - day)  ; true iff booking is for that day
    )

    (:action book
        :parameters (?room - room ?booking - booking)
        :precondition
            (and
                ;(= (book_orientation ?booking) (room_orientation ?room)) ; must book a room even if it is not the prefered orientation
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
                (when (not (= (book_orientation ?booking) (room_orientation ?room)))
                    (increase (non_oriented_bookings) 1))
            )
    )
)
