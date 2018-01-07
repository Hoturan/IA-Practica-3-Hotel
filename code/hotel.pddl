(define (domain strips-hotel)
	(:requirements :strips)
	(:predicates
		(room ?id ?num) (reservation ?id ?num ?init ?final) (room-occupied ?id ?day) 
		(days-in ?d ?init ?final) (room-assign ?rid ?reid))
		
	(:action assign
		:parameters (?rid ?rnum ?reid ?renum ?init ?final)
		:precondition (and
				(room ?rid ?rnum) (reservation ?reid ?renum ?init ?final) 
				(not (room-occupied ?rid ?init))))
		:effect (and (room-assign ?rid ?reid) (room-occupied ?rid ?init))