;; en assign realmente se tiene que comprobar que la habitacion no está ocupada ninguno
;; de los dias, de momento solo compruebo que no está ocupada el primero, habrá que hacer un forall o algo

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