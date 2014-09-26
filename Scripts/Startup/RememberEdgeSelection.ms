--email: over.programming@gmail.com
--https://github.com/EugeneOvcharenko/OverTools
macroScript RememberEdgeSelection
category:"Over Tools"
tooltip:"Remember edge selection for future restore"
buttontext:"Remember edge selection"
icon:#("standard", 13)
(
	on execute do 
	(			
		if ( $ != undefined ) then
		(			
			edge_count = $.EditablePoly.getNumEdges();
			$.EditablePoly.resetEdgeData( 0 );
			
			if edge_count > 0 then
			(
				$.EditablePoly.setEdgeData 0 0.165					
			)
			print "Edge selection saved."
		)
			else
		print "No object selected."
	)	
)