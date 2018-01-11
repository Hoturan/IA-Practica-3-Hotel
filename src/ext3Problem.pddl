(define (problem ext3) (:domain hotel)
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
        (= (room_size room1) 3)
        (= (room_size room2) 2)
        (= (book_size book1) 2)
        (= (book_size book2) 2)
        (= (waste) 0)
    )

    (:goal (and (forall (?book - booking) (scheduled ?book))))

    (:metric minimize (waste))
)
