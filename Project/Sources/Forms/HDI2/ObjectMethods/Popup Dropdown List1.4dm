Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		
		ARRAY TEXT:C222(_DistinctValues; 0)
		
		
		
		//restart with all records
		ALL RECORDS:C47([CONTACTS_2:8])
		updateStat
		vTextRecord:=String:C10(Records in selection:C76([CONTACTS_2:8]); "|LongInt")+" Records"
		
		
		Case of 
			: (_DistinctPath{_DistinctPath}="Gender")
				// for boolean type attributes we do a small conversion
				
				ARRAY BOOLEAN:C223(_DistinctValuesBool; 0)
				
				DISTINCT ATTRIBUTE VALUES:C1397([CONTACTS_2:8]Info:2; _DistinctPath{_DistinctPath}; _DistinctValuesBool)
				$szArray:=Size of array:C274(_DistinctValuesBool)
				ARRAY TEXT:C222(_DistinctValues; $szArray)
				
				For ($i; 1; $szArray)
					_DistinctValues{$i}:=Choose:C955(_DistinctValuesBool{$i}; "Female"; "Male")
				End for 
				
			: ((_DistinctPath{_DistinctPath}="Birthday") | (_DistinctPath{_DistinctPath}="Age"))
				//as well for integer type attribute we need to convert them in string. 
				
				ARRAY INTEGER:C220(_DistinctValuesInteger; 0)
				DISTINCT ATTRIBUTE VALUES:C1397([CONTACTS_2:8]Info:2; _DistinctPath{_DistinctPath}; _DistinctValuesInteger)
				$szArray:=Size of array:C274(_DistinctValuesInteger)
				ARRAY TEXT:C222(_DistinctValues; $szArray)
				For ($i; 1; $szArray)
					_DistinctValues{$i}:=String:C10(_DistinctValuesInteger{$i})
				End for 
				
				
			Else 
				//for string type attribute we insert them directly to the right array
				ARRAY TEXT:C222(_DistinctValues; 0)
				DISTINCT ATTRIBUTE VALUES:C1397([CONTACTS_2:8]Info:2; _DistinctPath{_DistinctPath}; _DistinctValues)
				
		End case 
		
		//selection of the first values
		If (Size of array:C274(_DistinctValues)>0)
			_DistinctValues{0}:=_DistinctValues{1}
		End if 
		
End case 
