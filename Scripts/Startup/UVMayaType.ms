--email: over.programming@gmail.com
--https://github.com/EugeneOvcharenko/OverTools
macroScript UVMayaType
category:"Over Tools"
internalcategory:"Views"
tooltip:"UV Maya type"
buttontext:"UV Maya type"
icon:#("standard", 3)
(
on execute do 
(
modPanel.addModToSelection (Unwrap_UVW ()) ui:on
$selection[ $selection.count	].modifiers[#unwrap_uvw].unwrap.edit ()
$selection[ $selection.count	].modifiers[#unwrap_uvw].unwrap.setCurrentMap 2
)
)