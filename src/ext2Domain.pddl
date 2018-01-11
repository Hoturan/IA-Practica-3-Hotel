(define (domain hotel)
    (:requirements :strips :equality :typing :adl :action-costs)
    (:types
        room - item
        booking - item
        day - item
    )
    (:functions
        (room_size ?room - room)
        (book_size ?booking - booking)
        (total_bookings)
        (room_orientation ?room - room)
        (book_orientation ?booking - booking)
        (non_oriented_bookings)
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
                (= (book_orientation ?booking) (room_orientation ?room))
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
                (increase (total_bookings) 1)
            )
    )
    
    (:action book
        :parameters (?room - room ?booking - booking)
        :precondition
            (and
                (not (= (book_orientation ?booking) (room_orientation ?room)))
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
                (increase (total_bookings) 1)
                (increase (non_oriented_bookings) 1)
            )
    )
)
