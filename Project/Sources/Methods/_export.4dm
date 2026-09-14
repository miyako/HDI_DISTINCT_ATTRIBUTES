//%attributes = {}
ALL RECORDS:C47([CONTACTS_2:8])
$json:=Selection to JSON:C1234([CONTACTS_2:8])
Folder:C1567(fk resources folder:K87:11).file("CONTACTS_2-en.json").setText($json)