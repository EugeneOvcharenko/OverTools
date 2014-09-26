--email: over.programming@gmail.com
--https://github.com/EugeneOvcharenko/OverTools
macroScript DeselectByTwo
category:"Over Tools"
tooltip:"Deselect by two element"
buttontext:"Deselect by two element"
icon:#("standard", 16)
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
							use_deselect = 2;
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