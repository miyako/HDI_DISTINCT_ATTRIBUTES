Case of 
	: (Form event code:C388=On Selection Change:K2:29)
		var $date : Date
		var $col; $row; $age; $n; $i : Integer
		var $bool : Boolean
		
		LISTBOX GET CELL POSITION:C971(*; "contactsList"; $col; $row)
		
		
		GOTO SELECTED RECORD:C245([CONTACTS_2:8]; $row)
		
		ARRAY TEXT:C222(_attributes; 0)
		ARRAY TEXT:C222(_values; 0)
		
		ARRAY LONGINT:C221(_types; 0)
		
		OB GET PROPERTY NAMES:C1232([CONTACTS_2:8]Info:2; _attributes; _types)
		$n:=Size of array:C274(_attributes)
		ARRAY TEXT:C222(_values; $n)
		For ($i; 1; $n)
			Case of 
					
				: (_attributes{$i}="Gender")
					$bool:=OB Get:C1224([CONTACTS_2:8]Info:2; _attributes{$i})
					_values{$i}:=Choose:C955($bool; "Female"; "Male")
					
				: (_attributes{$i}="Birthday")
					$date:=OB Get:C1224([CONTACTS_2:8]Info:2; _attributes{$i}; Is date:K8:7)
					_values{$i}:=String:C10($date; System date short:K1:1)
					
				: (_attributes{$i}="Age")
					$age:=OB Get:C1224([CONTACTS_2:8]Info:2; _attributes{$i})
					_values{$i}:=String:C10($age)
					
					
					
				: (_types{$i}=Is text:K8:3)
					_values{$i}:=OB Get:C1224([CONTACTS_2:8]Info:2; _attributes{$i})
					
					
			End case 
		End for 
		
End case 
