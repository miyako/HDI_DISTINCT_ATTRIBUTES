var $szArray; $i : Integer

$szArray:=Size of array:C274(_attributes)

If (vModifCount>1)
	For ($i; 1; vModifCount)
		
		DELETE FROM ARRAY:C228(_values; $szArray)
		DELETE FROM ARRAY:C228(_attributes; $szArray)
		
	End for 
End if 

CANCEL:C270
