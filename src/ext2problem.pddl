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
        (= (sizeR room1) 1)
        (= (sizeR room2) 1)
        (= (sizeB book1) 1)
        (= (sizeB book2) 1)
        (= (orientationR room1) 0)
        (= (orientationR room2) 0)
        (= (orientationB book1) 1)
        (= (orientationB book2) 1)
        (= (nonOrientedBookings) 0)
    )

    (:goal (and (forall (?book - booking) (scheduled ?book))))
    
    (:metric minimize (nonOrientedBookings))
)
