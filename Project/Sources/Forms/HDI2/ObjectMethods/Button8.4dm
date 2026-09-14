C_LONGINT:C283($col; $row)

LISTBOX GET CELL POSITION:C971(*; "distinctValuesList1"; $col; $row)

Case of 
		
	: (_DistinctPath{_DistinctPath}="Gender")
		// query if the attribute is a boolean
		If (_DistinctValues{$row}="female")
			QUERY BY ATTRIBUTE:C1331([CONTACTS_2:8]; [CONTACTS_2:8]Info:2; _distinctPath{_distinctPath}; =; True:C214)
		Else 
			QUERY BY ATTRIBUTE:C1331([CONTACTS_2:8]; [CONTACTS_2:8]Info:2; _distinctPath{_distinctPath}; =; False:C215)
		End if 
		
	: ((_DistinctPath{_DistinctPath}="Birthday") | (_DistinctPath{_DistinctPath}="Age"))
		// query if the attribute is an integer
		QUERY BY ATTRIBUTE:C1331([CONTACTS_2:8]; [CONTACTS_2:8]Info:2; _distinctPath{_distinctPath}; =; Num:C11(_DistinctValues{$row}))
	Else 
		// any other queries, it shall be a string
		QUERY BY ATTRIBUTE:C1331([CONTACTS_2:8]; [CONTACTS_2:8]Info:2; _distinctPath{_distinctPath}; =; _DistinctValues{$row})
End case 

updateStat