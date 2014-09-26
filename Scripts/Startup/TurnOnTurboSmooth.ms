--email: over.programming@gmail.com
--https://github.com/EugeneOvcharenko/OverTools
macroScript TurnOnTurboSmooth
category:"Over Tools"
tooltip:"Turn on TurboSmooth modifier"
buttontext:"Turn on TurboSmooth modifier"
icon:#("standard", 12)
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
					TurnOnTurboSmoothOnObject( $ )
				)
					else				
				for i = 1 to $selection.count do
				(					
					if TurnOnTurboSmoothOnObject( $[i] ) then
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

fn TurnOnTurboSmoothOnObject obj = 
(	
	res = false
	for j = 1 to obj.modifiers.count do
	(		
		if obj.modifiers[j].name == "TurboSmooth" then
		(
			obj.modifiers[j].enabledInViews = true
			obj.modifiers[j].enabled = true
			obj.modifiers[j].ForceUpdate()
			res = true
		)
	)		
	return res
)