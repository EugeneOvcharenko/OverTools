--email: over.programming@gmail.com
--https://github.com/EugeneOvcharenko/OverTools
macroScript RestoreEdgeSelection
category:"Over Tools"
tooltip:"Restore edge selection for future restore"
buttontext:"Restore edge selection"
icon:#("standard", 14)
(
	on execute do 
	(		
		if ( $ != undefined ) then
		(			
			count = 0;
			edges = #{};
			edge_count = $.EditablePoly.getNumEdges();
			if edge_count > 0 then
			(			
				for i = 1 to edge_count do
				(					
					$.EditablePoly.SetSelection #Edge #{i}
					edge_weight = $.EditablePoly.getEdgeData 0 1 false
					if edge_weight == 0.165 then
					(
						count = count + 1
						append edges i
					)
				)				
				$.EditablePoly.SetSelection #Edge edges			
				--$.EditablePoly.resetEdgeData( 0 );				
			)	
			
			if count > 0 then
			(
				print "Edge selection restored"
			)
			else
			(
				print "No saved edges found"
			)
		)
			else
		print "No object selected."
	)	
)