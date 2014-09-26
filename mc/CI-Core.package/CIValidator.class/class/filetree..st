instance creation
filetree: aDirectory
	| folder regex |
	
	folder := aDirectory asFileReference.
	regex := String streamContents: [ :s | 
		(folder children select: [ :e | e isDirectory and: [ ( e basename beginsWith: '.' ) not ]])
			do: [ :e | s << (e basename allButLast: 8) << '*' ]
			separatedBy: [ s << ' | ' ] ].
		
	^ self packageRegex: regex