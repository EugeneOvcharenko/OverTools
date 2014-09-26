--email: over.programming@gmail.com
--https://github.com/EugeneOvcharenko/OverTools
macroScript SetBlackColorAndApplyMaterial
category:"Over Tools"
tooltip:"Set black color, and apply material from first slot"
buttontext:"Set black color, and apply material from first slot"
icon:#("standard", 30)
(
	on execute do 
	(		
		if ( $ != undefined ) then
		(			
			$.material = meditMaterials[1]
			$.wirecolor = color 0 0 0
		)
			else
		print "No object selected."
	)	
)