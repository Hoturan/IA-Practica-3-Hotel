(define (problem basic) (:domain hotel)
    (:objects
    	room0 - room
    	room1 - room
    	book11 - booking
    	book21 - booking
    	book31 - booking
    	book41 - booking
    	book51 - booking
    	book61 - booking
    	book71 - booking
    	book81 - booking
    	book91 - booking
    	book12 - booking
    	book22 - booking
    	book32 - booking
    	book42 - booking
    	book52 - booking
    	book62 - booking
    	book72 - booking
    	book82 - booking
    	book92 - booking
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
        (free room0 day4)
        (free room0 day5)
        (free room0 day6)
        (free room0 day7)
        (free room0 day8)
        (free room0 day9)
        (free room1 day1)
        (free room1 day2)
        (free room1 day3)
        (free room1 day4)
        (free room1 day5)
        (free room1 day6)
        (free room1 day7)
        (free room1 day8)
        (free room1 day9)
        (booked book11 day1)
        (booked book21 day2)
        (booked book31 day3)
        (booked book41 day4)
        (booked book51 day5)
        (booked book61 day6)
        (booked book71 day7)
        (booked book81 day8)
        (booked book91 day9)
        (booked book12 day1)
        (booked book22 day2)
        (booked book32 day3)
        (booked book42 day4)
        (booked book52 day5)
        (booked book62 day6)
        (booked book72 day7)
        (booked book82 day8)
        (booked book92 day9)
        (= (room_size room0) 2)
        (= (room_size room1) 1)
        (= (book_size book11) 1)
        (= (book_size book21) 1)
        (= (book_size book31) 1)
        (= (book_size book41) 1)
        (= (book_size book51) 1)
        (= (book_size book61) 1)
        (= (book_size book71) 1)
        (= (book_size book81) 1)
        (= (book_size book91) 1)
        (= (book_size book12) 2)
        (= (book_size book22) 2)
        (= (book_size book32) 2)
        (= (book_size book42) 2)
        (= (book_size book52) 2)
        (= (book_size book62) 2)
        (= (book_size book72) 2)
        (= (book_size book82) 2)
        (= (book_size book92) 2)
    )

    (:goal (or (forall (?book - booking) (scheduled ?book))))
)
