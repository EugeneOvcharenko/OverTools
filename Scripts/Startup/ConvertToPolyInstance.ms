--email: over.programming@gmail.com
--https://github.com/EugeneOvcharenko/OverTools
macroScript ConvertToPolyInstance
category:"Over Tools"
tooltip:"Collapse poly modifier stack and remember instances"
buttontext:"Collapse instance poly stack"
icon:#("standard", 6)
(
	on execute do 
	(	
		if ( $ != undefined ) then
		(
			objs_tm = #()
			objs = #()
			toReplaceObject = $
			for obj in objects do
			(
				if ( areNodesInstances  toReplaceObject obj ) and ( toReplaceObject.name != obj.name ) then
				(
					append objs_tm obj.transform
					append objs obj
				)			
			)
			
			for obj in objs do
			(				
				selectMore obj				
			)
			macros.run "Modifier Stack" "Convert_to_Poly"

			for obj in objs do
			(
				instanceReplace obj toReplaceObject
			)
		)
			else
		print "No object selected."
	)	
)
