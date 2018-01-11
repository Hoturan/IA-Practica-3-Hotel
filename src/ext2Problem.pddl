(define (problem ext2) (:domain hotel)
    (:objects
    	room1 - room
    	room2 - room
    	book1 - booking
    	book2 - booking
    	day1 - day
    	day2 - day
    	day3 - day
    	day4 - day
    	day5 - day
    	day6 - day
    	day7 - day
    	day8 - day
    	day9 - day
    )
    (:init
        (free room1 day1)
        (free room1 day2)
        (free room2 day1)
        (free room2 day2)
        (booked book1 day1)
        (booked book2 day2)
        (= (room_size room1) 1)
        (= (room_size room2) 1)
        (= (book_size book1) 1)
        (= (book_size book2) 1)
        (= (room_orientation room1) 0)
        (= (room_orientation room2) 0)
        (= (book_orientation book1) 1)
        (= (book_orientation book2) 1)
        (= (non_oriented_bookings) 0)
    )

    (:goal (and (forall (?book - booking) (scheduled ?book))))
    
    (:metric minimize (non_oriented_bookings))
)
