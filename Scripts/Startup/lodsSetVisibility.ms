--email: over.programming@gmail.com
--https://github.com/EugeneOvcharenko/OverTools
macroScript LodSetsVisibility
category:"Over Tools"
internalcategory:"Views"
tooltip:"Lod`s sets visibility"
buttontext:"Lod`s sets visibility"
icon:#("standard", 1)
(
on execute do 
(
	global LodSetsVisibilityLastObjectTriangleCount = 0
	global LodSetsVisibilityDistanceLod0
	global LodSetsVisibilityDistanceLod1
	global LodSetsVisibilityDistanceLod2
	global LodSetsVisibilityDistanceLod3
	global LodSetsVisibilityDistanceLod4
	if LodSetsVisibilityDistanceLod0 == undefined then LodSetsVisibilityDistanceLod0 = 0
	if LodSetsVisibilityDistanceLod1 == undefined then LodSetsVisibilityDistanceLod1 = 700
	if LodSetsVisibilityDistanceLod2 == undefined then LodSetsVisibilityDistanceLod2 = 1500
	if LodSetsVisibilityDistanceLod3 == undefined then LodSetsVisibilityDistanceLod3 = 3500
	if LodSetsVisibilityDistanceLod4 == undefined then LodSetsVisibilityDistanceLod4 = 7000
		
	LodSetsVisibilityDistanceLod0 = 0
	LodSetsVisibilityDistanceLod1 = 4000
	LodSetsVisibilityDistanceLod2 = 8000
	LodSetsVisibilityDistanceLod3 = 16000
	LodSetsVisibilityDistanceLod4 = 32000
	createDialog selectionSetsUtility	
)
)

check = false
follow_lod = false
follow_dmg = false
follow_add1 = false
follow_add2 = false
str = ""
crntSet = 0
blink = false

pos1 = [0,0,0]
pos2 = [0,0,0]
lodn = ""

fn setSelectionNumber n =
(
	local LodSetsVisibilityCurrentObjectTriangleCount = 0
	set1 = selectionSets[n]
	if set1 != undefined then
	(
		hide $*
		unhide set1
		if check then 
		(
			deselect $*
			LodSetsVisibilityLastObjectTriangleCount = 0
		)
		else
		(
			select set1	
			if $selection.count > 0 then
			(
				if $selection.count == 1 then
				(
					tv = GetTriMeshFaceCount( $ )	
					LodSetsVisibilityCurrentObjectTriangleCount = tv[1]		
				)
					else
				for i = 1 to $selection.count do
				(	
					tv = GetTriMeshFaceCount( $[i] )	
					LodSetsVisibilityCurrentObjectTriangleCount = LodSetsVisibilityCurrentObjectTriangleCount + tv[1]		
				)		
			)
			delta = LodSetsVisibilityLastObjectTriangleCount - LodSetsVisibilityCurrentObjectTriangleCount
			mdelta = LodSetsVisibilityLastObjectTriangleCount as float / LodSetsVisibilityCurrentObjectTriangleCount as float
			percent = 100 * LodSetsVisibilityCurrentObjectTriangleCount as float / LodSetsVisibilityLastObjectTriangleCount as float
			LodSetsVisibilityLastObjectTriangleCount = LodSetsVisibilityCurrentObjectTriangleCount
			if not( follow_lod or follow_dmg or follow_add1 or follow_add2 ) then
				format "% %%. %% %%\n" n": Delta triangles: " delta "Discrepancy: " mdelta "Percents: " percent
		)
		pos1 = set1.center
		lodn = n
		if set1 != crntSet then blink = true
		crntSet = n
		return LodSetsVisibilityCurrentObjectTriangleCount
	)
)	

fn GetDistanceFromLodToCamera = 
(
	coordSysTM = Inverse(getViewTM())
	pos2 = coordSysTM.row4
	return ( distance pos1 pos2 )
)

x0 = 5
x = 0.0
x = x0
dx = 35.0

y0 = 15.0
dy = 25.0

y = 0.0
y = y0

fn GetFirstX =
(
	x = x0
	return x
)

fn GetNextX =
(
	x = x + dx
	return x - dx
)

fn GetFirstY =
(
	y = y0
	return y
)

fn GetDY =
(	
	y = y + dy
	return dy
)

rollout selectionSetsUtility "Lod`s" width:185 height:235
(
	button btnl0 "lod 0" pos:[GetFirstX(),GetFirstY()] width:dx height:(GetDY())
	button btnl1 "lod 1" pos:[x,y] width:dx height:(GetDY())
	button btnl2 "lod 2" pos:[x,y] width:dx height:(GetDY())
	button btnl3 "lod 3" pos:[x,y] width:dx height:(GetDY())
	button btnl4 "lod 4" pos:[GetNextX(),y] width:dx height:(GetDY())
	
	button btnd0 "dmg 0" pos:[x,GetFirstY()] width:dx height:(GetDY())
	button btnd1 "dmg 1" pos:[x,y] width:dx height:(GetDY())
	button btnd2 "dmg 2" pos:[x,y] width:dx height:(GetDY())
	button btnd3 "dmg 3" pos:[x,y] width:dx height:(GetDY())
	button btnd4 "dmg 4" pos:[GetNextX(),y] width:dx height:(GetDY())

	button btna0 "add 0" pos:[x,GetFirstY()] width:dx height:(GetDY())
	button btna1 "add 1" pos:[x,y] width:dx height:(GetDY())
	button btna2 "add 2" pos:[x,y] width:dx height:(GetDY())
	button btna3 "add 3" pos:[x,y] width:dx height:(GetDY())
	button btna4 "add 4" pos:[GetNextX(),y] width:dx height:(GetDY())

	button btna20 "add2 0" pos:[x,GetFirstY()] width:dx height:(GetDY())
	button btna21 "add2 1" pos:[x,y] width:dx height:(GetDY())
	button btna22 "add2 2" pos:[x,y] width:dx height:(GetDY())
	button btna23 "add2 3" pos:[x,y] width:dx height:(GetDY())
	button btna24 "add2 4" pos:[GetNextX(),y] width:dx height:(GetDY())

	button btns0 "dist 0" pos:[x,GetFirstY()] width:dx height:(GetDY()) toolTip: ( LodSetsVisibilityDistanceLod0 as string ) 
	button btns1 "dist 1" pos:[x,y] width:dx height:(GetDY()) toolTip: ( LodSetsVisibilityDistanceLod1 as string ) 
	button btns2 "dist 2" pos:[x,y] width:dx height:(GetDY()) toolTip: ( LodSetsVisibilityDistanceLod2 as string ) 
	button btns3 "dist 3" pos:[x,y] width:dx height:(GetDY()) toolTip: ( LodSetsVisibilityDistanceLod3 as string ) 
	button btns4 "dist 4" pos:[GetNextX(),y] width:dx height:(GetDY()) toolTip: ( LodSetsVisibilityDistanceLod4 as string ) 
	
	Timer tmr1 "Timer" pos:[4,4] width:24 height:24 interval:100	
		
	checkbox chk1 "Deselect"				pos:[12,145] width:66 height:14 checked:false
	checkbox chk3 "Follow: lod"			pos:[12,160] width:99 height:14 checked:false
	checkbox chk4 "Follow: dmg_lod"	pos:[12,175] width:99 height:14 checked:false
	checkbox chk5 "Follow: add_lod"	pos:[12,190] width:99 height:14 checked:false
	checkbox chk6 "Follow: add_lod2"	pos:[12,205] width:99 height:14 checked:false
	label lbl1 "Dist. to:" 						pos:[07,235] width:99 height:12	
	label lbl7 "" 								pos:[51,235] width:55 height:14	
	label lbl2 "" 								pos:[12,250] width:75 height:12
	label lbl3 "" 								pos:[125,145] width:75 height:12
		
	on selectionSetsUtility open  do
	(
		chk1.checked = check
		chk3.checked = follow_lod
		chk4.checked = follow_dmg
		chk5.checked = follow_add1
		chk6.checked = follow_add2
	)
	
	on btnl0 pressed do(btnl0.tooltip = "Triangles: " + ( setSelectionNumber "lod0" ) as string)
	on btnl1 pressed do(btnl1.tooltip = "Triangles: " + ( setSelectionNumber "lod1" ) as string)
	on btnl2 pressed do(btnl2.tooltip = "Triangles: " + ( setSelectionNumber "lod2" ) as string)
	on btnl3 pressed do(btnl3.tooltip = "Triangles: " + ( setSelectionNumber "lod3" ) as string)
	on btnl4 pressed do(btnl4.tooltip = "Triangles: " + ( setSelectionNumber "lod4" ) as string)
	
	on btnd0 pressed do(btnd0.tooltip = "Triangles: " + ( setSelectionNumber "dmg_lod0" ) as string)
	on btnd1 pressed do(btnd1.tooltip = "Triangles: " + ( setSelectionNumber "dmg_lod1" ) as string)
	on btnd2 pressed do(btnd2.tooltip = "Triangles: " + ( setSelectionNumber "dmg_lod2" ) as string)
	on btnd3 pressed do(btnd3.tooltip = "Triangles: " + ( setSelectionNumber "dmg_lod3" ) as string)
	on btnd4 pressed do(btnd4.tooltip = "Triangles: " + ( setSelectionNumber "dmg_lod4" ) as string)
	
	on btna0 pressed do(btna0.tooltip = "Triangles: " + ( setSelectionNumber "add_lod0" ) as string)
	on btna1 pressed do(btna1.tooltip = "Triangles: " + ( setSelectionNumber "add_lod1" ) as string)
	on btna2 pressed do(btna2.tooltip = "Triangles: " + ( setSelectionNumber "add_lod2" ) as string)
	on btna3 pressed do(btna3.tooltip = "Triangles: " + ( setSelectionNumber "add_lod3" ) as string)
	on btna4 pressed do(btna4.tooltip = "Triangles: " + ( setSelectionNumber "add_lod4" ) as string)
	
	on btna20 pressed do(btna0.tooltip = "Triangles: " + ( setSelectionNumber "add_lod20" ) as string)
	on btna21 pressed do(btna1.tooltip = "Triangles: " + ( setSelectionNumber "add_lod21" ) as string)
	on btna22 pressed do(btna2.tooltip = "Triangles: " + ( setSelectionNumber "add_lod22" ) as string)
	on btna23 pressed do(btna3.tooltip = "Triangles: " + ( setSelectionNumber "add_lod23" ) as string)
	on btna24 pressed do(btna4.tooltip = "Triangles: " + ( setSelectionNumber "add_lod24" ) as string)	
		
	on btns0 pressed do
	(		
		LodSetsVisibilityDistanceLod0 = GetDistanceFromLodToCamera()
		btns0.tooltip = "Distance: " + ( LodSetsVisibilityDistanceLod0 ) as string
	)
	on btns1 pressed do
	(
		LodSetsVisibilityDistanceLod1 = GetDistanceFromLodToCamera()
		btns1.tooltip = "Distance: " + ( LodSetsVisibilityDistanceLod1 ) as string
	)
	on btns2 pressed do
	(
		LodSetsVisibilityDistanceLod2 = GetDistanceFromLodToCamera()
		btns2.tooltip = "Distance: " + ( LodSetsVisibilityDistanceLod2 ) as string
	)		
	on btns3 pressed do
	(
		LodSetsVisibilityDistanceLod3 = GetDistanceFromLodToCamera()
		btns3.tooltip = "Distance: " + ( LodSetsVisibilityDistanceLod3 ) as string
	)		
	on btns4 pressed do
	(
		LodSetsVisibilityDistanceLod4 = GetDistanceFromLodToCamera()
		btns4.tooltip = "Distance: " + ( LodSetsVisibilityDistanceLod4 ) as string
	)			
	
	on chk1 changed state do
		check = chk1.checked
	
	on tmr1 tick do
	(
		coordSysTM = Inverse(getViewTM())
		pos2 = coordSysTM.row4
		str = 0.0
		str = distance pos1 pos2
		lbl2.Caption = str as string
		lbl3.Caption = str as string
				
		if follow_lod or follow_dmg or follow_add1 or follow_add2 then
		(
			if blink then
			(
				blink = false
			)

			if str > LodSetsVisibilityDistanceLod4 then
			(
				if follow_lod then setSelectionNumber "lod4"
				if follow_dmg then setSelectionNumber "dmg_lod4"
				if follow_add1 then setSelectionNumber "add_lod4"
				if follow_add2 then setSelectionNumber "add_lod24"
			)
			else			
				if str > LodSetsVisibilityDistanceLod3 then
				(
					if follow_lod then setSelectionNumber "lod3"
					if follow_dmg then setSelectionNumber "dmg_lod3"
					if follow_add1 then setSelectionNumber "add_lod3"
					if follow_add2 then setSelectionNumber "add_lod23"
				)
				else
					if str > LodSetsVisibilityDistanceLod2 then 
					(
						if follow_lod then setSelectionNumber "lod2"
						if follow_dmg then setSelectionNumber "dmg_lod2"
						if follow_add1 then setSelectionNumber "add_lod2"
						if follow_add2 then setSelectionNumber "add_lod22"
					)
					else
						if str > LodSetsVisibilityDistanceLod1 then 										
						(
							if follow_lod then setSelectionNumber "lod1"
							if follow_dmg then setSelectionNumber "dmg_lod1"
							if follow_add1 then setSelectionNumber "add_lod1"
							if follow_add2 then setSelectionNumber "add_lod21"
						)
						else
							(
								if follow_lod then setSelectionNumber "lod0"
								if follow_dmg then setSelectionNumber "dmg_lod0"
								if follow_add1 then setSelectionNumber "add_lod0"
								if follow_add2 then setSelectionNumber "add_lod20"
							)
			lbl7.caption = lodn					
		)
	)
	
	on chk3 changed state do
	(
		follow_lod = chk3.checked		
		chk4.checked	= false
		chk5.checked	= false
		follow_dmg = false
		follow_add1 = false
		follow_add2 = false
		
		tmr1.active = follow_lod or follow_dmg or follow_add1 or follow_add2				
		if tmr1.active then
			selectionSetsUtility.height = 297
		else
			selectionSetsUtility.height = 235	
		tmr1.active = true
	)
	
	on chk4 changed state do
	(
		follow_dmg = chk4.checked		
		chk3.checked	= false
		chk5.checked	= false
		follow_lod = false
		follow_add1 = false
		follow_add2 = false
		
		tmr1.active = follow_lod or follow_dmg or follow_add1 or follow_add2	
		if tmr1.active then
			selectionSetsUtility.height = 297
		else
			selectionSetsUtility.height = 235
		tmr1.active = true
	)
	
	on chk5 changed state do
	(
		follow_add1 = chk5.checked
		chk3.checked	= false
		chk4.checked	= false		
		follow_lod = false
		follow_dmg = false
		follow_add2 = false
		
		tmr1.active = follow_lod or follow_dmg or follow_add1 or follow_add2	
		if tmr1.active then
			selectionSetsUtility.height = 297
		else
			selectionSetsUtility.height = 235
		tmr1.active = true
	)	
	
	on chk6 changed state do
	(
		follow_add2 = chk6.checked
		chk3.checked	= false
		chk4.checked	= false		
		follow_lod = false
		follow_dmg = false
		follow_add1 = false

		tmr1.active = follow_lod or follow_dmg or follow_add1 or follow_add2	
		if tmr1.active then
			selectionSetsUtility.height = 297
		else
			selectionSetsUtility.height = 235
		tmr1.active = true
	)		
)