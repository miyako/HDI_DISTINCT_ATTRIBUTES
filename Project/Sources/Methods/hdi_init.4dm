//%attributes = {"invisible":true}

var $fp : Text
var platform : Integer

ARRAY TEXT:C222(tabControl; 0)
APPEND TO ARRAY:C911(tabControl; Localized string:C991("HDI2_TabInfo"))
APPEND TO ARRAY:C911(tabControl; Localized string:C991("HDI2_TabExample"))
APPEND TO ARRAY:C911(tabControl; Localized string:C991("HDI2_TabDemo"))

$fp:=Localized document path:C1105("txtInfo.txt")

If (Test path name:C476($fp)=Is a document:K24:1)
	textInfo:=Document to text:C1236($fp)
End if 
_O_PLATFORM PROPERTIES:C365(platform)
If (platform=Windows:K25:3)
	ST SET ATTRIBUTES:C1093(textInfo; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 13)
End if 

ALL RECORDS:C47([CONTACTS_2:8])
