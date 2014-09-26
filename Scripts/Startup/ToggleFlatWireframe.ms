--email: over.programming@gmail.com
--https://github.com/EugeneOvcharenko/OverTools
macroScript ToggleFlatWireframe
category:"Over Tools"
tooltip:"Toggle Flat Wireframe"
buttontext:"Toggle Flat Wireframe"
icon:#("standard", 7)
(
	on execute do 
	(	
		global toggle_flat_wireframe_bool;

		if toggle_flat_wireframe_bool == true then
		(
			actionMan.executeAction 0 "554"
			toggle_flat_wireframe_bool = false;
		)
		else
		(
			actionMan.executeAction 0 "551"
			toggle_flat_wireframe_bool = true;
		)
	)
)