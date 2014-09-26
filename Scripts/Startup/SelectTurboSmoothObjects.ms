--email: over.programming@gmail.com
--https://github.com/EugeneOvcharenko/OverTools
macroScript SelectTurboSmoothObjects
category:"Over Tools"
tooltip:"Select objects with TurboSmooth modifier"
buttontext:"Select objects with TurboSmooth modifier"
icon:#("standard", 13)
(
	on execute do 
	(	
		if ( $ != undefined ) then
		(			
			objs = #()
			count = selection.count;
			if $selection.count > 0 then
			(
				if $selection.count == 1 then
				(
					if ( not $ == undefined ) then
					(								
						if ( CheckTurboSmoothOnObject( $ ) ) then
						(
							append objs $
							count = count - 1
						)
					)
				)
					else				
				(
					for i = 1 to $selection.count do
					(			
						if ( not $[i] == undefined ) then
						(					
							if ( CheckTurboSmoothOnObject( $[i] ) ) then
							(
								append objs $[i]
								count = count - 1
							)				
						)						
					)		
				)					
			)
			
			max select none
			select objs
			
			print "Objects selected:"
			print count as string
		)
			else
		print "No object are selected."
	)	
)

fn CheckTurboSmoothOnObject obj = 
(	
	res = false
	for j = 1 to obj.modifiers.count do
	(					
		if obj.modifiers[j].name == "TurboSmooth" then
		(			
			res = true
		)
	)
	return res
)