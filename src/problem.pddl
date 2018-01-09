(define (problem basic) (:domain hotel)
    (:objects
    	room0 - room
    	book0 - booking
    	day1 - day
    	day2 - day
    	day3 - day
    )
    (:init
        (free room0 day1)
        (free room0 day2)
        (free room0 day3)
        (booked book0 day2)
        (booked book0day3)
        (= (size room0) 3)
        (= (size book0) 2)
    )

    (:goal (and (forall (?book - book) (scheduled ?book)))))