
// select all records for a exhaustive list of attribute
ALL RECORDS:C47([CONTACTS_2:8])

//Fill the popup with distinct attribute paths existing in my object field
DISTINCT ATTRIBUTE PATHS:C1395([CONTACTS_2:8]Info:2; _DistinctPath)

// Select the first element in the popup
_DistinctPath:=1
