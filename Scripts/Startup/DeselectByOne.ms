--email: over.programming@gmail.com
--https://github.com/EugeneOvcharenko/OverTools
macroScript DeselectByOne
category:"Over Tools"
tooltip:"Deselect by one element"
buttontext:"Deselect by one element"
icon:#("standard", 15)
(
	on execute do 
	(		
		if ( $ != undefined ) then
		(			
			if subobjectLevel > 0 and subobjectLevel < 5 then
			(				
				selected = $.EditablePoly.GetSelection(subobjectLevel)
				use_deselect = 0;
				for i = 1 to selected.count do
				(	
					if selected[ i ] then
					(
						if use_deselect > 0 then
						(
							selected[ i ] = false;
							use_deselect = use_deselect - 1;
						)
						else
						(
							use_deselect = 1;
						)
					)
				)
				$.EditablePoly.SetSelection subobjectLevel selected
				print "Deselecting by one.."
			)
			else
			(
				print "selection is no good.."
			)
		)
		else
		(
			print "selection is no good.."
		)		
	)
)