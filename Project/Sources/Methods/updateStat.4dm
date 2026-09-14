//%attributes = {}
C_LONGINT:C283(ageMax; ageMin; ageAverage)
C_TEXT:C284(vTextRecord)

// stats on the page 3 
vTextRecord:=String:C10(Records in selection:C76([CONTACTS_2:8]); "|LongInt")+" Records"


ageMin:=Min:C4([CONTACTS_2:8]Info:2; "Age")
ageMax:=Max:C3([CONTACTS_2:8]Info:2; "Age")
ageAverage:=Average:C2([CONTACTS_2:8]Info:2; "Age")

