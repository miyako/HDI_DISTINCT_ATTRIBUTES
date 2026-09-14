

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		If (Records in table:C83([CONTACTS_2:8])=0)
			$path:=Folder:C1567(fk resources folder:K87:11).file("data.4ie").platformPath
			$project:=""
			IMPORT DATA:C665($path; $project)
		End if 
		
		hdi_init
		
		ARRAY TEXT:C222(_DistinctPath; 0)
		ARRAY TEXT:C222(_DistinctValues; 0)
		
		
		updateStat
		
	: (Form event code:C388=On Selection Change:K2:29)
		//update statistic information
		updateStat
		
		
	: (Form event code:C388=On Page Change:K2:54)
		
		//page 2 initialization
		If (FORM Get current page:C276=2)
			ALL RECORDS:C47([CONTACTS_2:8])
		End if 
		
		//page 3 initialization
		If (FORM Get current page:C276=3)
			
			// if the popup is empty
			If ((Size of array:C274(_DistinctPath)=0))
				ALERT:C41(Localized string:C991("AlertGoBackToExamplePage"))
			End if 
			
			//empty the listbox before any querry
			REDUCE SELECTION:C351([CONTACTS_2:8]; 0)
			
		End if 
		
End case 


