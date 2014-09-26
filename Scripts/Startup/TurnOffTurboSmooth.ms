--email: over.programming@gmail.com
--https://github.com/EugeneOvcharenko/OverTools
macroScript TurnOffTurboSmooth
category:"Over Tools"
tooltip:"Turn off TurboSmooth modifier"
buttontext:"Turn off TurboSmooth modifier"
icon:#("standard", 11)
(
	on execute do 
	(	
		if ( $ != undefined ) then
		(			
			count = 0;
			if $selection.count > 0 then
			(
				if $selection.count == 1 then
				(
					TurnOffTurboSmoothOnObject( $ )
				)
					else				
				for i = 1 to $selection.count do
				(					
					if TurnOffTurboSmoothOnObject( $[i] ) then
					(
						count = count + 1
					)
				)						
			)	
			
			print "Object done:"
			print count as string
		)
			else
		print "No object selected."
	)	
)

fn TurnOffTurboSmoothOnObject obj = 
(	
	res = false
	for j = 1 to obj.modifiers.count do
	(					
		if obj.modifiers[j].name == "TurboSmooth" then
		(
			obj.modifiers[j].enabled = false
			res = true
		)
	)		
	return res
)