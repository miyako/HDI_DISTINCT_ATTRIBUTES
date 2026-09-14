//%attributes = {}

ARRAY TEXT:C222(tabControl; 0)
APPEND TO ARRAY:C911(tabControl; "Info")
APPEND TO ARRAY:C911(tabControl; "Example")
APPEND TO ARRAY:C911(tabControl; "Demo")

C_POINTER:C301($nil)

$fp:=Localized document path:C1105("txtInfo.txt")

If (Test path name:C476($fp)=Is a document:K24:1)
	textInfo:=Document to text:C1236($fp)
End if 
_O_PLATFORM PROPERTIES:C365(platform)
If (platform=Windows:K25:3)
	ST SET ATTRIBUTES:C1093(textInfo; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 13)
End if 

ALL RECORDS:C47([CONTACTS_2:8])