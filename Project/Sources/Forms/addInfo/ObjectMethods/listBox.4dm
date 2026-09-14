Case of 
	: (Form event code:C388=On Double Clicked:K2:5)
		C_LONGINT:C283($col; $row)
		
		
		LISTBOX GET CELL POSITION:C971(*; "listBox"; $col; $row)
		//get the last cell clicked in order to get the attribute name
		If ($row>0)
			//if we click for an existing attribute in order to modify its value
			$newValue:=Request:C163("Value for "+_attributes{$row}+" for this contact")
			If (ok=1)
				OB SET:C1220([CONTACTS_2:8]Info:2; _attributes{$row}; $newValue)
				//we set a new value for the attribute
			End if 
			
		Else 
			//if we want to add new information / a new attribute for the contact
			$newAttribute:=Request:C163("Information name:")
			If (ok=1)
				$newValue:=Request:C163("Value for "+$newAttribute+" for this contact")
				If (ok=1)
					
					APPEND TO ARRAY:C911(_attributes; $newAttribute)
					APPEND TO ARRAY:C911(_values; $newValue)
					//visible in the listbox but can be cancelled if the user doesn't validate the dialog
					vModifCount:=vModifCount+1
					
				End if 
			End if 
		End if 
		
End case 