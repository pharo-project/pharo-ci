printing
printList: aList named: name on: aStream
	aList ifEmpty: [ ^ self ].
	
	aStream 
		nextPutAll: name; cr;
		nextPutAll: ('' padLeftTo: name size with: $-); cr.
	aList
		do: [ :item | item printOn: aStream ]
		separatedBy: [ aStream cr ]