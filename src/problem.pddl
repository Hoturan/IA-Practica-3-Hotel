(define (problem basic) (:domain hotel)
    (:objects
    	room0 - room
    	;room1 - room
    	book0 - booking
    	book1 - booking
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
        (free room0 day1)
        (free room0 day2)
        (free room0 day3)
        ;(free room1 day1)
        ;(free room1 day2)
        ;(free room1 day3)
        (booked book0 day1)
        ;(booked book0 day2)
        ;(booked book0 day3)
        ;(booked book1 day1)
        (booked book1 day2)
        ;(booked book1 day3)
        (= (sizeR room0) 4)
        ;(= (sizeR room1) 2)
        (= (sizeB book0) 2)
        (= (sizeB book1) 4)
    )

    (:goal (and (forall (?book - booking) (scheduled ?book)))))
