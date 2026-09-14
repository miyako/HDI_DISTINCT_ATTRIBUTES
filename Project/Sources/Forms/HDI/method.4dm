Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		var $vers : Text
		$vers:=Application version:C493
		
		If ($vers<Form:C1466.minimumVersion)  //1530 means 15R3   1501 means 15.1
			
			Form:C1466.quit:=True:C214
			OBJECT SET TITLE:C194(*; "BtnDemo"; Localized string("BtnClose"))
			OBJECT SET VISIBLE:C603(*; "TxtSorry@"; True:C214)
			OBJECT SET VISIBLE:C603(*; "TxtInfo@"; False:C215)
			
		Else 
			
			Form:C1466.quit:=False:C215
			
		End if 
		
End case 
