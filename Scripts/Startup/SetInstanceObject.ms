--email: over.programming@gmail.com
--https://github.com/EugeneOvcharenko/OverTools
macroScript SetInstanceObject
category:"Over Tools"
internalcategory:"Views"
tooltip:"Set Instance Object"
buttontext:"Set Instance Object"
icon:#("standard", 2)
(
on execute do 
(
set1 = selectionSets["instance"]
selected = $
for i = 1 to set1.count do
(
instanceReplace set1[i] selected
)
deleteItem  selectionSets "instance"
)
)